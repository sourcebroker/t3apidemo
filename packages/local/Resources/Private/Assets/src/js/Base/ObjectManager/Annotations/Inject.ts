import 'reflect-metadata';

import { InjectionDescription, InjectSymbol, SingletonSymbol } from '../def';
import ObjectManager from '../ObjectManager';


interface ConstructorType extends Function
{
    new(...args : any[]) : any;
}


function Inject(name : string = null, args : any[] = [])
{
    return (Target : ConstructorType, propertyName : string) => {
        // property annotation
        if (!Target[InjectSymbol]) {
            Target[InjectSymbol] = {};
        }

        const Type = Reflect.getMetadata('design:type', Target, propertyName);
        Target[InjectSymbol][propertyName] = new InjectionDescription(Type, name, args);
    };
}

export default Inject;

