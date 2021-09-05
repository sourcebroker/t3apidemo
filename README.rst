DDEV Demo of TYPO3 Extension t3api
==================================

.. contents:: :local:

This is a demo and testing area for functionality of ``ext:t3api``. The testing is done on model of ``ext:news``.
The extension responsible for enabling API configuration for ``ext:news`` models is ``ext:t3apinews``.

Prerequisites
#############

* Install docker
* Install ddev

Quickstart
##########

After cloning repo run:

``ddev start``

The API is available at:

`https://t3apidemo.ddev.site/_api/ <https://t3apidemo.ddev.site/_api/>`_

The TYPO3 backend can be accessed with username: ``admin`` and password: ``password`` at:

`https://t3apidemo.ddev.site/typo3/ <https://t3apidemo.ddev.site/typo3/>`_

You can go to backend module ``Admin Tools > Web API`` and see the Swagger admin panel that allows to do operation on API.

Examples
########

* Get list of news `https://t3apidemo.ddev.site/_api/news/news <https://t3apidemo.ddev.site/_api/news/news>`_
* Get single news `https://t3apidemo.ddev.site/_api/news/news/1 <https://t3apidemo.ddev.site/_api/news/news/1>`_
* Get list of categories `https://t3apidemo.ddev.site/_api/news/categories <https://t3apidemo.ddev.site/_api/news/categories>`_
* Get list of news sorted by title `https://t3apidemo.ddev.site/_api/news/news?order[title]=asc <https://t3apidemo.ddev.site/_api/news/news?order[title]=asc>`_ or by datetime `https://t3apidemo.ddev.site/_api/news/news?order[datetime]=asc <https://t3apidemo.ddev.site/_api/news/news?order[datetime]=asc>`_ or make multiple ordering `https://t3apidemo.ddev.site/_api/news/news?order[title]=asc&order[datetime]=asc <https://t3apidemo.ddev.site/_api/news/news?order[title]=asc&order[datetime]=asc>`_
  The sorting is configured simply by annotation. You do not have to implement anything!
  ::

   * @T3api\ApiFilter(
   *     OrderFilter::class,
   *     properties={"uid","title","datetime"}
   * )


* Get list of news filtered by search word https://t3apidemo.ddev.site/_api/news/news?search=minima
  The search fields are configured simply by annotation. As you see you can even search by tags.

  ::

     * @T3api\ApiFilter(
     *     SearchFilter::class,
     *     properties={
     *          "title": "partial",
     *          "alternativeTitle": "partial",
     *          "bodytext": "partial",
     *          "tags.title": "partial",
     *     },
     *     arguments={
     *          "parameterName": "search",
     *     }
     * )

* Get list of news from defined pid `https://t3apidemo.ddev.site/_api/news/news?pid=6 <https://t3apidemo.ddev.site/_api/news/news?pid=6>`_
  When defining ``@T3api\ApiResource`` you can set possible values for storagePid.

  ::

   * @T3api\ApiResource(
   *     attributes={
   *          "persistence"={
   *              "storagePid"="3,6",
   *              "recursive"=1
   *          }
   *     }
   * )

* Get defined single news in one API call (with support for multilang - translated records have different uids) `https://t3apidemo.ddev.site/_api/news/news?uid[]=1&uid[]=2&uid[]=3 <https://t3apidemo.ddev.site/_api/news/news?uid[]=1&uid[]=2&uid[]=3>`_

  ::

   * @T3api\ApiFilter(
   *     UidFilter::class,
   *     properties={"uid"}
   * )

* Get news from between two dates `https://t3apidemo.ddev.site/_api/news/news?datetime[between]=2020-05-28T21:35:55.000..2020-05-29T21:20:00.000 <https://t3apidemo.ddev.site/_api/news/news?datetime[between]=2020-05-28T21:35:55.000..2020-05-29T21:20:00.000>`_

  ::

   * @T3api\ApiFilter(
   *     RangeFilter::class,
   *     properties={
   *       "datetime": "datetime"
   *     }
   * )

Running postman tests
#####################

You can load postman collection into your local Postman client and test the API: ``test/postman/t3apinews.postman_collection.json``

If you have no local Postman client you can run test from cli level using newman (cli agent for Postman). To do it run: ``ddev newman``. For first run the node modules are installed (inside web container) and then tests are done.

The postman tests are also automatically run on every push to this repo using github actions.

Refresh
#######

If you feel like you made a mess while testing API you can always refresh whole project - clean database and files- with command ``ddev refresh-project``.

Changelog
#########

See https://github.com/sourcebroker/t3apidemo/blob/master/CHANGELOG.rst
