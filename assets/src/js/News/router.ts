import VueRouter from 'vue-router';
import List from './Component/List.vue';

const routes = [
    {
        path: '/',
        name: 'index',
        component: List,
    },
]

export default (data) => {
    return new VueRouter({
        mode: 'history',
        routes,
        ...data
    })
};
