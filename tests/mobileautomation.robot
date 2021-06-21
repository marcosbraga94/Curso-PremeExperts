*** Settings ***
Documentation        Aqui estarão presentes todos os testes mobiles do curso

Resource            "../resources/keywords/kw_mobileautomation.robot"

Test Setup          Abrir o aplicativo
Test Teardown       Fechar o aplicativo

*** Test Case ***
Caso de Teste 01: Abrindo o youtube
  Abrir App
  Pesquisa um vídeo do "robot framework"
  Certificar que a pesquisa foi realizada

Caso de Teste 02: Logar no YouTube
  Abrir App
  Logar no aplicativo com a conta "x"
  Verificar se a conta "x" foi logada

Caso de Teste 03: Usar método Swipe na tela
  Abrir App
  Entrar no menu “Explorar”
  Usar swipe de tela até o 10 item da tela