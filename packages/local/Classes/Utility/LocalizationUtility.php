<?php

namespace V\Local\Utility;

class LocalizationUtility extends \TYPO3\CMS\Extbase\Utility\LocalizationUtility
{

    public static function loadTranslationPackage(string $extensionName, string $languageKey, string $packageFile = 'locallang'): array
    {
        $locallangPath = static::$locallangPath;
        $languageFilePath = "EXT:$extensionName/${locallangPath}$packageFile.xlf";

        static::initializeLocalization($languageFilePath, $languageKey, ['default'], $extensionName);

        $merged = array_merge(
            static::$LOCAL_LANG[$languageFilePath]['default'],
            static::$LOCAL_LANG[$languageFilePath][$languageKey]
        );

        return $merged ?? [];
    }

}
