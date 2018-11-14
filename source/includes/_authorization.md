# Authentication

```javascript
web3.eth.getAccounts(function getAccountsCallback(error, accounts) {
  var from = accounts[0];
  var data = [
    { type: 'string', name: 'hello', value: 'counter' }
  ];
  web3.currentProvider.sendAsync({
    from: from,
    method: 'eth_signTypedData',
    params: [data, from],
  }, function sendAsyncCallback(error, result) {
    alert(result.result);
  });
});
```

> Sample shows how to sign the message

Use ethereum signature of <code>{ hello: 'counter' }</code> as an `authorization key`.

<aside class="notice">
You must sign with the address linked to your <code>counter.market</code> account through website.
</aside>