export type PropertyDescriptorOptions = Partial<PropertyDescriptor>;

export default
class PropertyDescriptor
{
    public type : Function;

    public preserveRaw : boolean = false;

    public isNullable : boolean = true;

    public isArray : boolean = false;

    constructor(type : Function = undefined, options : PropertyDescriptorOptions = {})
    {
        this.type = type;
        this.isNullable = options.isNullable ? !!options.isNullable : this.isNullable;
        this.isArray = options.isArray ? !!options.isArray : this.isArray;
    }

    get isPrimitive(): boolean
    {
        return [Boolean, null, undefined, Number, String, Symbol].indexOf(<any> this.type) !== -1;
    }

    get isDate(): boolean
    {
        return this.type === Date;
    }
}
