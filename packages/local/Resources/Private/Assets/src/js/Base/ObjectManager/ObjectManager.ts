import { InjectSymbol, SingletonSymbol } from './def';


interface ConstructorType<T> extends Function
{
    new(...args : any[]) : T;
    [SingletonSymbol]? : boolean;
}


class ObjectManager
{

    protected static instances : { [index : string] : any } = {};

    public static getInstance<T>(
        Klass : ConstructorType<T>,
        ...args : any[]
    ) : T
    {
        if (Klass[SingletonSymbol]) {
            if (!this.instances[Klass.name]) {
                this.instances[Klass.name] = this.createInstance(Klass, ...args);
            }

            return this.instances[Klass.name];
        }

        return this.createInstance(Klass, ...args);
    }

    public static bindInstance(object : any) : void
    {
        if (this.instances[object.name]) {
            throw new Error(`Instance typed as ${object.name} already has been bonded`);
        }

        this.instances[object.name] = object;
    }

    public static getService<T>(name : string) : T
    {
        if (!this.instances[name]) {
            throw new Error(`Instance named as ${name} hasn't been bonded yet`);
        }

        return this.instances[name];
    }

    public static bindService(service : any, name : string) : void
    {
        if (this.instances[name]) {
            throw new Error(`Instance named as ${name} already has been bonded`);
        }

        this.instances[name] = service;
    }

    protected static createInstance<T>(
        Klass : any,
        ...args : any[]
    ) : T
    {
        let object = new Klass(...args);
        return this.loadDependencies(object, args);
    }

    public static loadDependencies<T>(
        object : T,
        ...args : any[]
    ) : T
    {
        if (object[InjectSymbol]) {
            for (const propertyName in object[InjectSymbol]) {
                const injection = object[InjectSymbol][propertyName];
                if (injection.name) {
                    object[propertyName] = this.getService(injection.name);
                }
                else {
                    object[propertyName] = this.createInstance(injection.type, ...injection.args);
                }
            }
        }

        return object;
    }

}


export default ObjectManager;
