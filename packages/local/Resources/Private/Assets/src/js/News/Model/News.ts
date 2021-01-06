import AbstractModel from 'Base/Api/Model/AbstractModel';
import ApiModel from 'Base/Api/Model/ApiModel';
import InitializerList from 'Base/InitializerList/InitializerList';
import Property from 'Base/InitializerList/Property';
import Tag from './Tag'
import Category from './Category'
import ServerFileReference from './ServerFileReference'

@InitializerList()
@ApiModel('News')
class News extends AbstractModel<News>
{

    public title : string = '';

    public alternativeTitle : string = '';

    public teaser : string = '';

    public bodytext : string = '';

    public datetime : Date = null;

    public author : string = '';

    public authorEmail : string = '';

    @Property(Category, { isArray: true })
    public categories : Category[] = [];

    @Property(News, { isArray: true })
    public related : News[] = [];

    public type : string = '';

    public internalurl : string = '';

    public externalurl : string = '';

    public istopnews : boolean = false;

    @Property(Tag, { isArray: true })
    public tags : Tag[] = [];

    public imageThumbnail : string = '';

    public imageLarge : string = '';

    public singleUri : string = '';

    @Property(ServerFileReference, { isArray: true })
    public falMedia : ServerFileReference[] = [];

}

export default News;
