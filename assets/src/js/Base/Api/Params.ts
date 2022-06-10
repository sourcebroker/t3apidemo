import InitializerList from '../InitializerList/InitializerList';
import Property from '../InitializerList/Property';


export enum OrderDirection
{
    ASC = 'asc',
    DESC = 'desc',
}


type ParamsJSON = {
    [name : string] : any
};


class OrderCollection
{

    protected _properties : Map<string, string> = new Map();

    public add(
        property : string,
        direction : string = OrderDirection.ASC
    )
    {
        direction = direction.toLowerCase() === OrderDirection.DESC
            ? OrderDirection.DESC
            : OrderDirection.ASC;
        this._properties.set(property, direction);
    }

    public remove(property)
    {
        this._properties.delete(property);
    }

    public toggle(property)
    {
        if (this._properties.has(property)) {
            if (this._properties.get(property) === OrderDirection.DESC) {
                this.remove(property);
            }
            else {
                this._properties.set(property, OrderDirection.DESC);
            }
        }
        else {
            this.add(property, OrderDirection.ASC);
        }
    }

    public isSortingBy(property : string, direction : OrderDirection = undefined)
    {
        if (!this._properties.has(property)) {
            return false;
        }

        if (typeof direction === 'undefined') {
            return true;
        }

        return this._properties.get(property).toLowerCase() === direction.toLowerCase();
    }

    public get isEmpty()
    {
        return !this._properties.size;
    }

    public toJSON()
    {
        const object : ParamsJSON = {};

        Array.from(this._properties.entries())
            .forEach(([property, direction]) => {
                object[property] = direction;
            });

        return object;
    }
}


@InitializerList()
class Params
{

    @Property()
    public itemsPerPage : number = 10;

    @Property()
    public pageIndex : number = 0;

    @Property()
    public order : OrderCollection = new OrderCollection();

    public resetPage() : Params
    {
        this.pageIndex = 0;

        return this;
    }

    public toJSON() : Object
    {
        return {
            itemsPerPage: this.itemsPerPage || undefined,
            page: typeof this.pageIndex !== 'undefined' ? this.pageIndex + 1 : undefined,
            order: this.order.isEmpty ? undefined : this.order.toJSON()
        };
    }
}


export default Params;
