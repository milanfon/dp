*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        chrome
${BASE_URL}       http://localhost:4680/tbuis/index.jsp
${LOGIN_PAGE}     http://localhost:4680/tbuis/login
${STUDENT_VIEW}   http://localhost:4680/tbuis/student-view/overview
${TEACHER_VIEW}   http://localhost:4680/tbuis/teacher-view/overview
${DELAY}          1s

*** Test Cases ***
Login As Student And Verify
    Open And Setup Browser
    Navigate To Login Page And Login  brown  pass  ${STUDENT_VIEW}
    Verify Student View Elements
    [Teardown]  Close Browser

Login As Teacher And Verify
    Open And Setup Browser
    Navigate To Login Page And Login  lazy  pass  ${TEACHER_VIEW}
    Verify Teacher View Elements
    [Teardown]  Close Browser

Invalid Login With Username Bla
    Open And Setup Browser
    Attempt Invalid Login  bla  pass
    Verify Login Error
    [Teardown]  Close Browser

Invalid Login With Password Bla
    Open And Setup Browser
    Attempt Invalid Login  lazy  bla
    Verify Login Error
    [Teardown]  Close Browser

*** Keywords ***
Open And Setup Browser
    Open Browser  ${BASE_URL}  ${BROWSER}
    Set Window Size  1501  1104

Navigate To Login Page And Login
    [Arguments]  ${username}  ${password}  ${expected_url}
    Click Element  xpath=//*[@id="header.link.login"]
    Sleep  ${DELAY}
    Input Text  xpath=//*[@id="loginPage.userNameInput"]  ${username}
    Sleep  ${DELAY}
    Input Text  xpath=//*[@id="loginPage.passwordInput"]  ${password}
    Sleep  ${DELAY}
    Click Element  xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep  2s
    Location Should Be  ${expected_url}

Verify Student View Elements
    Page Should Not Contain Element  xpath=//*[@id="header.link.login"]
    Element Should Contain  xpath=//*[@id="header.title.userHome"]  Noah Brown
    Page Should Contain Element  xpath=//*[@id="header.link.logout"]
    Page Should Contain Element  css=#header.student-view-nav
    Element Should Contain  xpath=//*[@id="stu.view.title"]  Student's View
    Page Should Contain Element  xpath=//*[@id="overview.personalInfoForm"]

Verify Teacher View Elements
    Page Should Not Contain Element  xpath=//*[@id="header.link.login"]
    Element Should Contain  xpath=//*[@id="header.title.userHome"]  John Lazy
    Page Should Contain Element  xpath=//*[@id="header.link.logout"]
    Page Should Contain Element  css=#header.teacher-view-nav
    Element Should Contain  xpath=//*[@id="tea.view.title"]  Teacher's View
    Page Should Contain Element  xpath=//*[@id="overview.personalInfoForm"]

Attempt Invalid Login
    [Arguments]  ${username}  ${password}
    Click Element  xpath=//*[@id="header.link.login"]
    Sleep  ${DELAY}
    Input Text  xpath=//*[@id="loginPage.userNameInput"]  ${username}
    Sleep  ${DELAY}
    Input Text  xpath=//*[@id="loginPage.passwordInput"]  ${password}
    Sleep  ${DELAY}
    Click Element  xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep  2s

Verify Login Error
    Page Should Contain Element  xpath=//*[@id="loginPage.errorAlert"]