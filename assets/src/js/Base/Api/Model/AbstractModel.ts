import InitializerList from '../../InitializerList/InitializerList';


@InitializerList()
class AbstractModel<T>
{

    public '@type' : string;

    public '@id' : string;

    public uid : number;

    public constructor(data? : Partial<AbstractModel<T>> & Partial<T>)
    {
    }

}


export default AbstractModel;
