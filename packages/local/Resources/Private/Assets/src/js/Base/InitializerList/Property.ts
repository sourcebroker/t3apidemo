import PropertyDescriptor from './PropertyDescriptor'
import { PropertyDescriptorOptions } from './PropertyDescriptor'

export const PropertySymbol = Symbol('Property');

function Property (type : Function = null, options : PropertyDescriptorOptions = {}) {
    return function (Target, property, descriptor) {
        const TargetProto = Target.constructor.prototype;

        if (!TargetProto[PropertySymbol]) {
            TargetProto[PropertySymbol] = {};
        }

        TargetProto[PropertySymbol][property] = new PropertyDescriptor(type, options);

        // make available for vue
        descriptor.configurable = true

        return descriptor
    }
}

export default Property;
