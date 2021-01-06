import InitializerList from '../InitializerList/InitializerList';


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

    protected properties : Map<string, string> = new Map();

    public add(
        property : string,
        direction : string = OrderDirection.ASC
    )
    {
        direction = direction.toLowerCase() === OrderDirection.DESC
            ? OrderDirection.DESC
            : OrderDirection.ASC;
        this.properties.set(property, direction);
    }

    public remove(property)
    {
        this.properties.delete(property);
    }

    public toggle(property)
    {
        if (this.properties.has(property)) {
            if (this.properties.get(property) === OrderDirection.DESC) {
                this.remove(property);
            }
            else {
                this.properties.set(property, OrderDirection.DESC);
            }
        }
        else {
            this.add(property, OrderDirection.ASC);
        }
    }

    public isSortingBy(property : string, direction : OrderDirection = undefined)
    {
        if (!this.properties.has(property)) {
            return false;
        }

        if (typeof direction === 'undefined') {
            return true;
        }

        return this.properties.get(property).toLowerCase() === direction.toLowerCase();
    }

    public get isEmpty()
    {
        return !this.properties.size;
    }

    public toJSON()
    {
        const object : ParamsJSON = {};

        Array.from(this.properties.entries())
            .forEach(([property, direction]) => {
                object[property] = direction;
            });

        return object;
    }
}


@InitializerList()
class Params
{

    public itemsPerPage : number;

    public pageIndex : number = 0;

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
