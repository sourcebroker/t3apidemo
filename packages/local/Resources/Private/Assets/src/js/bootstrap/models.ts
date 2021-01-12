/*
 * Load root modules
 */
function loadModules(require)
{
    const modules = [];
    require.keys().forEach((entry) => {
        if (!!entry && entry.indexOf('/Model/') !== -1) {
            modules.push(require(entry));
        }
    });
    return modules;
}

loadModules(require.context('..', true, /\.ts/));
