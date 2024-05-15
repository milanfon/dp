*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${BASE_URL}    http://localhost:4680/tbuis

*** Test Cases ***
Student Login And Check Elements
    Open Browser    ${BASE_URL}/index.jsp    ${BROWSER}
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    brown
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    3s
    Element Should Not Be Visible    xpath=//*[@id="header.link.login"]
    Element Text Should Be    xpath=//*[@id="header.title.userHome"]    Noah Brown
    Page Should Contain Element    xpath=//*[@id="header.link.logout"]
    Page Should Contain Element    css=#header.student-view-nav
    Element Text Should Be    xpath=//*[@id="stu.view.title"]    Student's View
    Page Should Contain Element    xpath=//*[@id="overview.personalInfoForm"]
    Close Browser

Teacher Login And Check Elements
    Open Browser    ${BASE_URL}/index.jsp    ${BROWSER}
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    lazy
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    3s
    Element Should Not Be Visible    xpath=//*[@id="header.link.login"]
    Element Text Should Be    xpath=//*[@id="header.title.userHome"]    John Lazy
    Page Should Contain Element    xpath=//*[@id="header.link.logout"]
    Page Should Contain Element    css=#header.teacher-view-nav
    Element Text Should Be    xpath=//*[@id="tea.view.title"]    Teacher's View
    Page Should Contain Element    xpath=//*[@id="overview.personalInfoForm"]
    Close Browser

Invalid Login Attempts
    Open Browser    ${BASE_URL}/login    ${BROWSER}
    Set Window Size    1501    1104
    Login And Check Error    bla    pass
    Login And Check Error    lazy    bla
    Close Browser

*** Keywords ***
Login And Check Error
    [Arguments]    ${username}    ${password}
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${username}
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${password}
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Page Should Contain Element    xpath=//*[@id="loginPage.errorAlert"]