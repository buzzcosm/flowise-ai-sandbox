# Local Flowise AI development environment

More infos to project [hire](docs/project.md).

### Tutorials

- [YouTube: Install FlowiseAI with Docker Compose - Explore This Powerful No-Code LLM Tool](https://www.youtube.com/watch?v=ZJvl1_DVy_g)
- [YouTube: FlowiseAI Masterclass: Build AI Agents (Beginner to Pro)](https://www.youtube.com/watch?v=9TaRksXuLWY)
  - [Tutorial: How to Install FlowiseAI with Docker Compose](https://www.bitdoze.com/flowiseai-install/)
  - [Dockge](https://dockge.kuma.pet/)

### Flowise Infos

Flowise - [Env Variables](https://github.com/FlowiseAI/Flowise/blob/main/CONTRIBUTING.md#-env-variables⁠)

### Docker Compose

#### Start

*It takes time...!* ➡️ `embedding ... / 24.4GB Pulling`

> .........Patience, you must have, my young Padawan.  
> ![yoda](docs/img/yoda.png)
> *[May the 4th be with you.](https://www.google.com/search?q=May+the+4th+be+with+you.&sca_esv=335550648f386498&source=hp&ei=3b0naM6tMqGbi-gPzP3d6Ag&iflsig=ACkRmUkAAAAAaCfL7bNX2amEMXheqN4a1Eb_8IZxZ0I-&ved=0ahUKEwiOkIjHhqmNAxWhzQIHHcx-F40Q4dUDCBk&uact=5&oq=May+the+4th+be+with+you.&gs_lp=Egdnd3Mtd2l6IhhNYXkgdGhlIDR0aCBiZSB3aXRoIHlvdS5I6wNQAFgAcAB4AJABAJgBAKABAKoBALgBA8gBAPgBAvgBAZgCAKACAJgDAJIHAKAHALIHALgHAA&sclient=gws-wiz)*

```bash
./start.sh
```

#### Stop

```bash
docker-compose down
```

Optionally, you can also run `docker-compose down --remove-orphans -v` to remove all containers and volumes (including data).
