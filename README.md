This repository contains some simple bash scripts which demonstrate
using the REST API of the gateway using curl.

When prompted for the URL, include the http: or https: and any ports. Some example URLs:
* http://gateway.local:8080
* https://mydomain.mozilla-iot.org
* https://localhost:4443

The --insecure is required when using gateway.local. If you instead use
your NAME.mozilla-iot.org name then you no longer need to use --insecure.

## login.sh
```
$ ./login.sh
Enter      URL: https://mydomain.mozilla-iot.org
Enter    email: your-email@company.com
Enter password:
```
Running login.sh will retrieve the JSON WebToken for the user and store it in a local file called `.jwt`.
It will also store the URL in a local file called `.url`.

## get-things.sh
```
$ ./get-things.sh
[
    {
        "actions": {},
        "events": {},
        "href": "/things/HttpOnOffDevice-F714A9",
        "name": "LED-F714A9",
        "properties": {
            "on": {
                "href": "/things/HttpOnOffDevice-F714A9/properties/on",
                "type": "boolean"
            }
        },
        "type": "onOffLight"
    },
    {
        "actions": {},
        "events": {},
        "href": "/things/zb-00178801003fae06",
        "name": "zb-00178801003fae06-onOffColorLight",
        "properties": {
            "color": {
                "href": "/things/zb-00178801003fae06/properties/color",
                "type": "string"
            },
            "on": {
                "href": "/things/zb-00178801003fae06/properties/on",
                "type": "boolean"
            }
        },
        "type": "onOffColorLight"
    }
]
```
## set-property.sh

```
$ ./set-property.sh zb-00178801003fae06 on false
```

## get-property.sh

```
$ ./get-property.sh zb-00178801003fae06 on
{
    "on": false
}
```

# Some additional scripts which may be useful while developing adapters.

## get-addon-url.sh

```
$ ./get-addon-url.sh
{
    "api": 2,
    "architecture": "linux-arm",
    "url": "https://raw.githubusercontent.com/dhylands/addon-list/zwave-0.4.0/list.json"
}
```

## get-devices.sh

NOTE: This script will only produce output when the gateway is run using the -d command line option. (i.e. `npm start -- -d`)

```
$ ./get-devices.sh
[
    {
        "actions": {},
        "adapterId": "zwave-ecf0a9e5",
        "description": "",
        "events": {},
        "id": "zwave-ecf0a9e5-3",
        "lastStatus": "ready",
        "name": "zwave-ecf0a9e5-3-Switch",
        "pluginId": "zwave-adapter",
...snip...
    }
]
```

## get-device.sh

NOTE: This script will only produce output when the gateway is run using the -d command line option. (i.e. `npm start -- -d`)

```
$ ./get-device.sh zwave-ecf0a9e5-3
{
    "actions": {},
    "adapterId": "zwave-ecf0a9e5",
    "description": "",
    "events": {},
    "id": "zwave-ecf0a9e5-3",
    "lastStatus": "ready",
    "name": "zwave-ecf0a9e5-3-Switch",
    "pluginId": "zwave-adapter",
...snip...
}
```
