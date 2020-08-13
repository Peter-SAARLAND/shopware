<?php return array (
    'httpcache' => array('enabled' => true),
    'trustedProxies' => array(
        '172.16.238.10'
    ),
    'db' => [
        'host' => 'shopware-db',
        'port' => '3306',
        'username' => 'shopware',
        'password' => 'shopware',
        'dbname' => 'shopware',
        'timezone' => 'Europe/Berlin',
    ],
    'cache' => [
        'backend' => 'redis', // e.G auto, apcu, xcache
        'backendOptions' => [
            'servers' => [
                [
                    'host' => 'shopware-redis',
                    'port' => 6379,
                    'dbindex' => 0,
                    'redisAuth' => ''
                ],
            ],
        ],
    ]
    // 'es' => [
    //     'prefix' => 'sw_shop', // set a prefix for the ES indices
    //     'enabled' => true, // enable ES
    //     'number_of_replicas' => null, // set the number of replicase (e.g. 0 for development environments)
    //     'number_of_shards' => null, // set the number of shards 
    //     'backend' => [
    //         'write_backlog' => true, // enable backlog for the backend
    //         'enabled' => true, // enable ES for the backend
    //     ],
    //     'client' => [
    //         'hosts' => [
    //             'shopware-elasticsearch:9200', // set the ES host
    // ],

);