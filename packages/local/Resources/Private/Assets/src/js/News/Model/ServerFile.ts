import AbstractModel from 'Base/Api/Model/AbstractModel';
import ApiModel from 'Base/Api/Model/ApiModel';
import InitializerList from 'Base/InitializerList/InitializerList';


@InitializerList()
@ApiModel('ServerFile')
class ServerFile extends AbstractModel<ServerFile>
{
}


export default ServerFile;
