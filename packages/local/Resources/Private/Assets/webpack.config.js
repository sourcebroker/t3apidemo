const Encore = require('@symfony/webpack-encore');

if (!Encore.isRuntimeEnvironmentConfigured()) {
    Encore.configureRuntimeEnvironment(process.env.NODE_ENV || 'dev')
}

// enables hot reload for css https://github.com/symfony/webpack-encore/issues/348
if (!Encore.isProduction()) {
    Encore.disableCssExtraction()
}

Encore
    .setOutputPath('/var/www/html/public/typo3conf/ext/local/Resources/Public/Frontend/')
    .setPublicPath('/typo3conf/ext/local/Resources/Public/Frontend/')
    .addEntry('app', './src/js/main.js')
    .enableSingleRuntimeChunk()
    .splitEntryChunks()
    .cleanupOutputBeforeBuild()
    .enableBuildNotifications()
    .enableSourceMaps(!Encore.isProduction())
    .enableVueLoader(() => {}, {runtimeCompilerBuild: false})
    .enableSassLoader()
    .enablePostCssLoader()
    .configureTerserPlugin((config) => {
        config.terserOptions = {...config.terserOptions, keep_classnames: true, keep_fnames: true}
    })
    .configureDefinePlugin(
        (defined) => {
            return {
                ...defined,
                API_BASE_URL: "'/'",
                REST_API_BASE_URL: "'/_api/'"
            };
        }
    )
    .autoProvidejQuery()

module.exports = Encore.getWebpackConfig();
