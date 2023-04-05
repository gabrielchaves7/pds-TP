# PDS TP

## Membros
- Gabriel Chaves Ferreira - Fullstack
- Higor de Andrade Silva Souza - Fullstack
- Philippe Lucas Santos Faria - Fullstack
- Victor Vieira de Melo - Fullstack

## Escopo
- O sistema tem como objetivo calcular o score financeiro do usuário baseado no quanto ele ganha por ano e quando ele gasta por mês.
- Inicialmente sistema possui três features, uma onde o usuário informa os dados financeiros dele, outra onde ele consegue visualizar o resultado do score financeiro e uma outra onde ele consegue visualizar um gráfico com a evolução do seu score.

## Tecnologias
1. Front -> Flutter
2. Backend -> NodeJS, Typescript e NestJS
3. DB -> PostgresSQL

## Protótipo
https://www.figma.com/file/9H2lNOJDPoH7ixRGwKXhej/PDS-TP

## Backlog do produto
**1. Como usuário, eu gostaria de me cadastrar no sistema.**

**2. Como usuário, eu gostaria de realizar login pelo Google.**

**3. Como usuário, eu gostaria de calcular o meu score financeiro.**

**4. Como usuário, eu gostaria de visualizar o resultado do meu score financeiro.**

**5. Como admin, eu gostaria de visualizar relatórios de erro do projeto.**

**6. Como admin, eu gostaria de saber quantos usuários realizaram o cálculo do seu score financeiro.**

**7. Como usuário, eu gostaria de editar as informações de um score financeiro.**

**8. Como usuário, eu gostaria de excluir o resultado de um score financeiro.**

**9. Como usuário, eu gostaria de filtrar por resultados de score financeiro.**
 
**10. Como usuário, eu gostaria de visualizar o histórico dos meus scores em uma tabela.**

**11. Como usuário, eu gostaria de visualizar o histórico dos meus scores em forma de gráfico.**
 
**12. Como usuário, eu gostaria de visualizar o sistema no navegador do meu celular.**


## Backlog da Sprint 1
**1. Como usuário, eu gostaria de me cadastrar no sistema. (Gabriel Chaves)**
  - Configurar bando de dados e criar primeiras tabelas.
  - Configurar o swagger no backend.
  - Criar imagem do docker para rodar o backend projeto.
  - Criar rota de autenticação.
  - Criar tela de SignIn/SignUp.


**2. Como usuário, eu gostaria de realizar login pelo Google. (Philippe)**
  - Configurar o firebase para o projeto.
  - Configurar a autenticação pelo Google utilizando o firebase.
  - Adaptar tela de SignIn/SignUp.


**3. Como usuário, eu gostaria de calcular o meu score financeiro. (Victor)**
  - Criar e testar a rota para calcular o score financeiro, utilizando NestJS.
  - Criar formulário para preencher os dados financeiros conforme protótipo do figma.


**4. Como usuário, eu gostaria de visualizar o resultado do meu score financeiro. (Higor)**
  - Criar tela para exibir o resultado do score financeiro


**5. Como admin, eu gostaria de visualizar relatórios de erro do projeto.(Higor)**
  - Configurar o Crashlytics (firebase) para o frontend do projeto.


**6. Como admin, eu gostaria de saber quantos usuários realizaram o cálculo do seu score financeiro. (Victor)**
  - Configurar o Analytics (firebase) para o frontend do projeto.
