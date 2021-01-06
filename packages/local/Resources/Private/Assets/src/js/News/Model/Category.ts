import AbstractModel from 'Base/Api/Model/AbstractModel';
import ApiModel from 'Base/Api/Model/ApiModel';
import InitializerList from 'Base/InitializerList/InitializerList';


@InitializerList()
@ApiModel('Category')
class Category extends AbstractModel<Category>
{

    public name : string = '';

}


export default Category;
