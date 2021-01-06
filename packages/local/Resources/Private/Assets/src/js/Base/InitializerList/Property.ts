import 'reflect-metadata';
import PropertyDescriptor, { PropertyDescriptorOptions } from './PropertyDescriptor';


export const PropertySymbol = Symbol('Property');

function Property(Type : Function = undefined, options : PropertyDescriptorOptions = {})
{
    return function(Target, property, descriptor) {
        const TargetProto = Target.constructor.prototype;

        if (!TargetProto[PropertySymbol]) {
            TargetProto[PropertySymbol] = {};
        }

        if (!Type && !options.preserveRaw) {
            Type = Reflect.getMetadata('design:type', Target, property);
        }

        TargetProto[PropertySymbol][property] = new PropertyDescriptor(Type, options);

        // make available for vue
        if (descriptor instanceof Object) {
            descriptor.configurable = true;
        }

        return descriptor;
    };
}

export default Property;
