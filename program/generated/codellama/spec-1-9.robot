*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}           http://localhost:4680/tbuis/

*** Test Cases ***
Student Test
    [Setup]    Open Browser    ${URL}    Chrome
    Wait Until Element Is Not Visible    id=header.link.login
    Element Text Should Be    id=header.title.userHome    Noah Brown
    Element Should Be Visible    id=header.link.logout
    Element Should Be Visible    css=#header.student-view-nav
    Element Text Should Be    id=stu.view.title    Student's View
    Element Should Be Visible    id=overview.personalInfoForm
    Close Browser

Teacher Test
    [Setup]    Open Browser    ${URL}    Chrome
    Wait Until Element Is Not Visible    id=header.link.login
    Element Text Should Be    id=header.title.userHome    John Lazy
    Element Should Be Visible    id=header.link.logout
    Element Should Be Visible    css=#header.teacher-view-nav
    Element Text Should Be    id=tea.view.title    Teacher's View
    Element Should Be Visible    id=overview.personalInfoForm
    Close Browser

Login Error
    [Setup]    Open Browser    ${URL}    Chrome
    Input Text    id=loginPage.userNameInput    bla
    Input Text    id=loginPage.passwordInput    pass
    Click Button    id=loginPage.loginFormSubmit
    Element Should Be Visible    id=loginPage.errorAlert
    Input Text    id=loginPage.userNameInput    lazy
    Input Text    id=loginPage.passwordInput    bla
    Click Button    id=loginPage.loginFormSubmit
    Element Should Be Visible    id=loginPage.errorAlert
    Close Browser