import AbstractModel from 'Base/Api/Model/AbstractModel';
import ApiModel from 'Base/Api/Model/ApiModel';
import InitializerList from 'Base/InitializerList/InitializerList';
import Property from 'Base/InitializerList/Property';
import Tag from './Tag'
import Category from './Category'
import ServerFileReference from './ServerFileReference'

@ApiModel('SourceBroker\\T3apinews\\News')
@InitializerList()
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

    @Property({ arrayOf: Category })
    public categories : Category[] = [];

    @Property({ arrayOf: News })
    public related : News[] = [];

    @Property()
    public type : string = '';

    @Property()
    public internalurl : string = '';

    @Property()
    public externalurl : string = '';

    @Property()
    public istopnews : boolean = false;

    @Property({ arrayOf: Tag })
    public tags : Tag[] = [];

    @Property()
    public imageThumbnail : string = '';

    @Property()
    public imageLarge : string = '';

    @Property()
    public singleUri : string = '';

    @Property({ arrayOf: ServerFileReference })
    public falMedia : ServerFileReference[] = [];

}


export default News;
