# Setup

```shell
bundle install --path=vendor/bundle
bundle exec berks vendor
```

# Try run with Vagrnat

You should write your mackerel.io api key into ```.mackerel-api-key```.

```.mackerel-api-key
XXXXXXXXXXXXXXXXXXX
```

## All machines

```shell
vagrant up
```

## Target machine

```shell
vagrant up precise64
```
