import DataMapper from '../DataMapper';


function ApiModel(apiResourceName)
{
    return function(target) {
        let extendedClass = class ApiModel extends target
        {
            constructor(...args)
            {
                super(...args);

                let raw = args[0] || {};
                if (typeof raw == 'string') {
                    this['@id'] = raw;
                }
            }
        };

        if (!apiResourceName) {
            apiResourceName = target.name;
        }

        if (apiResourceName instanceof Array) {
            apiResourceName.forEach((name) => {
                DataMapper.register(extendedClass, name);
            });
        }
        else {
            DataMapper.register(extendedClass, apiResourceName);
        }

        return extendedClass;
    };
}

export default ApiModel;
