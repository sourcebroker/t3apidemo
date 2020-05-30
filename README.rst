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

`https://t3api-demo.ddev.site/_api/ <https://t3api-demo.ddev.site/_api/>`_

As simple example to get all news just run:

`https://t3api-demo.ddev.site/_api/news/news <https://t3api-demo.ddev.site/_api/news/news>`_

and to get all categories just run:

`https://t3api-demo.ddev.site/_api/news/categories <https://t3api-demo.ddev.site/_api/news/categories>`_

The TYPO3 backend can be accessed with username: ``admin`` and password: ``password`` at:

`https://t3api-demo.ddev.site/typo3/ <https://t3api-demo.ddev.site/typo3/>`_

You can go to backend module ``Admin Tools > Web API`` and see the Swagger admin panel that allows to do operation on API.

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

See https://github.com/sourcebroker/t3api-demo/blob/master/CHANGELOG.rst
