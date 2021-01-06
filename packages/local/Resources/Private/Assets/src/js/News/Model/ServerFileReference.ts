import AbstractModel from 'Base/Api/Model/AbstractModel';
import ApiModel from 'Base/Api/Model/ApiModel';
import InitializerList from 'Base/InitializerList/InitializerList';
import ServerFile from './ServerFile';


@InitializerList()
@ApiModel('ServerFile')
class ServerFileReference extends AbstractModel<ServerFileReference>
{

    public file : ServerFile;

    public url : string;

    public static createFromServerFile(file) : ServerFileReference
    {
        return new ServerFileReference({ file });
    }

    public toJSON()
    {
        return {
            uidLocal: this.file.uid
        };
    }

}


export default ServerFile;
