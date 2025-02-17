# netbox-podman

This repository implements a native way to run [NetBox](https://netboxlabs.com/)
using [podman](https://podman.io/).

For now the expectation is to launch a demo-worthy instance of NetBox. Open an
issue if you would like to discuss the potential for enabling production-worthy
deployment and what that should look like.

## Usage

Start it up:

```
./start.sh
2e538ae3bf7e64ba0d244742e
92ae1d400ca3b52161d277ffd
dafef18d8488c9aa27288f632
Pod:
c7401da3d2b81ec90dd5b57ab089482c120b4db70798b8c88005dad7591f5ed9
Containers:
d891813483a635eeabad510d6fae464e6a2eddf35088f12fc267e068eeccd466
3b68d56588eb88818e7876be342ceefeeef6304b54ee1331230ffa55b7c29797
4b792bda275532d42f312efaadcf88db05e848b639ef1e9033865a9bb5b65204
323317ba21204171e4f2524d2bbd4d7f006eb87d2bbfb7285dd3b5fc7122f016
367e6e6da48671b33aabffeef514a422bb37ee3c8cca6a5e65d1da9ed908b4d9

⏳ Waiting for Netbox to start..................................................................................................................................................................................

🦸 Creating Superuser... answer the questions...

🧬 loaded config '/etc/netbox/config/configuration.py'
🧬 loaded config '/etc/netbox/config/extra.py'
🧬 loaded config '/etc/netbox/config/logging.py'
🧬 loaded config '/etc/netbox/config/plugins.py'
Username: itsme
Email address: me@mypla.ce
Password: 
Password (again): 
Superuser created successfully.

✅ Netbox is ready at http://localhost:8080
```

Tear it down:

```
./destroy.sh
```