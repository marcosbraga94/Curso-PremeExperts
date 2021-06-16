*** Variables ***
&{PESSOAS}    
...            nome=Marcos    
...            sobrenome=Braga    
...            idade=27
...            dataNasc=22/03/1994
...            endereco=Rua Teste
...            num=60

@{FRUTAS}    Banana    Maçã    Abacaxi    Morango    Uva

*** Test Cases ***
Cenario: Imprimir Dados PESSOAS
    [Tags]            Exercicio1
    Log To Console    \n${PESSOAS.nome}
    Log To Console    ${PESSOAS.sobrenome}
    Log To Console    ${PESSOAS.idade}
    Log To Console    ${PESSOAS.dataNasc}
    Log To Console    ${PESSOAS.endereco}
    Log To Console    ${PESSOAS.num}

Cenario: Imprimir FRUTAS
    [Tags]            Exercicio2
    Log To Console   \n ${FRUTAS[0]}
    Log To Console   \n ${FRUTAS[1]}
    Log To Console   \n ${FRUTAS[2]}
    Log To Console   \n ${FRUTAS[3]}
    Log To Console   \n ${FRUTAS[4]}