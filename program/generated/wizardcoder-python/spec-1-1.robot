*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${DELAY}     1s
${URL}      http://localhost:4680/tbuis/

*** Test Cases ***
Scenario 1
    Open Browser    ${URL}    ${BROWSER}
    Wait Until Element Is Not Visible    id:header.link.login
    Wait Until Element Contains    id:header.title.userHome    Noah Brown
    Wait Until Element Is Visible    id:header.link.logout
    Wait Until Element Exists    xpath://*[@id='header.student-view-nav']
    Wait Until Element Contains    id:stu.view.title    Student's View
    Wait Until Element Exists    id:overview.personalInfoForm
    Close Browser

Scenario 2
    Open Browser    ${URL}    ${BROWSER}
    Wait Until Element Is Not Visible    id:header.link.login
    Wait Until Element Contains    id:header.title.userHome    John Lazy
    Wait Until Element Is Visible    id:header.link.logout
    Wait Until Element Exists    xpath://*[@id='header.teacher-view-nav']
    Wait Until Element Contains    id:tea.view.title    Teacher's View
    Wait Until Element Exists    id:overview.personalInfoForm
    Close Browser

Scenario 3
    Open Browser    ${URL}    ${BROWSER}
    Input Text    id:loginPage.userNameInput    bla
    Input Text    id:loginPage.passwordInput    pass
    Click Element    id:loginPage.loginFormSubmit
    Wait Until Element Is Visible    id:loginPage.errorAlert
    Close Browser

Scenario 4
    Open Browser    ${URL}    ${BROWSER}
    Input Text    id:loginPage.userNameInput    lazy
    Input Text    id:loginPage.passwordInput    bla
    Click Element    id:loginPage.loginFormSubmit
    Wait Until Element Is Visible    id:loginPage.errorAlert
    Close Browser