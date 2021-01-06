import Params from 'Base/Api/Params'
import InitializerList from 'Base/InitializerList/InitializerList'

@InitializerList()
class NewsFilter extends Params
{

    public itemsPerPage : number = 15;

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
