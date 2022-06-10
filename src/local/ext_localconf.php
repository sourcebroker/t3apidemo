<?php

defined('TYPO3') or die();

\TYPO3\CMS\Core\Utility\ExtensionManagementUtility::addPageTSConfig(
    '<INCLUDE_TYPOSCRIPT: source="DIR:EXT:local/Configuration/TsConfig/Page/" extensions="tsconfig">'
);

\TYPO3\CMS\Extbase\Utility\ExtensionUtility::configurePlugin(
    'Local',
    'Plugin',
    [
        \V\Local\Controller\NewsController::class => 'list',
    ],
    []
);

$GLOBALS['TYPO3_CONF_VARS']['EXTCONF']['t3api']['serializerSubscribers'][] = V\Local\T3api\Serializer\Subscriber\GenerateMetadataSubscriber::class;
