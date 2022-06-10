import 'reflect-metadata';
import PropertyDescriptor, { PropertyDescriptorOptions } from './PropertyDescriptor';


export const PropertySymbol = Symbol('Property');

function Property(options : PropertyDescriptorOptions = {})
{
    return function(Target, property, descriptor) {
        const TargetProto = Target.constructor.prototype;

        if (!TargetProto[PropertySymbol]) {
            TargetProto[PropertySymbol] = {};
        }

        if (!options.type && !options.preserveRaw) {
            options.type = Reflect.getMetadata('design:type', Target, property);
        }

        TargetProto[PropertySymbol][property] = new PropertyDescriptor(options);

        // make available for vue
        if (descriptor instanceof Object) {
            descriptor.configurable = true;
        }

        return descriptor;
    };
}

export default Property;
