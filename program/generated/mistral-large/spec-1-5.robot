*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}        http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Student View Checks
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    # Steps from the JSON recording
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    brown
    Input Password    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]

    # Checks after the steps
    Page Should Not Contain Element    id=header.link.login
    Page Should Contain Element    id=header.title.userHome    Noah Brown
    Page Should Contain Element    id=header.link.logout
    Page Should Contain Element    css=#header.student-view-nav
    Page Should Contain    Student's View    id=stu.view.title
    Page Should Contain Element    id=overview.personalInfoForm

    Close Browser

Teacher View Checks
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    # Steps from the JSON recording
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    lazy
    Input Password    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]

    # Checks after the steps
    Page Should Not Contain Element    id=header.link.login
    Page Should Contain Element    id=header.title.userHome    John Lazy
    Page Should Contain Element    id=header.link.logout
    Page Should Contain Element    css=#header.teacher-view-nav
    Page Should Contain    Teacher's View    id=tea.view.title
    Page Should Contain Element    id=overview.personalInfoForm

    Close Browser

Invalid Login Checks
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    # First invalid login
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    bla
    Input Password    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]

    Page Should Contain Element    id=loginPage.errorAlert

    # Second invalid login
    Input Text    xpath://*[@id="loginPage.userNameInput"]    lazy
    Input Password    xpath://*[@id="loginPage.passwordInput"]    bla
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]

    Page Should Contain Element    id=loginPage.errorAlert

    Close Browser