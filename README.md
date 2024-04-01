# Prominence II [RPG] Docker

[![forthebadge](https://forthebadge.com/images/badges/docker-container.svg)](https://forthebadge.com)
[![forthebadge](https://forthebadge.com/images/badges/built-with-love.svg)](https://forthebadge.com)

Um arquivo Docker Compose para criar um container de servidor [Minecraft](https://www.minecraft.net/pt-br) com o modpack **[Prominence II [RPG]](https://www.curseforge.com/minecraft/modpacks/prominence-2-rpg)**, com backup local através da imagem `itzg/mc-backup`.

Foi utilizada a imagem `itzg/minecraft-server` acompanhada de configurações através da [documentação](https://docker-minecraft-server.readthedocs.io/en/latest/).

![image](https://github.com/nvb-uy/cdn/blob/f70cba5260e5a833994bc0d849025df91893f26e/desc/prominence/rpg/promlogo.webp?raw=true)
*OBS.: Esse projeto não tem relação com o modpack e nem com a Mojang e/ou afiliados.*

# Uso do projeto
### Requisitos
É necessário ter o [Docker](https://www.docker.com/products/docker-desktop/) instalado na máquina;

### Rodando
> Comece alterando o arquivo `.env.example` com suas próprias configurações/credenciais.

Para iniciar o container, você pode utilizar o comando `docker compose up -d`.

### Comandos
Para executar comandos do [Minecraft](https://www.minecraft.net/pt-br), utilize `docker exec -i server rcon-cli` para abrir um terminal interativo e executar comandos no container.

### Backup
Para backup local, o backup está configurado para cada 1h, mas você pode executar o backup manualmente utilizando `docker-compose exec backups backup now`.