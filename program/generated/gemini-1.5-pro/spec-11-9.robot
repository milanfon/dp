*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open Browser To Page
Suite Teardown    Close Browser

*** Variables ***
${BROWSER}        chrome
${DELAY}          2s

*** Keywords ***
Open Browser To Page
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Set Selenium Speed    ${DELAY}
    Maximize Browser Window

*** Test Cases ***
Check Students
    Click Element    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    pedant
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    Click Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    Page Should Contain    Benjamin Green
    Page Should Contain    Mia Orange
    Page Should Contain    Charlotte Purple
    Page Should Contain    Isabella Yellow
    Click Element    xpath://*[@id="closeModalButtonCross"]
    Click Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
    Page Should Contain    No students 
