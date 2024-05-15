*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://localhost:4680/tbuis/index.jsp
${BROWSER}    Chrome

*** Test Cases ***
Test Case 1 - Student View
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Steps from the JSON recording
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    brown
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]

    # Checks after the steps
    Page Should Not Contain Element    id=header.link.login
    Page Should Contain Element    id=header.title.userHome    Noah Brown
    Page Should Contain Element    id=header.link.logout
    Page Should Contain Element    css=#header.student-view-nav
    ${text}=    Get Text    id=stu.view.title
    Should Be Equal    ${text}    Student's View
    Page Should Contain Element    id=overview.personalInfoForm

    Close Browser

Test Case 2 - Teacher View
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Steps from the JSON recording
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    lazy
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]

    # Checks after the steps
    Page Should Not Contain Element    id=header.link.login
    Page Should Contain Element    id=header.title.userHome    John Lazy
    Page Should Contain Element    id=header.link.logout
    Page Should Contain Element    css=#header.teacher-view-nav
    ${text}=    Get Text    id=tea.view.title
    Should Be Equal    ${text}    Teacher's View
    Page Should Contain Element    id=overview.personalInfoForm

    Close Browser

Test Case 3 - Invalid Logins
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.5

    # First invalid login
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    bla
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Page Should Contain Element    id=loginPage.errorAlert

    # Second invalid login
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    lazy
    Input Text    xpath://*[@id="loginPage.passwordInput"]    bla
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Page Should Contain Element    id=loginPage.errorAlert

    Close Browser