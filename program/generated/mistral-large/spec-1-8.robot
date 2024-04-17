*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}        http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Test Case 1 - Student View
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    # Steps from the JSON recording
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    brown
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]

    # Checkpoints
    Page Should Not Contain Element    xpath://*[@id="header.link.login"]
    Page Should Contain Element    xpath://*[@id="header.title.userHome"]    Noah Brown
    Page Should Contain Element    xpath://*[@id="header.link.logout"]
    Page Should Contain Element    css:#header.student-view-nav
    ${text}=    Get Text    xpath://*[@id="stu.view.title"]
    Should Be Equal    ${text}    Student's View
    Page Should Contain Element    xpath://*[@id="overview.personalInfoForm"]

    Close Browser

Test Case 2 - Teacher View
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    # Steps from the JSON recording
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    lazy
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]

    # Checkpoints
    Page Should Not Contain Element    xpath://*[@id="header.link.login"]
    Page Should Contain Element    xpath://*[@id="header.title.userHome"]    John Lazy
    Page Should Contain Element    xpath://*[@id="header.link.logout"]
    Page Should Contain Element    css:#header.teacher-view-nav
    ${text}=    Get Text    xpath://*[@id="tea.view.title"]
    Should Be Equal    ${text}    Teacher's View
    Page Should Contain Element    xpath://*[@id="overview.personalInfoForm"]

    Close Browser

Test Case 3 - Invalid Login
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    # Invalid login attempts
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    bla
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Page Should Contain Element    xpath://*[@id="loginPage.errorAlert"]

    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    lazy
    Input Text    xpath://*[@id="loginPage.passwordInput"]    bla
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Page Should Contain Element    xpath://*[@id="loginPage.errorAlert"]

    Close Browser