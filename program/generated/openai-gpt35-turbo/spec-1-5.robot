*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Check Student View
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Wait Until Page Contains Element    id=header.link.login    10s
    Wait Until Page Does Not Contain Element    id=header.link.login    10s
    Wait Until Element Contains    id=header.title.userHome    Noah Brown    10s
    Wait Until Page Contains Element    id=header.link.logout    10s
    Wait Until Page Contains Element    css=#header.student-view-nav    10s
    Wait Until Element Contains    id=stu.view.title    Student's View    10s
    Wait Until Page Contains Element    id=overview.personalInfoForm    10s
    Close Browser

Check Teacher View
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Wait Until Page Contains Element    id=header.link.login    10s
    Wait Until Page Does Not Contain Element    id=header.link.login    10s
    Wait Until Element Contains    id=header.title.userHome    John Lazy    10s
    Wait Until Page Contains Element    id=header.link.logout    10s
    Wait Until Page Contains Element    css=#header.teacher-view-nav    10s
    Wait Until Element Contains    id=tea.view.title    Teacher's View    10s
    Wait Until Page Contains Element    id=overview.personalInfoForm    10s
    Close Browser

Check Login Errors
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Input Text    id=loginPage.userNameInput    bla
    Input Text    id=loginPage.passwordInput    pass
    Click Element    id=loginPage.loginFormSubmit
    Wait Until Page Contains Element    id=loginPage.errorAlert    10s
    Input Text    id=loginPage.userNameInput    lazy
    Input Text    id=loginPage.passwordInput    bla
    Click Element    id=loginPage.loginFormSubmit
    Wait Until Page Contains Element    id=loginPage.errorAlert    10s
    Close Browser