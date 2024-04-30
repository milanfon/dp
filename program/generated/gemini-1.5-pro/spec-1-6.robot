*** Settings ***
Library           SeleniumLibrary
Documentation     Login Test Suite

*** Variables ***
${BROWSER}        chrome
${DELAY}          2s
${URL}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Student Login
    Open Browser To Login Page
    Login As Student
    Welcome Page Should Be Open

Teacher Login
    Open Browser To Login Page
    Login As Teacher
    Welcome Page Should Be Open

Invalid Username
    Open Browser To Login Page
    Try Login With Invalid Username
    Error Alert Should Be Visible

Invalid Password
    Open Browser To Login Page
    Try Login With Invalid Password
    Error Alert Should Be Visible

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    ${DELAY}

Login As Student
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    brown
    Sleep    ${DELAY}
    Input Password    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}

Welcome Page Should Be Open
    Page Should Not Contain Element    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    Element Text Should Be    xpath://*[@id="header.title.userHome"]    Noah Brown
    Sleep    ${DELAY}
    Page Should Contain Element    xpath://*[@id="header.link.logout"]
    Sleep    ${DELAY}
    Page Should Contain Element    css:#header.student-view-nav
    Sleep    ${DELAY}
    Element Text Should Be    xpath://*[@id="stu.view.title"]    Student's View
    Sleep    ${DELAY}
    Page Should Contain Element    xpath://*[@id="overview.personalInfoForm"]
    Sleep    ${DELAY}
    Close Browser

Login As Teacher
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    lazy
    Sleep    ${DELAY}
    Input Password    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}

Welcome Page Should Be Open
    Page Should Not Contain Element    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    Element Text Should Be    xpath://*[@id="header.title.userHome"]    John Lazy
    Sleep    ${DELAY}
    Page Should Contain Element    xpath://*[@id="header.link.logout"]
    Sleep    ${DELAY}
    Page Should Contain Element    css:#header.teacher-view-nav
    Sleep    ${DELAY}
    Element Text Should Be    xpath://*[@id="tea.view.title"]    Teacher's View
    Sleep    ${DELAY}
    Page Should Contain Element    xpath://*[@id="overview.personalInfoForm"]
    Sleep    ${DELAY}
    Close Browser

Try Login With Invalid Username
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    bla
    Sleep    ${DELAY}
    Input Password    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}

Error Alert Should Be Visible
    Page Should Contain Element    xpath://*[@id="loginPage.errorAlert"]
    Sleep    ${DELAY}
    Close Browser

Try Login With Invalid Password
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    lazy
    Sleep    ${DELAY}
    Input Password    xpath://*[@id="loginPage.passwordInput"]    bla
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}

Error Alert Should Be Visible
    Page Should Contain Element    xpath://*[@id="loginPage.errorAlert"]
    Sleep    ${DELAY}
    Close Browser 
