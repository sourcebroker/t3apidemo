import InitializerList from '../InitializerList/InitializerList';
import AbstractModel from './Model/AbstractModel';


@InitializerList({
    'hydra:first': 'first',
    'hydra:last': 'last',
    'hydra:next': 'next',
    'hydra:prev': 'prev',
    'hydra:pages': 'pages',
    'hydra:page': 'page',
})
class HydraView
{

    /**
     * Url of the first pagination page
     */
    public first : string = '';

    /**
     * Url of the last pagination page
     */
    public last : string = '';

    /**
     * Url of the next pagination page
     */
    public next : string = '';

    /**
     * Url of the previous pagination page
     */
    public prev : string = '';

    /**
     * Array with URLs of all pagination pages
     */
    public pages : string[] = [];

    /**
     * Number of current page (starting from 1)
     */
    public page : number = 1;

    public get hasNext() : boolean
    {
        return !!this.next;
    }

    public get hasPrev() : boolean
    {
        return !!this.prev;
    }

}


@InitializerList({
    'hydra:member': 'member',
    'hydra:totalItems': 'totalItems',
    'hydra:view': 'view',
})
class HydraResponse
{

    public member : AbstractModel<any>[] = [];

    public totalItems : number = 0;

    public view : HydraView = null;

    constructor(data? : Partial<HydraResponse>) {}

}


export default HydraResponse;
