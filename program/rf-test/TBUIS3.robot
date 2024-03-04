*** Settings ***
Library  SeleniumLibrary

*** Test Cases ***
Verify Student's View Page Title
    Open Browser  http://localhost:4680/tbuis/index.jsp  chrome
    Maximize Browser Window
    Click Element  xpath=//*[@id="header.link.login"]
    Wait Until Element Is Visible  id=loginPage.userNameInput
    Input Text  id=loginPage.userNameInput  brown
    Press Keys  None    TAB
    Input Text  id=loginPage.passwordInput  pass
    Click Element  xpath=//*[@id="loginPage.loginFormSubmit"]
    Wait Until Page Contains  Student's View
    ${title} =  Get Title
    Should Be Equal  ${title}  Student's View
