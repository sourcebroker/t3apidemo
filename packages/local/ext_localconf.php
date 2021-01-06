<?php

defined('TYPO3_MODE') or die();

\TYPO3\CMS\Core\Utility\ExtensionManagementUtility::addPageTSConfig(
    '<INCLUDE_TYPOSCRIPT: source="DIR:EXT:local/Configuration/TsConfig/Page/" extensions="tsconfig">'
);


\TYPO3\CMS\Extbase\Utility\ExtensionUtility::configurePlugin(
    'V.Local',
    'Plugin',
    [
        'News' => 'list',
    ],
    []
);
