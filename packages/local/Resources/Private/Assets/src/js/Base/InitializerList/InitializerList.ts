import PropertyDescriptor from './PropertyDescriptor';
import { PropertySymbol } from './Property';


type ConstructorType = { new(...args : any[]) : any };

type Properties = { [index : string] : PropertyDescriptor };

type Mapping = {
    [property : string] : string
};

class Initializer {

    public static initializeObject(data : Object, mapping : Object = {})
    {
        if (!data) {
            return;
        }

        const Target = Object.getPrototypeOf(this);
        const properties : Properties = Target[PropertySymbol] || {};

        Object.keys(data)
            .forEach(fieldName => {
                const rawValue = data[fieldName];

                const property = mapping[fieldName]
                    ? mapping[fieldName]
                    : fieldName;

                if (!this.hasOwnProperty(property)) {
                    return;
                }

                let propertyDsrp;
                if (properties[property]) {
                    propertyDsrp = properties[property];
                }
                else {
                    propertyDsrp = new PropertyDescriptor();
                }

                // null value case
                if (rawValue === null) {
                    if (!propertyDsrp.isNullable) {
                        // property not nullable
                        throw `Property ${property} can not be set to null`;
                    }

                    this[property] = null;
                }
                // primitive values stay "simple"
                else if (propertyDsrp.isPrimitive) {
                    if (propertyDsrp.type === Boolean) {
                        this[property] = !!rawValue;
                    }
                    else if (propertyDsrp.type === Number) {
                        this[property] = +rawValue;
                    }
                    else {
                        this[property] = rawValue;
                    }
                }
                else {
                    // array case
                    if (propertyDsrp.isArray) {
                        this[property] = [];

                        if (rawValue instanceof Array) {
                            rawValue.forEach((elm) => {
                                let subElm = new (propertyDsrp.type)(elm);
                                this[property].push(subElm);
                            });
                        }
                        else if (typeof rawValue == 'object') {
                            Object.keys(rawValue).forEach((idx) => {
                                let subElm = new (propertyDsrp.type)(rawValue[idx]);
                                this[property].push(subElm);
                            });
                        }
                    }
                    // mapping objects
                    else {
                        this[property] = new (propertyDsrp.type)(rawValue);
                    }
                }
            });
    }

}

function InitializerList(mapping : Mapping = {})
{
    return <T extends ConstructorType>(Target : T) => {
        return class extends Target
        {
            constructor(...args : any[])
            {
                super(...args);

                if (typeof args[0] === 'object' && args instanceof Object) {
                    const data = args[0];
                    Initializer.initializeObject.call(this, data, mapping);
                }
            }
        };
    };
}

export default InitializerList;
