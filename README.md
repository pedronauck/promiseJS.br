# PromiseJS - BR

Tradução do site http://www.promisejs.org/

### Veja [AQUI](http://eoop.github.io/promiseJS.br/) a tradução!

## Como contribuir?

### Instalando localmente

Para desenvolvimento deste projeto foi usado o gerador de sites estáticos [Middleman](http://www.middlemanapp.com). Para usar ele é muito fácil, primeiramente instale a gem do middleman com este comando:

```bash
$ gem install middleman
```

### Rodando server local com Livereload

Depois de instalado a gem é só rodar o servidor local com o comando `middleman server`. Assim você terá um servidor local com livereload pronto para ser usado.

### Build e Deploy Automático

Para fazer o build basta rodar o comando `middleman build`. Ele criará uma pasta `build` com todos os arquivos minificados e prontos para deploy. As configurações do build você pode setar no arquivo `config.rb`.

O Middleman tem uma [extension muito bacana](https://github.com/tvaughan/middleman-deploy) que faz o deploy automáticamente para a branch `gh-pages` com os arquivos do build. Para rodar o deploy automático para a branch, basta rodar o comando `middleman deploy`.

### Fork o Projeto

Depois de instalar e rodar o Middleman, dê um fork nesse projeto e vá enviando seus pull request que iremos analisar e tentar usufruir ao máximo das suas idéias. Caso você não saiba como trabalhar com pull request, [esse link](https://help.github.com/articles/using-pull-requests) pode te ajudar.
