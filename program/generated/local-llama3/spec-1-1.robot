*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
Suite Teardown    Close Browser

*** Test Cases ***
Scenario 1
    Click    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    brown
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    1
    Page Should Not Contain Element    xpath=//*[@id="header.link.login"]
    Element Text Should Be    xpath=//*[@id="header.title.userHome"]    Noah Brown
    Page Should Contain Element    xpath=//*[@id="header.link.logout"]
    Page Should Contain Element    xpath=//*[@id="header.student-view-nav"]
    Element Text Should Be    xpath=//*[@id="stu.view.title"]    Student's View
    Page Should Contain Element    xpath=//*[@id="overview.personalInfoForm"]
    Close Browser
    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome

Scenario 2
    Click    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    lazy
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    1
    Page Should Not Contain Element    xpath=//*[@id="header.link.login"]
    Element Text Should Be    xpath=//*[@id="header.title.userHome"]    John Lazy
    Page Should Contain Element    xpath=//*[@id="header.link.logout"]
    Page Should Contain Element    xpath=//*[@id="header.teacher-view-nav"]
    Element Text Should Be    xpath=//*[@id="tea.view.title"]    Teacher's View
    Page Should Contain Element    xpath=//*[@id="overview.personalInfoForm"]
    Close Browser
    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome

Scenario 3
    Click    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    bla
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    1
    Page Should Contain Element    xpath=//*[@id="loginPage.errorAlert"]
    Close Browser
    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome

Scenario 4
    Click    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    lazy
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    bla
    Click    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    1
    Page Should Contain Element    xpath=//*[@id="loginPage.errorAlert"]
    Close Browser