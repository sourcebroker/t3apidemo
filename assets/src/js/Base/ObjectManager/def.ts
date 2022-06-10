const InjectSymbol = Symbol('Inject');
const SingletonSymbol = Symbol('Singleton');

class InjectionDescription
{

    public constructor(
        public type : string,
        public name? : string,
        public args? : any[],
    ) {
    }

}

export {
    InjectSymbol,
    SingletonSymbol,
    InjectionDescription,
};
