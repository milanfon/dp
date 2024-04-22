*** Settings ***
Library           SeleniumLibrary
Test Teardown     Close Browser

*** Variables ***
${DELAY}         500ms
${URL}           http://localhost:4680/tbuis/index.jsp

*** Keywords ***
Login As Student
    Click Link    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    brown
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Click Button    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}

Login As Teacher
    Click Link    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    lazy
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Click Button    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}

Login With Wrong Username
    Click Link    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    bla
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Click Button    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}

Login With Wrong Password
    Click Link    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    lazy
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    bla
    Sleep    ${DELAY}
    Click Button    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}

*** Test Cases ***
Student Login
    Open Browser    ${URL}    chrome
    Sleep    ${DELAY}
    Login As Student
    Sleep    ${DELAY}
    Element Should Not Be Visible    xpath://*[@id="header.link.login"]
    Page Should Contain Element    xpath://*[@id="header.title.userHome"]
    Element Text Should Be    xpath://*[@id="header.title.userHome"]    Noah Brown
    Page Should Contain Element    xpath://*[@id="header.link.logout"]
    Page Should Contain Element    css:#header.student-view-nav
    Element Text Should Be    xpath://*[@id="stu.view.title"]    Student's View
    Page Should Contain Element    xpath://*[@id="overview.personalInfoForm"]

Teacher Login
    Open Browser    ${URL}    chrome
    Sleep    ${DELAY}
    Login As Teacher
    Sleep    ${DELAY}
    Element Should Not Be Visible    xpath://*[@id="header.link.login"]
    Page Should Contain Element    xpath://*[@id="header.title.userHome"]
    Element Text Should Be    xpath://*[@id="header.title.userHome"]    John Lazy
    Page Should Contain Element    xpath://*[@id="header.link.logout"]
    Page Should Contain Element    css:#header.teacher-view-nav
    Element Text Should Be    xpath://*[@id="tea.view.title"]    Teacher's View
    Page Should Contain Element    xpath://*[@id="overview.personalInfoForm"]

Wrong Username Login
    Open Browser    ${URL}    chrome
    Sleep    ${DELAY}
    Login With Wrong Username
    Sleep    ${DELAY}
    Page Should Contain Element    xpath://*[@id="loginPage.errorAlert"]

Wrong Password Login
    Open Browser    ${URL}    chrome
    Sleep    ${DELAY}
    Login With Wrong Password
    Sleep    ${DELAY}
    Page Should Contain Element    xpath://*[@id="loginPage.errorAlert"]
