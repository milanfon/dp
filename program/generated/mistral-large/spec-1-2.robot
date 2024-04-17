*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${Browser}    Chrome
${URL}        http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Student View Scenario
    Open Browser    ${URL}    ${Browser}
    Set Viewport    width=1501    height=1104
    Input Text    xpath//*[@id="loginPage.userNameInput"]    brown
    Input Password    xpath//*[@id="loginPage.passwordInput"]    pass
    Click Button    xpath//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Page Should Not Contain Element    id=header.link.login
    Page Should Contain Element    id=header.title.userHome    Noah Brown
    Page Should Contain Element    id=header.link.logout
    Page Should Contain Element    css=#header.student-view-nav
    Page Should Contain    Student's View    id=stu.view.title
    Page Should Contain Element    id=overview.personalInfoForm
    Close Browser

Teacher View Scenario
    Open Browser    ${URL}    ${Browser}
    Set Viewport    width=1501    height=1104
    Input Text    xpath//*[@id="loginPage.userNameInput"]    lazy
    Input Password    xpath//*[@id="loginPage.passwordInput"]    pass
    Click Button    xpath//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Page Should Not Contain Element    id=header.link.login
    Page Should Contain Element    id=header.title.userHome    John Lazy
    Page Should Contain Element    id=header.link.logout
    Page Should Contain Element    css=#header.teacher-view-nav
    Page Should Contain    Teacher's View    id=tea.view.title
    Page Should Contain Element    id=overview.personalInfoForm
    Close Browser

Invalid Login Scenario 1
    Open Browser    ${URL}    ${Browser}
    Set Viewport    width=1501    height=1104
    Input Text    xpath//*[@id="loginPage.userNameInput"]    bla
    Input Password    xpath//*[@id="loginPage.passwordInput"]    pass
    Click Button    xpath//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Page Should Contain Element    id=loginPage.errorAlert
    Close Browser

Invalid Login Scenario 2
    Open Browser    ${URL}    ${Browser}
    Set Viewport    width=1501    height=1104
    Input Text    xpath//*[@id="loginPage.userNameInput"]    lazy
    Input Password    xpath//*[@id="loginPage.passwordInput"]    bla
    Click Button    xpath//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Page Should Contain Element    id=loginPage.errorAlert
    Close Browser
