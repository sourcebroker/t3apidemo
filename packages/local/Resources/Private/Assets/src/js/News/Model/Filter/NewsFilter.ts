import Params from 'Base/Api/Params';
import InitializerList from 'Base/InitializerList/InitializerList';
import Property from 'Base/InitializerList/Property';


@InitializerList()
class NewsFilter extends Params
{

    @Property()
    public itemsPerPage : number = 15;

    @Property()
    public search : string = '';

    toJSON () {
        return Object.assign(
            {},
            super.toJSON(),
            {
                search: this.search || undefined
            }
        )
    }
}

export default Params
