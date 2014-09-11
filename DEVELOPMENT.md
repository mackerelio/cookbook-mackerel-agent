# Requirements

- Vagrant 1.6

# Setup

You should write your mackerel.io api key into ```.mackerel-api-key```.

```.mackerel-api-key
XXXXXXXXXXXXXXXXXXX
```

Prepare requirements and Launch VM and Provisioning with Chef.

```shell
bundle exec rake
```

## All machines

- precise64
- centos-6.5

```shell
bundle exec rake
```

## Target machine

```shell
TARGET_HOSTS=precise64 bundle exec rake
```

## Clean VM and Provisioning

```shell
bundle exec rake vagrnat:remake
```

