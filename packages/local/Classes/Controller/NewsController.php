<?php

namespace V\Local\Controller;

use GeorgRinger\News\Domain\Model\News;
use GeorgRinger\News\Domain\Repository\NewsRepository;
use TYPO3\CMS\Extbase\Annotation\Inject;
use TYPO3\CMS\Extbase\Mvc\Controller\ActionController;

class NewsController
    extends ActionController
{

    /**
     * @var NewsRepository
     * @Inject()
     */
    protected $newsRepository;


    public function listAction()
    {
        $itemsPerPage = (int)$this->settings['newsList']['itemsPerPage'];
        $this->view->assign('componentData', [
            'metadata' => [
                'itemsPerPage' => $itemsPerPage,
                'totalItems' => $this->newsRepository->countAll(),
            ],
        ]);
    }

    public function detailsAction(News $news)
    {
        $this->view->assignMultiple([
            'news' => $news,
        ]);
    }

}
