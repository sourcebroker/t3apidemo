export type PropertyDescriptorOptions = Partial<PropertyDescriptor>;

interface ConstructorType extends Function
{
    new(...args : any[]) : any;
}

class PropertyDescriptor
{
    public type : ConstructorType = undefined;

    public arrayOf : ConstructorType = undefined;

    public preserveRaw : boolean = false;

    public isNullable : boolean = true;

    public constructor(options : PropertyDescriptorOptions = {})
    {
        this.type = options.type ? options.type : this.type;
        this.isNullable = options.isNullable ? !!options.isNullable : this.isNullable;
        this.arrayOf = options.arrayOf ? options.arrayOf : this.arrayOf;
    }

    public get isPrimitive(): boolean
    {
        return [Boolean, null, undefined, Number, String, Symbol].indexOf(<any> this.type) !== -1;
    }

    public get isArray(): boolean
    {
        return this.arrayOf !== undefined;
    }

    public get isDate(): boolean
    {
        return this.type === Date;
    }
}

export default PropertyDescriptor;
