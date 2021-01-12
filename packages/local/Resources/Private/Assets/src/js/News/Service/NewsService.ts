import AbstractRestService from 'Base/Api/AbstractRestService';
import { Singleton } from 'Base/ObjectManager';
import News from '../Model/News';
import NewsFilter from '../Model/Filter/NewsFilter';

declare var REST_API_BASE_URL: string;


@Singleton()
class NewsService extends AbstractRestService
{

    protected static readonly BASE_URL : string = REST_API_BASE_URL + 'news';

    public getCollectionByFilter(filter : NewsFilter = null) : Promise<News[]>
    {
        return <Promise<News[]>> super.fetchCollection('news', { params: filter });
    }

    public get(id : number) : Promise<News>
    {
        return <Promise<News>> super.fetchItem('news/' + id);
    }

}


export default NewsService;
