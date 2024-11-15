# ![image](https://github.com/nvb-uy/cdn/blob/f70cba5260e5a833994bc0d849025df91893f26e/desc/prominence/rpg/promlogo.webp?raw=true)

<p align="center">
  <i align="center">Servidor de Minecraft com Docker para o modpack <a href="https://www.curseforge.com/minecraft/modpacks/prominence-2-rpg">Prominence II [RPG]</a></i>
</p>

<h4 align="center">
  <img src="https://forthebadge.com/images/badges/docker-container.svg" alt="docker container"/>
  <img src="https://forthebadge.com/images/badges/built-with-love.svg" alt="built with love"/>
</h4>

## Introdução

`Prominence II [RPG]` é um modpack, e esse repositório foi criado com o intuito de criar um servidor Docker local, com backup, para o streamer [`PRECOCE_LENTO`](https://twitch.tv/precoce_lento) e seus espectadores.

> Esse projeto não tem nenhuma relação com o modpack, com a Mojang e/ou afiliados.

## 💻 Desenvolvimento

O desenvolvimento do projeto foi baseado na documentação do [`Minecraft Server on Docker (Java Edition)`](https://docker-minecraft-server.readthedocs.io/en/latest/), utilizando o Docker Compose e as imagens: [`itzg/minecraft-server`](https://hub.docker.com/r/itzg/minecraft-server) para criar o server e a [`itzg/mc-backup`](https://hub.docker.com/r/itzg/mc-backup) para os backups.

Siga as instruções abaixo para saber os requisitos e comandos para rodar o projeto.

<details open>
<summary>
Pré-requisitos
</summary>
Para conseguir desenvolver ou realizar manutenção no projeto, verifique se possui as seguintes ferramentas instaladas:

###

- [Git](https://git-scm.com/)
- [Docker](https://www.docker.com/)
</details>

### Rodando o projeto

**ANTES** de seguir as etapas, tenha certeza de que:
- Você possui o `git` instalado em sua máquina
- Você possui o `docker` instalado e **RODANDO** em sua máquina

<br>

1. Clone o repositório
```shell
git clone https://github.com/marcosvaz/prominence.git && cd prominence
```

2. Crie um arquivo `.env` utilizando o `.env.example` como referência.

> [!IMPORTANT]
> Solicite as variáveis corretas com o responsável.

3. Rode o comando do Docker Compose para iniciar o servidor
```shell
docker compose up -d
```

Por fim as imagens serão baixadas do Docker, e os contâiners serão criados à partir do arquivo de configuração `docker-compose.yml`. Assim que o servidor estiver rodando, você poderá acessá-lo através da porta `25565` no Multiplayer do [Minecraft](https://www.minecraft.net/pt-br).
> Caso haja necessidade de compartilhar o acesso do servidor local com pessoas externas, existem diversas formas, busque a opção que melhor se encaixar em sua necessidade, algumas delas são [Radmin](https://www.radmin-vpn.com/) e [NO-IP](https://www.noip.com/pt-BR).

<details>
<summary>
Extras
</summary> <br />

- Comandos Minecraft <br>
Para rodar um comando do próprio [Minecraft](https://www.minecraft.net/pt-br) como administrador, execute
```shell
docker exec server rcon-cli <COMANDO> # Para executar um único comando

docker exec -i server rcon-cli # Para abrir o terminal interativo e executar vários comandos
```
> Você pode consultar uma lista de comandos em [Minecraft Wiki - Fandom](https://minecraft.fandom.com/pt/wiki/Comandos).

- Backups <br>
O servidor está configurado para realizar backups à cada 5m, utilizando a imagem [`itgz/mc-backup`](https://hub.docker.com/r/itzg/mc-backup), no entanto, você pode mudar essas configurações no arquivo `.env` seguindo a documentação em [itzg/docker-mc-backup](https://github.com/itzg/docker-mc-backup). <br><br>
Ou você pode também executar um comando para realizar o backup manualmente, utilizando
```shell
docker-compose exec backups backup now
```
</details>

## :warning: Problemas frequentes
Caso você execute o projeto através de uma recuperação de backup, provavelmente irá se deparar com o seguinte erro:
```shell
Error: Could not find or load main class cpw.mods.bootstraplauncher.BootstrapLauncher
Caused by: java.lang.ClassNotFoundException: cpw.mods.bootstraplauncher.BootstrapLauncher
```

Deve ser possível resolvê-lo adicionando a variável de ambiente abaixo ao arquivo `.env`
```shell
########################################################
### Descomente a linha seguinte APENAS caso ocorra   ###
### o erro na recuperação do backup. Após o servidor ###
### iniciar, comente a linha novamente.              ###
########################################################

FORGE_FORCE_REINSTALL = TRUE
```

> [!CAUTION]
> A variável já se encontra no arquivo `.env`, basta descomentar a linha, rodar o `docker compose up -d`, e comentar a mesma novamente. **Lembre-se de não executar novamente com essa variável, pois ela força a reinstalação do Forge.**

## 📜 Licença
Este projeto é propriedade intelectual do [Studio](https://github.com/studioresearch), sendo estritamente proibido compartilhar os arquivos ou utilizá-los para outros fins sem autorização expressa, incluindo propósitos pessoais e/ou comerciais.
