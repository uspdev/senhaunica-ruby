# Senhaunica Ruby

Biblioteca genérica para integrar senha única com Ruby
[https://rubygems.org/gems/senhaunica](https://rubygems.org/gems/senhaunica)

## Instalação

```
gem install senhaunica
```

## Uso

O token pode ser usado para várias aplicações por meio do callback_id cadastrado em https://dev.uspdigital.usp.br/adminws/

## Usando com rails

Criando um projeto e controller basicão:

    rails new projetinho
    cd projetinho
    rails generate controller Welcome login callback
    rails server

Instalar senhaunica no seu *Gemfile*:

    gem 'senhaunica'
    gem 'oauth'

## Informações para devs:

Build do gem package:

    gem build senhaunica.gemspec

Enviar para rubygems:

    gem push senhaunica-1.0.0.gem
