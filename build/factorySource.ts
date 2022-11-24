const crossContractInvocationAbi = {"ABIversion":2,"version":"2.2","header":["pubkey","time","expire"],"functions":[{"name":"crossInvoke","inputs":[{"name":"_amount","type":"uint128"}],"outputs":[]},{"name":"reponsibleExample","inputs":[{"name":"answerId","type":"uint32"}],"outputs":[{"name":"value0","type":"uint128"}]},{"name":"constructor","inputs":[],"outputs":[]}],"data":[],"events":[],"fields":[{"name":"_pubkey","type":"uint256"},{"name":"_timestamp","type":"uint64"},{"name":"_constructorFlag","type":"bool"},{"name":"amountStore","type":"uint128"}]} as const
const sampleAbi = {"ABIversion":2,"version":"2.2","header":["pubkey","time","expire"],"functions":[{"name":"constructor","inputs":[{"name":"_state","type":"uint256"}],"outputs":[]},{"name":"getDetails","inputs":[{"name":"answerId","type":"uint32"}],"outputs":[{"name":"value0","type":"uint8"}]},{"name":"makeTransfer","inputs":[{"name":"_transferTo","type":"address"}],"outputs":[]},{"name":"callbackReceiver","inputs":[{"name":"_amount","type":"uint128"}],"outputs":[]}],"data":[{"key":1,"name":"rootAddress","type":"address"},{"key":2,"name":"_nonce","type":"uint16"},{"key":3,"name":"cotractCode","type":"cell"}],"events":[{"name":"StateChange","inputs":[{"name":"_state","type":"uint256"}],"outputs":[]}],"fields":[{"name":"_pubkey","type":"uint256"},{"name":"_timestamp","type":"uint64"},{"name":"_constructorFlag","type":"bool"},{"name":"rootAddress","type":"address"},{"name":"_nonce","type":"uint16"},{"name":"cotractCode","type":"cell"},{"name":"state","type":"uint256"}]} as const

export const factorySource = {
    CrossContractInvocation: crossContractInvocationAbi,
    Sample: sampleAbi
} as const

export type FactorySource = typeof factorySource
export type CrossContractInvocationAbi = typeof crossContractInvocationAbi
export type SampleAbi = typeof sampleAbi
