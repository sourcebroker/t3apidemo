import Vue from 'vue'

Vue.filter('implode', (array: Array<any>, glue: string = ', ', field: string = null) => {
    return array
        .filter(item => !!item)
        .map(item => !field ? item : field.split('.').reduce((o, i) => (typeof o !== 'undefined' ? o : {})[i], item))
        .join(glue)
})
