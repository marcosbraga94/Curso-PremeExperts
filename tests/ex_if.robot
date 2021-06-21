*** Test Cases ***
Cenario: Contando de 0 a 10
    [Tags]    Contando
    Contando

*** Keywords ***
Contando
    FOR    ${numero}   IN RANGE    0    11
        IF    '${numero}'=='5' 
            Log To Console    Estou no número:${numero}
        ELSE IF    '${numero}'=='8'
            Log To Console    Estou no número:${numero}
        END
    END