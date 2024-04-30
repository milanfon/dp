*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROWSER}  Chrome
${URL}  http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Test Case Student View
    Open Browser  ${URL}  ${BROWSER}
    Set Window Size  1501  1104
    Maximize Browser Window

    # Steps from the JSON recording
    Click Element  xpath://*[@id="header.link.login"]
    Input Text  xpath://*[@id="loginPage.userNameInput"]  brown
    Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
    Click Element  xpath://*[@id="loginPage.loginFormSubmit"]

    # Checks after the steps
    Page Should Not Contain Element  id=header.link.login
    Page Should Contain Element  id=header.title.userHome
    ${text}=  Get Text  id=header.title.userHome
    Should Be Equal  ${text}  Noah Brown
    Page Should Contain Element  id=header.link.logout
    Page Should Contain Element  css:#header.student-view-nav
    ${text}=  Get Text  id=stu.view.title
    Should Be Equal  ${text}  Student's View
    Page Should Contain Element  id=overview.personalInfoForm

    Close Browser

Test Case Teacher View
    Open Browser  ${URL}  ${BROWSER}
    Set Window Size  1501  1104
    Maximize Browser Window

    # Steps from the JSON recording
    Click Element  xpath://*[@id="header.link.login"]
    Input Text  xpath://*[@id="loginPage.userNameInput"]  lazy
    Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
    Click Element  xpath://*[@id="loginPage.loginFormSubmit"]

    # Checks after the steps
    Page Should Not Contain Element  id=header.link.login
    Page Should Contain Element  id=header.title.userHome
    ${text}=  Get Text  id=header.title.userHome
    Should Be Equal  ${text}  John Lazy
    Page Should Contain Element  id=header.link.logout
    Page Should Contain Element  css:#header.teacher-view-nav
    ${text}=  Get Text  id=tea.view.title
    Should Be Equal  ${text}  Teacher's View
    Page Should Contain Element  id=overview.personalInfoForm

    Close Browser

Test Case Invalid Login
    Open Browser  ${URL}  ${BROWSER}
    Set Window Size  1501  1104
    Maximize Browser Window

    # Invalid login attempts
    Click Element  xpath://*[@id="header.link.login"]
    Input Text  xpath://*[@id="loginPage.userNameInput"]  bla
    Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
    Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
    Page Should Contain Element  id=loginPage.errorAlert

    Click Element  xpath://*[@id="header.link.login"]
    Input Text  xpath://*[@id="loginPage.userNameInput"]  lazy
    Input Text  xpath://*[@id="loginPage.passwordInput"]  bla
    Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
    Page Should Contain Element  id=loginPage.errorAlert

    Close Browser
