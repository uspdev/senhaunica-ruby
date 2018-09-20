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

Exemplo para Controller:

    class WelcomeController < ApplicationController

      def login
        s = Senhaunica.new('username','secret','168')
        redirect_to s.login()
      end

      def callback
        s = Senhaunica.new('username','secret','168')
        @data = s.callback(params[:oauth_verifier])
      end
    end

## Informações para devs:

Build do gem package:

    gem build senhaunica.gemspec

Enviar para rubygems:

    gem push senhaunica-VERSION.gem
