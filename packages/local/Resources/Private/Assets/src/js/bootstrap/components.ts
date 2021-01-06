import Vue from 'Base/Vue';
import BaseComponent from 'Base/Vue/Component.vue';

/*
 * Load root modules
 */
function loadModules(require)
{
    const modules = [];
    require.keys().forEach((entry) => {
        if (!!entry) {
            modules.push(require(entry));
        }
    });
    return modules;
}

loadModules((<any> require).context('..', true, /\.vue/))
    .forEach((componentModule) => {
        const Component = <any>componentModule.default;
        if (!Component) {
            return;
        }

        // try to mount only mountable components
        if (Component.MOUNT_ON) {
            const domElements = document.querySelectorAll(Component.MOUNT_ON);
            for (const domElement of domElements) {
                const data = Object.assign({}, domElement.dataset)

                // fetch router
                const router = componentModule.router
                    ? componentModule.router(data)
                    : undefined

                new Vue({
                    render: (h) => h(Component),
                    router,
                    data: () => data,
                })
                    .$mount(domElement);
            }
        }
    });
