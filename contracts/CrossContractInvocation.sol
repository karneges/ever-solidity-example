
pragma ever-solidity >= 0.61.2;

pragma AbiHeader expire;
pragma AbiHeader pubkey;


contract CrossContractInvocation { 
    uint128 amountStore;
    function crossInvoke(uint128 _amount) public {
        amountStore = _amount;
    }

    function reponsibleExample() public view responsible returns(uint128) {
        return {value:0, bounce: false, flag: 128} amountStore;
    }
}