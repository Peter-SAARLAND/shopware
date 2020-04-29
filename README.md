shopware
===

[![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release) [![pipeline status](https://gitlab.com/peter.saarland/zero/badges/master/pipeline.svg)](https://gitlab.com/peter.saarland/zero/-/commits/master)

Maintained by [Peter.SAARLAND | DevOps Consultants](https://www.peter.saarland) - Helping companies to develop software with startup speed and enterprise quality.

This software is developed on [GitLab](https://gitlab.com/peter.saarland/shopware).

Additional Links:

- [ns0](https://gitlab.com/peter.saarland/ns0/) - The container-native DNS Proxy
- [if0](https://gitlab.com/peter.saarland/if0/) - The CLI to tool them all
- [dash1](https://gitlab.com/peter.saarland/dash1/) - Virtual Infrastructure for Zero
- [lake0](https://gitlab.com/peter.saarland/lake0/) - Container-native Backups


## Get Started
```
git clone https://gitlab.com/peter.saarland/shopware/
cd shopware
docker-compose up -d
```

Access on `http://localhost:8080` to start the installer.

## Debugging
If you need to Debug Shopware, add this to `config_production.php` inside the `shopware-app` container:

```
'front' => [
    'showException' => true
],
'phpsettings' => [
    'display_errors' => 1,
],
```

## Resources
- https://github.com/shopwareLabs/shopware-docker