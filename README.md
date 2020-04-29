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