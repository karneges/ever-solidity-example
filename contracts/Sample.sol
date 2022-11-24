//1.
//Compiler version
pragma ever-solidity >= 0.61.2;
// Headers
pragma AbiHeader expire;
pragma AbiHeader pubkey;

import "./CrossContractInvocation.sol";


contract Sample {
    //2. 
    // static fileds
    address static rootAddress;
    uint16 static _nonce;
    TvmCell static cotractCode;

    uint state;

    event StateChange(uint _state);

    constructor(uint _state) public {
        tvm.accept();
    }

    //3. 
    // responsible function
    function getDetails() public view responsible returns (uint8) {
        uint8 returningValue = 2;
        // in return statement responsible function can set value, bounce and flag like cross contract call
        return {value:0, bounce: false, flag: 128} returningValue;
    }

    //4. 
    // transfers https://github.com/tonlabs/TON-Solidity-Compiler/blob/master/API.md#addresstransfer
    function makeTransfer(address _transferTo) public view {
        TvmCell stateInit;
        TvmCell body;
        // transfer with JSON parameters
        _transferTo.transfer({
            value: 0, // or other uint128 value,
            // optional fields
            flag: 128, // or other flags
            bounce: false,
            stateInit:stateInit
        });
        // transfer with comma separated params
        _transferTo.transfer(
            0,// value
            false, //bounce
            128, //flag
            body // body
        );
    }

    //5.
    // Cross contract invocation, https://github.com/tonlabs/TON-Solidity-Compiler/blob/master/API.md#external-function-calls
    // also see this example https://github.com/tonlabs/samples/blob/master/solidity/24_SquareProvider.sol#L44
    function callAnotherContract(uint128 _amount) internal {
        address anotherContractAddress;
        // This 'another contract call' never returns anything
        CrossContractInvocation(anotherContractAddress).crossInvoke{
            value: 1 ever,
            flag: 1,
            bounce: false
        }(_amount);

        // This 'another contract call' never returns anything, but in this case 'another contract' will call our method `callbackReceiver`
        CrossContractInvocation(anotherContractAddress).reponsibleExample{
            callback: Sample.callbackReceiver,
            value: 1 ever,
            flag: 1,
            bounce: false
        }();
    }

    function callbackReceiver(uint128 _amount) public {

    }

    // 6. New data types
    function newDataTypes() internal {
        TvmCell myCell; //https://github.com/tonlabs/TON-Solidity-Compiler/blob/master/API.md#tvmcell
        TvmSlice mySlice; //https://github.com/tonlabs/TON-Solidity-Compiler/blob/master/API.md#tvmslice
        TvmBuilder myBuilder; //https://github.com/tonlabs/TON-Solidity-Compiler/blob/master/API.md#tvmbuilder
        optional(uint128) nextPair; //https://github.com/tonlabs/TON-Solidity-Compiler/blob/master/API.md#optionaltype
    }


    // 9. tvm global object https://github.com/tonlabs/TON-Solidity-Compiler/blob/master/API.md#tvm-instructions
    function tvmObject() internal {
        tvm.accept();
        TvmCell initData = tvm.buildStateInit({
                    // Solidity contarct, can be imported from another file
                    contr: Sample,
                    // static fileds of new contract
                    varInit: {
                        rootAddress: address(this)
                    },
                    // pubkey of new contract
                    pubkey: 0,
                    // code of contract TvmCell
                    code: cotractCode
                });
        // and other tvm object properties 
    }

    // 10. cycles https://github.com/tonlabs/TON-Solidity-Compiler/blob/master/API.md#range-based-for-loop
    function cycleFor(uint128[] uintArr, mapping(address => string) addressToStringMap) internal {
        for (uint128 arrElement : uintArr) {

        }

        for ((address key, string elementValue) : addressToStringMap) {

        }
    }

    // 12. special methods https://github.com/tonlabs/TON-Solidity-Compiler/blob/master/API.md#special-contract-functions
    receive() external {}
    fallback() external{}
    onBounce(TvmSlice body) external {}
    onTickTock(bool isTock) external {}
    function onCodeUpgrade(TvmCell params /*any params, this function will cal by this contract*/) private {}
}
