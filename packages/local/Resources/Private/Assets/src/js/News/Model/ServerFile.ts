import AbstractModel from 'Base/Api/Model/AbstractModel';
import ApiModel from 'Base/Api/Model/ApiModel';
import InitializerList from 'Base/InitializerList/InitializerList';


@ApiModel()
@InitializerList()
class ServerFile extends AbstractModel<ServerFile>
{
}


export default ServerFile;
