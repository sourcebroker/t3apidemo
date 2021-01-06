import AbstractService from './AbstractService';
import DataMapper from './DataMapper';
import Params from './Params';
import AbstractModel from './Model/AbstractModel';
import HydraResponse from './HydraResponse';
import { AxiosRequestConfig } from 'axios';

declare var REST_API_BASE_URL: string;


abstract class AbstractRestService extends AbstractService
{

    protected static readonly BASE_URL : string = REST_API_BASE_URL;

    public lastCollectionResponse : HydraResponse = null;

    /**
     * Request t3api collection
     */
    public fetchCollection(url : string, config : AxiosRequestConfig = {}) : Promise<AbstractModel<any>[]>
    {
        if (config && config.params && config.params instanceof Params) {
            config.params = config.params.toJSON();
        }

        return this.http.get(url, config)
            .then(({ data }) => {
                this.lastCollectionResponse = DataMapper.mapCollection(data);
                return this.lastCollectionResponse.member;
            });
    }

    public fetchCollectionNextPage(): Promise<AbstractModel<any>[]>
    {
        if (!this.lastCollectionResponse || !this.lastCollectionResponse.view.hasNext) {
            // @todo return Promise
        }

        // @todo remove only path of baseURL because it could contain domain also
        return this.fetchCollection(this.lastCollectionResponse.view.next, { baseURL: '' });
    }

    public fetchCollectionPrevPage(): Promise<AbstractModel<any>[]>
    {
        if (!this.lastCollectionResponse || !this.lastCollectionResponse.view.hasPrev) {
            // @todo return Promise
        }

        // @todo remove only path of baseURL because it could contain domain also
        return this.fetchCollection(this.lastCollectionResponse.view.prev, { baseURL: '' });
    }

    public fetchCollectionPage(pageIndex : number): Promise<AbstractModel<any>[]>
    {
        if (!this.lastCollectionResponse || !this.lastCollectionResponse.view.pages[pageIndex]) {
            // @todo return Promise
        }

        // @todo remove only path of baseURL because it could contain domain also
        return this.fetchCollection(this.lastCollectionResponse.view.pages[pageIndex], { baseURL: '' });
    }

    /**
     * Request t3api single element
     */
    public fetchItem(path : string, config : AxiosRequestConfig = {}): Promise<AbstractModel<any>|Object>
    {
        return this.http.get(path, config)
            .then(({ data }) => DataMapper.mapItem(data));
    }

    public pushItem(path : string, entity: AbstractModel<any>): Promise<AbstractModel<any>|Object>
    {
        if (entity.uid) {
            return this.http.patch(path + '/' + entity.uid, entity)
                .then(({ data }) => DataMapper.mapItem(data));
        }
        else {
            return this.http.post(path, entity)
                .then(({ data }) => DataMapper.mapItem(data));

        }
    }

    public deleteItem(path : String, entity: AbstractModel<any>): Promise<null>
    {
        return this.http.delete(path + '/' + entity.uid);
    }
}


export default AbstractRestService;
