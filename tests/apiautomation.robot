[20:28] Helder Fernandes de Paula (Convidado)
    *** Settings ***
Documentation           Aqui estarão presentes todas as Keywords dos testes de API.
Library                 RequestsLibrary
Library                 Collections
*** Variables ***
${​​​BASE_URL}​​​         https://fakerestapi.azurewebsites.net/api/v1
*** Keywords ***
Conectar a minha API
    Create Session      fakeAPI     ${​​​BASE_URL}​​​disable_warnings=${​​​True}​​​
${​​​HEADERS}​​​          Create Dictionary       content-type=application/json
    Set Suite Variable${​​​HEADERS}​​​
Requisitar todos os livros
${​​​RESPOSTA}​​​         Get On Session    fakeAPI    Books    expected_status=any
    Log${​​​RESPOSTA.text}​​​
    Set Test Variable${​​​RESPOSTA}​​​
Requisitar o livro "${​​​ID_LIVRO}​​​"
    Create Session      fakeAPI     ${​​​BASE_URL}​​​disable_warnings=${​​​True}​​​
${​​​HEADERS}​​​          Create Dictionary       content-type=application/json
    Set Suite Variable${​​​HEADERS}​​​
${​​​RESPOSTA}​​​         Get On Session    fakeAPI    Books/${​​​ID_LIVRO}​​​expected_status=any
    Log${​​​RESPOSTA.text}​​​
    Set Test Variable${​​​RESPOSTA}​​​
Conferir se retorna todos os dados corretos do livro 20
    Dictionary Should Contain Item${​​​RESPOSTA.json()}​​​      id          20
    Dictionary Should Contain Item${​​​RESPOSTA.json()}​​​      title       Book 20
    Dictionary Should Contain Item${​​​RESPOSTA.json()}​​​      pageCount   2000
    Should Not Be Empty${​​​RESPOSTA.json()["description"]}​​​
    Should Not Be Empty${​​​RESPOSTA.json()["excerpt"]}​​​
    Should Not Be Empty${​​​RESPOSTA.json()["publishDate"]}​​​
Conferir o status code
[Arguments]${​​​STATUSCODE_DESEJADO}​​​
    Should Be Equal As Strings${​​​RESPOSTA.status_code}​​​${​​​STATUSCODE_DESEJADO}​​​
Conferir o reason
[Arguments]${​​​REASON_DESEJADO}​​​
    Should Be Equal As Strings${​​​RESPOSTA.reason}​​​${​​​REASON_DESEJADO}​​​
Conferir se retorna uma lista com "${​​​QTDE_LIVROS}​​​" livros
    Length Should Be${​​​RESPOSTA.json()}​​​${​​​QTDE_LIVROS}​​​
Cadastrar um novo livro

Conferir se retorna todos os dados cadastrados do livro "201"

​[20:28] Helder Fernandes de Paula (Convidado)
    *** Settings ***
Documentation           Aqui estarão presentes os testes referentes as API's de de Books.
Resource                  ../resources/keywords/kws_apiautomation.robot
Suite Setup              Conectar a minha API
*** Test Case ***
Cenario: Buscar a listagem de todos os livros (GET em todos os livros)
[Tags]            TESTE_1
    Requisitar todos os livros
    Conferir o status code      200
    Conferir o reason           OK
    Conferir se retorna uma lista com "200" livros
Cenario: Buscar um livro específico(GET em um Livro específico)
[Tags]            TESTE_2
    Requisitar o livro "20"
    Conferir o status code      200
    Conferir o reason           OK
    Conferir se retorna todos os dados corretos do livro 20
Cenario: Cadastrar um novo livro (POST)
    Cadastrar um novo livro
    Conferir o status code      200
    Conferir o reason           OK
    Conferir se retorna todos os dados cadastrados do livro "201"
