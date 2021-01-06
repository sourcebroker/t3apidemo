import 'reflect-metadata';
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

        const Target = this.constructor;
        const properties : Properties = Target[PropertySymbol];

        Object.keys(data)
            .forEach(fieldName => {
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
                    const Type = Reflect.getMetadata('design:type', Target, property);
                    propertyDsrp = new PropertyDescriptor(Type);
                }

                // null value case
                if (data[fieldName] === null) {
                    if (!propertyDsrp.isNullable) {
                        // property not nullable
                        throw `Property ${property} can not be set to null`;
                    }

                    this[property] = null;
                }
                // primitive values stay "simple"
                else if (propertyDsrp.isPrimitive) {
                    if (propertyDsrp.type === Boolean) {
                        this[property] = !!data[fieldName];
                    }
                    else if (propertyDsrp.type === Number) {
                        this[property] = +data[fieldName];
                    }
                    else {
                        this[property] = data[fieldName];
                    }
                }
                else {
                    // array case
                    if (propertyDsrp.isArray) {
                        this[property] = [];

                        if (data[fieldName] instanceof Array) {
                            data[fieldName].forEach((elm) => {
                                let subElm = new (propertyDsrp.type)(elm);
                                this[property].push(subElm);
                            });
                        }
                        else if (typeof data[fieldName] == 'object') {
                            Object.keys(data[fieldName]).forEach((idx) => {
                                let subElm = new (propertyDsrp.type)(data[fieldName][idx]);
                                this[property].push(subElm);
                            });

                        }
                    }
                    // mapping objects
                    else {
                        this[property] = new (propertyDsrp.type)(data[fieldName]);
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
