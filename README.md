FORK from https://hub.docker.com/r/vimagick/monit/
to execute https://github.com/matriphe/monit2telegram

monit
=====

[Monit][1] is a utility for managing and monitoring processes, programs, files,
directories and filesystems on a Unix system.

## directory tree

```
~/fig/monit/
├── docker-compose.yml
└── data/
    ├── conf.d/
    │   ├── network.cfg
    │   ├── setting.cfg
    │   └── system.cfg
    └── monitrc
```

> Make sure config file endswith `.cfg`.

## docker-compose.yml

```yaml
monit:
  image: riool/monit
  volumes:
    - ./data:/etc/monit
  pid: host
  net: host
  restart: always
```

> The control file `/etc/monit/monitrc` must have permissions no more than
> `-rwx------ (0700)`

## Server Setup

```bash
$ cd ~/fig/monit/
$ docker-compose up -d
$ docker exec monit_monit_1 monit status
```

## Client Setup

```bash
$ firefox http://admin:monit@server:2812
```

[1]: https://www.mmonit.com/monit/documentation/monit.html
