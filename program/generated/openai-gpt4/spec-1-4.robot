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
    Go To Page And Login  brown  pass
    Verify Student View Elements
    Close Browser

Teacher View Verification
    Open Browser  ${BASE_URL}  ${BROWSER}
    Set Window Size  1501  1104
    Go To Page And Login  lazy  pass
    Verify Teacher View Elements
    Close Browser

Invalid Login With Username Bla
    Open Browser  ${BASE_URL}  ${BROWSER}
    Set Window Size  1501  1104
    Try Invalid Login  bla  pass
    Close Browser

Invalid Login With Password Bla
    Open Browser  ${BASE_URL}  ${BROWSER}
    Set Window Size  1501  1104
    Try Invalid Login  lazy  bla
    Close Browser

*** Keywords ***
Go To Page And Login
    [Arguments]  ${username}  ${password}
    Go To  ${BASE_URL}
    Click Element  xpath=//*[@id="header.link.login"]
    Sleep  ${DELAY}
    Input Text  xpath=//*[@id="loginPage.userNameInput"]  ${username}
    Sleep  ${DELAY}
    Input Text  xpath=//*[@id="loginPage.passwordInput"]  ${password}
    Sleep  ${DELAY}
    Click Element  xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep  2s

Verify Student View Elements
    Wait Until Element Is Not Visible  xpath=//*[@id="header.link.login"]  timeout=10s
    Element Should Contain  xpath=//*[@id="header.title.userHome"]  Noah Brown
    Wait Until Element Is Visible  xpath=//*[@id="header.link.logout"]  timeout=10s
    Page Should Contain Element  css=#header.student-view-nav
    Element Should Contain  xpath=//*[@id="stu.view.title"]  Student's View
    Page Should Contain Element  xpath=//*[@id="overview.personalInfoForm"]

Verify Teacher View Elements
    Wait Until Element Is Not Visible  xpath=//*[@id="header.link.login"]  timeout=10s
    Element Should Contain  xpath=//*[@id="header.title.userHome"]  John Lazy
    Wait Until Element Is Visible  xpath=//*[@id="header.link.logout"]  timeout=10s
    Page Should Contain Element  css=#header.teacher-view-nav
    Element Should Contain  xpath=//*[@id="tea.view.title"]  Teacher's View
    Page Should Contain Element  xpath=//*[@id="overview.personalInfoForm"]

Try Invalid Login
    [Arguments]  ${username}  ${password}
    Go To  ${BASE_URL}
    Click Element  xpath=//*[@id="header.link.login"]
    Sleep  ${DELAY}
    Input Text  xpath=//*[@id="loginPage.userNameInput"]  ${username}
    Sleep  ${DELAY}
    Input Text  xpath=//*[@id="loginPage.passwordInput"]  ${password}
    Sleep  ${DELAY}
    Click Element  xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep  2s
    Page Should Contain Element  xpath=//*[@id="loginPage.errorAlert"]