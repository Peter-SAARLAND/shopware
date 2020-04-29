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