# Wallet

## Get all market orders

```shell
curl "ARBITER/wallets/0x1234567890123456789012345678901234567890/orders/DAI/ETH"
  -X GET
  -H "Authorization: meowmeowmeow"
  -H "Content-Type: application/json"
```

> Server response body:

```json
[
  Order, ...
]
```

### HTTP Request

`GET ARBITER/wallets/<ETHAddress>/orders/<StockTokenSymbol>/<CashTokenSymbol>`

### URL Parameters

Parameter | Description
--------- | -----------
ETHAddress | ETH address of one of your linked wallets

### Server response

List of `Order`s

## Get all token accounts

```shell
curl "ARBITER/wallets/0x1234567890123456789012345678901234567890/token-accounts"
  -X GET
  -H "Authorization: meowmeowmeow"
  -H "Content-Type: application/json"
```

> Server response body:

```json
[
  Token Account, ...
]
```

### HTTP Request

`GET ARBITER/wallets/<ETHAddress>/token-accounts`

### Server response

List of `Token account`s for a binded wallet with given `ETHAddress`.

## Get all trades

```shell
curl "ARBITER/wallets/0x1234567890123456789012345678901234567890/trades"
  -X GET
  -H "Authorization: meowmeowmeow"
  -H "Content-Type: application/json"
```

> Server response body:

```json
[
  Trade, ...
]
```

### HTTP Request

`GET ARBITER/wallets/<ETHAddress>/trades`

### Server response

List of `Trades`s for a binded wallet with given `ETHAddress`.

## Get nonces

```shell
curl "ARBITER/wallets/0x1234567890123456789012345678901234567890/nonces"
  -X GET
  -H "Authorization: meowmeowmeow"
  -H "Content-Type: application/json"
```

> Server response body:

```json
[
  {
    trade: 12,
    witdraw: 22,
  }
]
```

### HTTP Request

`GET ARBITER/wallets/<ETHAddress>/nonces`

### Server response

Dictionary of ETH transaction nonces for each of the exchange operations: `trade`, `withdraw`.

## Deposit

```shell
curl "ARBITER/wallets/0x1234567890123456789012345678901234567890/deposits"
  -X PUT
  -H "Authorization: meowmeowmeow"
  -H "Content-Type: application/json"
  --data '{"tokenCode": 2, "amount": "0xA", "txHash": "0x123"}'
```

> Server response body:

```json
{}
```

### Flow

For depositing `ETH`:

* Send transaction to `TREASURY` smart contract to `depositEther` method with desired amount of `ETH` to deposit

* Send a HTTP request to `ARBITER`

For depositing `ERC-20` tokens:

* Send a transaction to allow `TREASURY` smart contract to operate with desired amount of your `ERC-20` tokens

* Invoke `depositERC20Token` method of `TREASURY` smart contract with ...

* Send a HTTP request to `ARBITER`

### HTTP Request

`PUT ARBITER/wallets/<ETHAddress>/deposits`

### Body JSON Parameters

Parameter | Type | Description
--------- | ---- | -----------
tokenCode | number | Code of the token !!!
amount | string | HEX of deposit amount * 10^token decimal places count
txHash | string | Hash of Ethereum transaction

### Server response

???

## Withdraw

```shell
curl "ARBITER/wallets/0x1234567890123456789012345678901234567890/withdrawals"
  -X PUT
  -H "Authorization: meowmeowmeow"
  -H "Content-Type: application/json"
  --data '{"tokenCode": 2, "amount": "0xA", "withdrawAddress": "0x123", "withdrawNonce": 10, "txHash": "0x123"}'
```

> Server response body:

```json
{}
```

### Flow

* Sign following structure with wallet's ethereum address you wanna to withdraw funds from

Attribute | Type | Description
--------- | ---- | -----------
tokenCode | uint16 | Token code
withdrawAddress | address | ETH address to withdraw to
amount | uint128 | Amount of funds to withdraw
withdrawNonce | uint64 | wallet's `nonce` for `withdraw` operation

* Send a HTTP request to `ARBITER`

### HTTP Request

`PUT ARBITER/wallets/<ETHAddress>/withdrawals`

### Body JSON Parameters

Parameter | Type | Description
--------- | ---- | -----------
tokenCode | number | Code of the token !!!
amount | string | !!!
withdrawAddress | string | ETH address to withdraw to
withdrawNonce | number | wallet's `nonce` for `withdraw` operation
signature | string | Ethereum signature

### Server response

???

## Get all fundings

```shell
curl "ARBITER/wallets/0x1234567890123456789012345678901234567890/fundings"
  -X GET
  -H "Authorization: meowmeowmeow"
  -H "Content-Type: application/json"
```

> Server response body:

```json
[
  Funding, ...
]
```

### HTTP Request

`PUT ARBITER/wallets/<ETHAddress>/fundings`

### Server response

List of `Funding`s of the wallet binded to `ETHAddress`.