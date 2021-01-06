import HydraResponse from './HydraResponse';
import AbstractModel from './Model/AbstractModel';


type ConstructorType = {
    new(...args : any[]) : any
};

type Models = {
    [modelType : string] : ConstructorType
};

export default class DataMapper
{

    static models : Models = {};

    static register(model, apiResourceName)
    {
        DataMapper.models[apiResourceName] = model;
    }

    /**
     * Convert collection - hydra format => component format
     */
    public static mapCollection(data : HydraResponse) : HydraResponse
    {
        data['hydra:member'] = data['hydra:member'].map(json => DataMapper.mapItem(json));
        return new HydraResponse(data);
    }

    /**
     * Convert item - hydra format => component format
     */
    static mapItem(object : Object, Model : ConstructorType = null) : AbstractModel<any> | Object
    {
        // try to get model by provided @type
        if (!Model) {
            const type = object['@type'];
            if (!type || !DataMapper.models[type]) {
                return object;
            }

            Model = DataMapper.models[type];
        }

        return new Model(object);
    }
}
