# Market

## Get trades

```shell
curl "ARBITER/market/DAI/ETH/trades"
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

This endpoint retrieves all market trades.

> TODO: pagination

### HTTP Request

`GET ARBITER/market/<StockTokenSymbol>/<CashTokenSymbol>/trades`

### HTTP Response

List of `Trade`s

## Get orderbook

```shell
curl "ARBITER/market/DAI/ETH/orderbook/sell"
  -X GET
  -H "Authorization: meowmeowmeow"
  -H "Content-Type: application/json"
```

> Server response body:

```json
[
  Order book, ...
]
```

This endpoint retrieves current market orderbook

### HTTP Request

`GET ARBITER/market/<StockTokenSymbol>/<CashTokenSymbol>/orderbook/<OrderType>`

### URL Parameters

Parameter | Description
--------- | -----------
OrderType | `buy / sell`

### Server response

List of `Order book entity`s

## Canceling order

```shell
curl "ARBITER/orders/123a"
  -X DELETE
  -H "Authorization: meowmeowmeow"
  -H "Content-Type: application/json"
  --data '{"signature": "abcdef123123}'
```

> Server response body:

```json
{}
```

This endpoint cancels the order

### HTTP Request

`DELETE ARBITER/orders/<OrderId>`

### URL Parameters

Parameter | Description
--------- | -----------
OrderId | Order's identificator

### Body JSON Parameters

Parameter | Description
--------- | -----------
signature | ETH EIP712 signature

### Server response

Empty object