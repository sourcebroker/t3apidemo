<?php

\TYPO3\CMS\Extbase\Utility\ExtensionUtility::registerPlugin(
    'Local',
    'Plugin',
    'Local ext main plugin'
);

$GLOBALS['TCA']['tt_content']['types']['list']['subtypes_excludelist']['local_plugin'] = 'recursive,select_key,pages';
$GLOBALS['TCA']['tt_content']['types']['list']['subtypes_addlist']['local_plugin'] = 'pi_flexform';

\TYPO3\CMS\Core\Utility\ExtensionManagementUtility::addPiFlexFormValue(
    'local_plugin',
    'FILE:EXT:local/Configuration/FlexForms/flexform_plugin.xml'
);
