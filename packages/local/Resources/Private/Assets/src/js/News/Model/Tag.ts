import AbstractModel from 'Base/Api/Model/AbstractModel';
import ApiModel from 'Base/Api/Model/ApiModel';
import InitializerList from 'Base/InitializerList/InitializerList';
import Property from 'Base/InitializerList/Property';


@ApiModel('SourceBroker\\T3apinews\\Tag')
@InitializerList()
class Tag extends AbstractModel<Tag>
{

    @Property()
    public title : string = '';

}


export default Tag;
