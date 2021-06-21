*** Settings ***
Library         AppiumLibrary

*** Variable ***
${EMAIL}        marcosbraga.teste123@gmail.com
${PASSWD}       Y%hdn3w$VWTLRxCw

*** Keywords ***
Abrir o aplicativo
  Open Application                http://localhost:4723/wd/hub
  ...                             automationName=UiAutomator2
  ...                             platformName=Android
  ...                             deviceName=emulator-5554
  ...                             autoGrantPermissions=true
  ...                             appPackage=com.google.android.youtube
  ...                             appActivity=com.google.android.youtube.HomeActivity

Fechar o aplicativo
  Capture Page Screenshot
  Close Application

Pesquisa um vídeo do "${VIDEO}"
  Wait Until Element Is Visible   accessibility_id=YouTube
  Click Element                   accessibility_id=Pesquisar
  Input Text                      id=com.google.android.youtube:id/search_edit_text     robotframework
  Press Keycode                   66

Certificar que a pesquisa foi realizada
  Wait Until Element Is Visible   xpath=//android.view.ViewGroup[@content-desc="QArentena 66: Robot Framework, por Mayara R. Fernandes - 2 horas e 49 minutos - Ir ao canal - Iterasys - 3,5 mil visualizações - Transmitido há 6 meses - assistir o vídeo"]/android.widget.ImageView[1]

Logar no aplicativo com a conta "${ACCOUNT}"
  Click Button                    xpath=//*[@id="header-bar"]/header/div/ytm-topbar-menu-button-renderer/button
  Wait Until Page Contains        id=simple-menu-header-title
  Click Element                   xpath=//*[@id="menu"]/div/ytm-multi-page-menu-renderer/div/ytm-active-account-header-renderer/div[1]/div/div[1]/c3-icon
  Click Link                      xpath=//*[@id="menu"]/div/ytm-multi-page-menu-renderer/div/ytm-multi-page-menu-section-renderer/ytm-compact-link-renderer[1]/a
  Element Should Be Visible       accesibility_id=Google
  Input Text                      id=identifierId       ${EMAIL}
  Click Button                    xpath=//*[@id="identifierNext"]/div/button
  Element Should Be Visible       xpath=//*[@id="view_container"]/div/div/div[1]/div/div[2]/div
  Input Password                  id=password           ${PASSWD}
  Click Button                    xpath=//*[@id="passwordNext"]/div/button

Verificar se a conta "${ACCOUNT}" foi logada
  Click Button                    xpath=//*[@id="header-bar"]/header/div/ytm-topbar-menu-button-renderer/button
  Click Element                   xpath=//*[@id="menu"]/div/ytm-multi-page-menu-renderer/div/ytm-active-account-header-renderer/div[1]/div/div[1]/c3-icon
  Element Should Be Visible       xpath=//*[@id="menu"]/div/ytm-multi-page-menu-renderer/div/ytm-account-section-list-renderer[1]

Entrar no menu “${EXPLORER}”
  Click Element                   accesibility_id=Explorar
  Element Should Be Visible       xpath=//*[@id="app"]/div[1]/ytm-browse/ytm-single-column-browse-results-renderer/div/div/ytm-section-list-renderer/ytm-channel-list-sub-menu-renderer/div

Usar swipe de tela até o 10 item da tela
  FOR   ${VAR}  IN RANGER   0   10
    Swipe   533   495   533    100
    ${VAR}=   Set Variable    ${VAR}+1  
  END
  Click Element                   xpath=//*[@id="app"]/div[1]/ytm-browse/ytm-single-column-browse-results-renderer/div/div/ytm-section-list-renderer/lazy-list/ytm-item-section-renderer[12]