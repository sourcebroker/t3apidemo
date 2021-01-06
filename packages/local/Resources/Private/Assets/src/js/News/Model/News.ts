import AbstractModel from 'Base/Api/Model/AbstractModel';
import ApiModel from 'Base/Api/Model/ApiModel';
import InitializerList from 'Base/InitializerList/InitializerList';
import Property from 'Base/InitializerList/Property';
import Tag from './Tag'
import Category from './Category'
import ServerFileReference from './ServerFileReference'

class News extends AbstractModel<News>
{

    @Property()
    public title : string = '';

    @Property()
    public alternativeTitle : string = '';

    @Property()
    public teaser : string = '';

    @Property()
    public bodytext : string = '';

    @Property()
    public datetime : Date = null;

    @Property()
    public author : string = '';

    @Property()
    public authorEmail : string = '';

    @Property(Category, { isArray: true })
    public categories : Category[] = [];

    @Property(News, { isArray: true })
    public related : News[] = [];

    @Property()
    public type : string = '';

    @Property()
    public internalurl : string = '';

    @Property()
    public externalurl : string = '';

    @Property()
    public istopnews : boolean = false;

    @Property(Tag, { isArray: true })
    public tags : Tag[] = [];

    @Property()
    public imageThumbnail : string = '';

    @Property()
    public imageLarge : string = '';

    @Property()
    public singleUri : string = '';

    @Property(ServerFileReference, { isArray: true })
    public falMedia : ServerFileReference[] = [];

}


export default News;
