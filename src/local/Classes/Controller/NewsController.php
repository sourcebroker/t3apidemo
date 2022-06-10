<?php

namespace V\Local\Controller;

use Psr\Http\Message\ResponseInterface;
use GeorgRinger\News\Domain\Model\News;
use GeorgRinger\News\Domain\Repository\NewsRepository;
use TYPO3\CMS\Extbase\Mvc\Controller\ActionController;

class NewsController extends ActionController
{
    /**
     * @var NewsRepository
     */
    protected NewsRepository $newsRepository;

    public function __construct(NewsRepository $newsRepository)
    {
        $this->newsRepository = $newsRepository;
    }

    public function listAction(): ResponseInterface
    {
        $itemsPerPage = (int)$this->settings['newsList']['itemsPerPage'];
        $this->view->assign('componentData', [
            'metadata' => [
                'itemsPerPage' => $itemsPerPage,
                'totalItems' => $this->newsRepository->countAll(),
            ],
        ]);
        return $this->htmlResponse();
    }

    public function detailsAction(News $news): ResponseInterface
    {
        $this->view->assignMultiple([
            'news' => $news,
        ]);
        return $this->htmlResponse();
    }

}
