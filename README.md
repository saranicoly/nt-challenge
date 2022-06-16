# Teste Neurotech

## Descrição & pré-requisitos

A API do backend foi criada usando Ruby on Rails, com autenticação com o hubspot através de API key, visto que infelizmente não houve tempo o suficiente para que eu pudesse realizar a integração através de OAuth no localhost.

A chave de API deve ser editada no arquivo `projeto/app/controllers/application_controller.rb` na linha 5.

Instale a dependência do cliente do hubspot bem como demais dependências com um `bundle install`.

Para executar o projeto, basta executar  o comando `rails s` na pasta, e se dirigir ao endereço `localhost:3000`.

## Melhorias

Uma melhoria imediata seria usarmos autenticação po OAuth, como dado nos requisitos do desafio.

Outra melhororia relevante seria aprimorar o front-end de forma a deixá-lo mais atrativo, através de alguma tecnologia como React.

Por fim, encapsular o projeto com o Docker e poder realizar o deploy desse container em alguma plataforma (como o Heroku ou o Cloud Run do GCP) deixariam a aplicação no ar de forma portátil.