*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}        http://localhost:4680/tbuis/index.jsp
${USERNAME_1}    brown
${PASSWORD_1}    pass
${USERNAME_2}    lazy
${PASSWORD_2}    pass
${INVALID_USER}    bla

*** Test Cases ***
Student View Test
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Steps from JSON recording
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    ${USERNAME_1}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    ${PASSWORD_1}
    Click Button    xpath://*[@id="loginPage.loginFormSubmit"]

    # Checks after steps execution
    Page Should Not Contain Element    id=header.link.login
    Page Should Contain Element    id=header.title.userHome    Noah Brown
    Page Should Contain Element    id=header.link.logout
    Page Should Contain Element    css=#header.student-view-nav
    Page Should Contain    Student's View    xpath://*[@id="stu.view.title"]
    Page Should Contain Element    id=overview.personalInfoForm

    Close Browser

Teacher View Test
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Steps from JSON recording
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    ${USERNAME_2}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    ${PASSWORD_2}
    Click Button    xpath://*[@id="loginPage.loginFormSubmit"]

    # Checks after steps execution
    Page Should Not Contain Element    id=header.link.login
    Page Should Contain Element    id=header.title.userHome    John Lazy
    Page Should Contain Element    id=header.link.logout
    Page Should Contain Element    css=#header.teacher-view-nav
    Page Should Contain    Teacher's View    xpath://*[@id="tea.view.title"]
    Page Should Contain Element    id=overview.personalInfoForm

    Close Browser

Invalid Login Test 1
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Steps from JSON recording
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    ${INVALID_USER}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    ${PASSWORD_1}
    Click Button    xpath://*[@id="loginPage.loginFormSubmit"]

    # Checks after steps execution
    Page Should Contain Element    id=loginPage.errorAlert

    Close Browser

Invalid Login Test 2
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Steps from JSON recording
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    ${USERNAME_2}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    ${INVALID_USER}
    Click Button    xpath://*[@id="loginPage.loginFormSubmit"]

    # Checks after steps execution
    Page Should Contain Element    id=loginPage.errorAlert

    Close Browser