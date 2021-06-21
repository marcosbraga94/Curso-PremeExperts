*** Variable ***
${Padrão_e-mail}    @robot.com

*** Test Cases ***
Cenario: Criar E-mail
    [Tags]    EMAIL
    ${EMAIL}    Cria E-mail    marcos    estevan    27
    Log To Console    ${EMAIL}

*** Keywords ***
Cria E-mail
    [Arguments]    ${NOME}        ${SOBRENOME}    ${IDADE}
    ${EMAIL}       Catenate       SEPARATOR=_     ${NOME}    ${SOBRENOME}    ${IDADE}    ${Padrão_e-mail}
    [Return]       ${EMAIL}