import { SingletonSymbol } from '../def';

function Singleton()
{
    return (Target : Function) => {
        Target[SingletonSymbol] = true;
    };
}

export default Singleton;
