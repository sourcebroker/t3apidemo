import AbstractModel from 'Base/Api/Model/AbstractModel';
import ApiModel from 'Base/Api/Model/ApiModel';
import InitializerList from 'Base/InitializerList/InitializerList';
import Property from 'Base/InitializerList/Property';


@InitializerList()
@ApiModel('Category')
class Category extends AbstractModel<Category>
{

    @Property()
    public name : string = '';

}


export default Category;
