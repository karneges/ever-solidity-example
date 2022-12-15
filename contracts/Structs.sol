pragma ever -solidity >= 0.61.2;


library Structs {
    struct InternalStruct {
        uint128 a;
    }

    struct MyStruct {
        uint128 amount;
        InternalStruct internalStruct;
    }


}
