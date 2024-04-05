*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        chrome
${BASE_URL}       http://localhost:4680/tbuis/index.jsp
${DELAY}          1s

*** Test Cases ***
Verify Student View After Login
    Open Browser  ${BASE_URL}  ${BROWSER}
    Set Browser Viewport Size  1501  1104
    Navigate And Login  /login  brown  pass
    Check Student View Elements
    Close Browser

Verify Teacher View After Login
    Open Browser  ${BASE_URL}  ${BROWSER}
    Set Browser Viewport Size  1501  1104
    Navigate And Login  /login  lazy  pass
    Check Teacher View Elements
    Close Browser

Attempt Login With Invalid Username
    Open Browser  ${BASE_URL}  ${BROWSER}
    Set Browser Viewport Size  1501  1104
    Navigate And Login  /login  bla  pass
    Verify Error Alert Is Visible
    Close Browser

Attempt Login With Invalid Password
    Open Browser  ${BASE_URL}  ${BROWSER}
    Set Browser Viewport Size  1501  1104
    Navigate And Login  /login  lazy  bla
    Verify Error Alert Is Visible
    Close Browser

*** Keywords ***
Navigate And Login
    [Arguments]  ${path}  ${username}  ${password}
    Go To  ${BASE_URL}${path}
    Wait Until Element Is Visible  xpath=//*[@id="header.link.login"]
    Click Element  xpath=//*[@id="header.link.login"]
    Sleep  ${DELAY}
    Input Text  xpath=//*[@id="loginPage.userNameInput"]  ${username}
    Input Text  xpath=//*[@id="loginPage.passwordInput"]  ${password}
    Click Element  xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep  ${DELAY}

Check Student View Elements
    Element Should Not Be Visible  xpath=//*[@id="header.link.login"]
    Element Should Contain  xpath=//*[@id="header.title.userHome"]  Noah Brown
    Page Should Contain Element  xpath=//*[@id="header.link.logout"]
    Page Should Contain Element  css=#header.student-view-nav
    Element Text Should Be  xpath=//*[@id="stu.view.title"]  Student's View
    Page Should Contain Element  xpath=//*[@id="overview.personalInfoForm"]

Check Teacher View Elements
    Element Should Not Be Visible  xpath=//*[@id="header.link.login"]
    Element Should Contain  xpath=//*[@id="header.title.userHome"]  John Lazy
    Page Should Contain Element  xpath=//*[@id="header.link.logout"]
    Page Should Contain Element  css=#header.teacher-view-nav
    Element Text Should Be  xpath=//*[@id="tea.view.title"]  Teacher's View
    Page Should Contain Element  xpath=//*[@id="overview.personalInfoForm"]

Verify Error Alert Is Visible
    Page Should Contain Element  xpath=//*[@id="loginPage.errorAlert"]