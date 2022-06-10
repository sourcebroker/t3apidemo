import DataMapper from '../DataMapper';


interface ConstructorType extends Function
{
    new(...args : any[]) : any;
}


function ApiModel(apiResourceName = null)
{
    return (Target : ConstructorType) => {
        const ExtClass = class ApiModel extends Target {
            constructor(...args)
            {
                super(...args);

                let raw = args[0] || {};
                if (typeof raw == 'string') {
                    this['@id'] = raw;
                }
            }
        };

        Object.defineProperty (ExtClass, 'name', { value: Target.name });

        if (apiResourceName) {
            if (apiResourceName instanceof Array) {
                apiResourceName.forEach((name) => {
                    DataMapper.register(ExtClass, name);
                });
            }
            else {
                DataMapper.register(ExtClass, apiResourceName);
            }
        }

        return ExtClass;
    };
}

export default ApiModel;
