const Encore = require('@symfony/webpack-encore');

if (!Encore.isRuntimeEnvironmentConfigured()) {
    Encore.configureRuntimeEnvironment(process.env.NODE_ENV || 'dev')
}

// enables hot reload for css https://github.com/symfony/webpack-encore/issues/348
if (!Encore.isProduction()) {
    Encore.disableCssExtraction()
}

Encore
    .setOutputPath('../public/assets/frontend/build/')
    .setPublicPath('/assets/frontend/build')
    .addEntry('app', './src/js/main.ts')
    .enableSingleRuntimeChunk()
    .splitEntryChunks()
    .cleanupOutputBeforeBuild()
    .enableBuildNotifications()
    .enableTypeScriptLoader()
    .enableForkedTypeScriptTypesChecking()
    .enableSourceMaps(!Encore.isProduction())
    .enableVueLoader(() => {}, {
        runtimeCompilerBuild: false,
        useJsx: true,
    })
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

const config = Encore.getWebpackConfig()

config.resolve.modules = [ 'node_modules', 'src/js' ]

module.exports = config
