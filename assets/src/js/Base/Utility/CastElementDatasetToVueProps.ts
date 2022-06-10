/**
 * @param {Object|Array} propsDefinition
 * @param {DOMStringMap} dataset
 * @return {Object}
 *
 * @see https://vuejs.org/v2/guide/components-props.html#Prop-Types
 */
export default function castElementDatasetToVueProps (propsDefinition, dataset) {
    const props = {}
    Object.keys(dataset).forEach(property => {
        const rawValue = dataset[property]
        if (propsDefinition instanceof Array) {
            if (propsDefinition.indexOf(property) !== -1) {
                props[property] = rawValue
            }
            return
        }

        if (typeof propsDefinition[property] === 'undefined') {
            return
        }

        const type = propsDefinition[property] instanceof Object && propsDefinition[property].type
            ? propsDefinition[property].type
            : propsDefinition[property]
        let value = null

        switch (type) {
            case Number:
                value = +rawValue
                break
            case String:
                value = rawValue.toString()
                break
            case Boolean:
                if (['false', 0, '0', null, undefined, false].indexOf(rawValue) !== -1) {
                    value = false
                }
                else if (['true', 1, '1', true].indexOf(rawValue) !== -1) {
                    value = true
                }
                else {
                    value = !!rawValue
                }
                break
            // @todo add other types if needed
        }

        props[property] = value
    })

    return props
}
