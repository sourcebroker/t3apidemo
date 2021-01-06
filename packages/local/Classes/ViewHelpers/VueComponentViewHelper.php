<?php

namespace V\Local\ViewHelpers;

use TYPO3\CMS\Core\Resource\File;
use TYPO3\CMS\Extbase\DomainObject\DomainObjectInterface;
use TYPO3\CMS\Extbase\Mvc\Request;
use TYPO3\CMS\Extbase\Reflection\ObjectAccess;
use TYPO3Fluid\Fluid\Core\ViewHelper\AbstractViewHelper;
use TYPO3Fluid\Fluid\Core\ViewHelper\TagBuilder;
use V\Local\Utility\LocalizationUtility;

class VueComponentViewHelper extends AbstractViewHelper
{

    protected $escapeOutput = false;

    /** @var array */
    protected $translationsPackagesIncluded = [];

    public function initializeArguments()
    {
        $this->registerArgument('id', 'string', 'Identifier', false);
        $this->registerArgument('class', 'string', 'Class', false);

        $this->registerArgument('data', 'mixed', 'Data which will be JSON encoded');
        $this->registerArgument('translations', 'array', 'Required translations');
    }

    public function render()
    {
        $html = '';

        /** @var Request $request */
        $request = $this->renderingContext->getControllerContext()->getRequest();
        $extensionKey = $this->arguments['extensionName'] ?? $request->getControllerExtensionKey();
        $languageKey = $GLOBALS['TSFE']->sys_language_isocode;

        // input data
        $dataScriptTagId = null;

        if (!empty($this->arguments['data'])) {
            $dataScriptTagId = md5(uniqid());

            $data = $this->createInputData($this->arguments['data']);
            $dataJson = json_encode($data, JSON_HEX_AMP | JSON_HEX_QUOT | JSON_HEX_APOS | JSON_HEX_TAG);
            $html .= <<<HTML
<script type="application/json" id="${dataScriptTagId}">${dataJson}</script>
HTML;
        }

        // required translations
        $translations = $this->arguments['translations'];
        $translations[] = $extensionKey . ':vue';

        foreach ($translations as $extension) {
            $alreadyIncluded = $this->wasTranslationPackageAlreadyIncluded($extension);
            if ($alreadyIncluded) {
                continue;
            }

            $this->translationsPackagesIncluded[$extension] = true;

            // parse required translation
            $translationInfo = explode(':', $extension);
            if (count($translationInfo) == 1) {
                array_unshift($translationInfo, $extensionKey);
            }

            [$transExtension, $transPackage] = $translationInfo;

            // load translation keys
            $entries = LocalizationUtility::loadTranslationPackage($transExtension, $languageKey, $transPackage);
            if ($transPackage !== 'locallang') {
                $packageEntries = LocalizationUtility::loadTranslationPackage($transExtension, $languageKey, $transPackage);
                $entries = array_merge(
                    $entries,
                    $packageEntries
                );
            }

            $dataJson = $this->createTranslationsJson($entries, $transPackage);
            if ($dataJson) {
                $html .= <<<HTML
<script type="application/json" class="vue-translation-package">${dataJson}</script>
HTML;
            }
        }

        // display component div
        $tag = new TagBuilder('div');
        $tag->forceClosingTag(true);

        if (!empty($this->arguments['id'])) {
            $tag->addAttribute('id', $this->arguments['id']);
        }
        if (!empty($this->arguments['class'])) {
            $tag->addAttribute('class', $this->arguments['class']);
        }
        if ($dataScriptTagId) {
            $tag->addAttribute('data-script-tag-id', $dataScriptTagId);
        }

        $html .= $tag->render();

        return $html;
    }

    protected function createInputData($data)
    {
        if ($data instanceof \DateTime) {
            return intval($data->format('U')) * 1000;
        }
        if ($data instanceof \Traversable) {
            $data = iterator_to_array($data, false);
        } elseif ($data instanceof File) {
            $data = $data->getPublicUrl();
        } elseif ($data instanceof DomainObjectInterface) {
            $data = ObjectAccess::getGettableProperties($data);

            foreach ($data as $key => $possibleDomainObject) {
                if ($possibleDomainObject instanceof DomainObjectInterface) {
                    $data[$key] = $this->createInputData($possibleDomainObject);
                } elseif (true === $possibleDomainObject instanceof \Traversable) {
                    $traversableAsArray = iterator_to_array($possibleDomainObject, false);
                    $data[$key] = $this->createInputData($traversableAsArray);
                }
            }
        }

        if (is_array($data)) {
            foreach ($data as &$property) {
                $property = $this->createInputData($property);
            }
        }

        return $data;
    }

    protected function wasTranslationPackageAlreadyIncluded(string $package): bool
    {
        $offset = 0;

        while (true) {
            $pos = strpos($package, '.', $offset);

            $packageToCheck = $pos !== false
                ? substr($package, 0, $pos)
                : $package;

            if (isset($this->translationsPackagesIncluded[$packageToCheck])) {
                return true;
            }

            $offset = $pos + 1;
            if ($pos === false) {
                break;
            }
        }

        return false;
    }

    protected function loadTranslations(string $translationPath)
    {
        LocalizationUtility::translate("$translationPath:key");
    }

    protected function createTranslationsJson(array $entries, string $package): ?string
    {
        $data = [];

        foreach ($entries as $key => $entry) {
            if (strpos($key, $package) !== 0) {
                continue;
            }

            $path = explode('.', $key);
            $this->createTranslationsJsonTraverse($data, $path, $entry[0]['target'] ?? $entry[0]['source']);
        }

        if (!$data) {
            return null;
        }

        return json_encode($data);
    }

    protected function createTranslationsJsonTraverse(array &$data, array $path, string $value): void
    {
        $node = array_shift($path);

        if (empty($path)) {
            // last node (leaf) with @
            $data[$node] = ['@' => $value];
            return;
        }

        if (!isset($data[$node])) {
            $data[$node] = [];
        }

        $this->createTranslationsJsonTraverse($data[$node], $path, $value);
    }
}
