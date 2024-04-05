*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        chrome
${BASE_URL}       http://localhost:4680/tbuis/index.jsp
${DELAY}          1s

*** Test Cases ***
Student View Verification
    Open Browser  ${BASE_URL}  ${BROWSER}
    Set Window Size  1501  1104
    Navigate To  http://localhost:4680/tbuis/login
    Click And Type  //*[@id="loginPage.userNameInput"]  brown
    Click And Type  //*[@id="loginPage.passwordInput"]  pass
    Click Element  //*[@id="loginPage.loginFormSubmit"]
    Wait And Verify Student View
    Close Browser

Teacher View Verification
    Open Browser  ${BASE_URL}  ${BROWSER}
    Set Window Size  1501  1104
    Navigate To  http://localhost:4680/tbuis/login
    Click And Type  //*[@id="loginPage.userNameInput"]  lazy
    Click And Type  //*[@id="loginPage.passwordInput"]  pass
    Click Element  //*[@id="loginPage.loginFormSubmit"]
    Wait And Verify Teacher View
    Close Browser

Invalid Login Username Bla
    Perform Invalid Login  bla  pass
    Verify Error Alert
    Close Browser

Invalid Login Password Bla
    Perform Invalid Login  lazy  bla
    Verify Error Alert
    Close Browser

*** Keywords ***
Navigate To
    [Arguments]  ${url}
    Go To  ${url}
    Sleep  ${DELAY}

Click And Type
    [Arguments]  ${selector}  ${text}
    Click Element  ${selector}
    Sleep  ${DELAY}
    Input Text  ${selector}  ${text}
    Sleep  ${DELAY}

Wait And Verify Student View
    Wait Until Page Contains Element  //*[@id="header.title.userHome"]  10s
    Element Should Not Be Visible  //*[@id="header.link.login"]
    Element Text Should Be  //*[@id="header.title.userHome"]  Noah Brown
    Page Should Contain Element  //*[@id="header.link.logout"]
    Page Should Contain Element  css=#header.student-view-nav
    Element Text Should Be  //*[@id="stu.view.title"]  Student's View
    Page Should Contain Element  //*[@id="overview.personalInfoForm"]

Wait And Verify Teacher View
    Wait Until Page Contains Element  //*[@id="header.title.userHome"]  10s
    Element Should Not Be Visible  //*[@id="header.link.login"]
    Element Text Should Be  //*[@id="header.title.userHome"]  John Lazy
    Page Should Contain Element  //*[@id="header.link.logout"]
    Page Should Contain Element  css=#header.teacher-view-nav
    Element Text Should Be  //*[@id="tea.view.title"]  Teacher's View
    Page Should Contain Element  //*[@id="overview.personalInfoForm"]

Perform Invalid Login
    [Arguments]  ${username}  ${password}
    Open Browser  ${BASE_URL}  ${BROWSER}
    Set Window Size  1501  1104
    Navigate To  http://localhost:4680/tbuis/login
    Click And Type  //*[@id="loginPage.userNameInput"]  ${username}
    Click And Type  //*[@id="loginPage.passwordInput"]  ${password}
    Click Element  //*[@id="loginPage.loginFormSubmit"]
    Sleep  2s

Verify Error Alert
    Page Should Contain Element  //*[@id="loginPage.errorAlert"]