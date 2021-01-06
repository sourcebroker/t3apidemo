import AbstractModel from 'Base/Api/Model/AbstractModel';
import ApiModel from 'Base/Api/Model/ApiModel';
import InitializerList from 'Base/InitializerList/InitializerList';


@InitializerList()
@ApiModel('Tag')
class Tag extends AbstractModel<Tag>
{

    public title : string = '';

}


export default Tag;
