# PDS TP

## Membros
- Gabriel Chaves Ferreira - Fullstack
- Higor de Andrade Silva Souza - Fullstack
- Philippe Lucas Santos Faria - Fullstack
- Victor Vieira de Melo - Fullstack

## Escopo
- O sistema tem como objetivo ser uma plataforma de procura de empregos expressa. Ou seja, você apenas visualiza as vagas e envia o seu currículo, e caso a empresa goste do seu perfil ela entrará em contato.
- Inicialmente sistema permite o cadastro tanto de um usuário quando de uma empresa. O usuário pode visualizar as vagas e enviar o seu currículo. Ja as empresas podem criar vagas e visualizar os candidatos que candidataram-se para elas.

## Tecnologias
1. Front -> Flutter
2. Backend -> NodeJS, Typescript e NestJS
3. DB -> PostgresSQL

## Protótipo
https://www.figma.com/file/qaL3u8jHNONZWWk7Kv7xTm/Quick-Job?node-id=0-1&t=fMcnoSEYKsQ3QicS-0

## Backlog do produto
**1. Como candidato, eu gostaria de me cadastrar no sistema.**

**2. Como empresa, eu gostaria de me cadastrar no sistema.**

**3. Como empresa, eu gostaria de criar uma vaga.**

**4. Como empresa, eu gostaria de visualizar minhas vagas.**

**5. Como empresa, eu gostaria de visualizar os usuários que candidataram-se para minhas vagas.**

**6. Como empresa, eu gostaria de mudar o status de uma vaga.**

**7. Como candidato, eu gostaria de visualizar as vagas.**

**8. Como candidato, eu gostaria de me candidatar para uma vaga.**

**9. Como candidato, eu gostaria de visualizar para quais vagas eu já me candidatei.**

**10. Como candidato, eu gostaria de cadastrar as minhas skills.**

**11. Como empresa, eu gostaria de cadastrar skills para uma vaga.**

**12. Como empresa, eu gostaria de visualizar possíveis candidatos para uma vaga baseado nas skills.**

**13. Como candidato, eu gostaria de visualizar possíveis vagas baseado nas minhas skills.**


## Backlog da Sprint 1
**1. Como usuário, eu gostaria de me cadastrar no sistema. **
  - Configurar banco de dados e criar primeiras tabelas.
  - Configurar o swagger no backend.
  - Criar imagem do docker para rodar o backend projeto.
  - Criar rota de autenticação para usuário.
  - Criar tela de SignIn/SignUp para usuario.


**2. Como empresa, eu gostaria de me cadastrar no sistema. **
  - Criar rota de autenticação para empresa.
  - Criar tela de SignIn/SignUp para empresa.


**3. Como empresa, eu gostaria de criar uma vaga. **
  - Criar rota para criar vaga.
  - Criar formulário para criar vaga conforme protótipo do figma.


**4. Como empresa, eu gostaria de visualizar minhas vagas. **
  - Criar rota listar as vagas de uma empresa.
  - Criar tela para exibir listagem de vagas.


**5. Como empresa, eu gostaria de visualizar os currículos dos usuários que candidataram-se para minhas vagas.**
  - Criar rota para listar os currículos dos usuários que candidataram-se as vagas.
  - Criar tela para exibir os currículos dos usuários que candidataram-se as vagas.


**6. Como usuário, eu gostaria de visualizar as vagas.**
  - Criar rota para listar as vagas.
  - Criar tela para exibir as vagas para um usuario.
