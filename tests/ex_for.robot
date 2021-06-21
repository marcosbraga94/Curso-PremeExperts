*** Test Cases ***
Cenario: Contando de 0 a 10
    [Tags]    Contando
    Contando

Cenario: Imprimir Paises
    [Tags]    Paises
    Paises

*** Keywords ***
Contando
    FOR    ${numero}   IN RANGE    0    11
        Log To Console    Estou no número:${numero}
    END

Paises
    FOR    ${paises}    IN    brasil    argentina    chile    colombia    uruguai
        Log To Console    ${paises}
    END