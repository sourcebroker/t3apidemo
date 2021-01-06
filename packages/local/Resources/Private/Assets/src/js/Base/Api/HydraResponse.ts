import InitializerList from '../InitializerList/InitializerList';
import AbstractModel from './Model/AbstractModel';
import Property from '../InitializerList/Property';


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
    @Property()
    public first : string = '';

    /**
     * Url of the last pagination page
     */
    @Property()
    public last : string = '';

    /**
     * Url of the next pagination page
     */
    @Property()
    public next : string = '';

    /**
     * Url of the previous pagination page
     */
    @Property()
    public prev : string = '';

    /**
     * Array with URLs of all pagination pages
     */
    @Property()
    public pages : string[] = [];

    /**
     * Number of current page (starting from 1)
     */
    @Property()
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

    @Property(null, { isArray: true, preserveRaw: true })
    public member : AbstractModel<any>[] = [];

    @Property()
    public totalItems : number = 0;

    @Property()
    public view : HydraView = new HydraView();

    constructor(data? : Partial<HydraResponse>) {}

}


export default HydraResponse;
