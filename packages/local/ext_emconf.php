<?php

########################################################################
# Extension Manager/Repository config file for ext "local".
#
# Manual updates:
# Only the data in the array - everything else is removed by next
# writing. "version" and "dependencies" must not be touched!
########################################################################

$EM_CONF['local'] = [
    'title' => 'Website extension',
    'description' => 'Central extension for all mods connected with this specific TYPO3 instance',
    'category' => 'misc',
    'state' => 'excludeFromUpdates',
    'clearcacheonload' => 1,
    'author_email' => '',
    'author_company' => '',
    'version' => '1.0.0',
    'constraints' => [
        'depends' => [
        ],
        'conflicts' => [],
        'suggests' => [],
    ],
];
