*** Settings ***
#Dentro do documentation estará presente informações a respeito do arquivo
Documentation    Aqui estarão presentes todos os exercícios do Prime Experts
...              focado em Imersão com Robot Framework

*** Variables ***
#Minha primeira variável Simples
${NOME}    Marcos Braga

#Minha primeira variável do tipo Dicionário
&{PESSOAS}    
...            nome=Marcos    
...            sobrenome=Braga    
...            idade=27

#Minha primeira variável do tipo lista
@{FRUTAS}    Banana    Maçã    Abacaxi    Morango

*** Test Cases ***
Cenario: Imprimir o Dicionário
    [Tags]            Teste1
    Log To Console    ${PESSOAS.nome}
    Log To Console    ${PESSOAS.idade}

Cenario: Realizar Soma
    [Tags]            SOMA
    ${RESULTADO}     Somar dois números    5    9
    Log To Console    ${RESULTADO} 

Cenario: Meu teste Soma
    [Tags]        SOMA_2
    ${RESULTADO}    Somar dois números "55" e "44"
    Log To Console    ${RESULTADO} 

*** Keywords ***
Somar dois números
    [Arguments]     ${NUM_A}    ${NUM_B}
    ${SOMA}         Evaluate    ${NUM_A}+${NUM_B}
    [Return]        ${SOMA}

Somar dois números "${NUM_A}" e "${NUM_B}"
    ${SOMA}    Evaluate    ${NUM_A}+${NUM_B}
    [Return]    ${SOMA}