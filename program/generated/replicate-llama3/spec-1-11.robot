*** Settings ***
Library           SeleniumLibrary
Suite Teardown    Close Browser

*** Test Cases ***
Scenario 1 Student View
    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
    Set Window Size    1501    1104
    Click Element    xpath=//*[id="header.link.login"]
    Input Text    xpath=//*[id="loginPage.userNameInput"]    brown
    Input Password    xpath=//*[id="loginPage.passwordInput"]    pass
    Click Button    xpath=//*[id="loginPage.loginFormSubmit"]
    Sleep    2s
    Page Should Not Contain Element    xpath=//*[id="header.link.login"]
    Element Should Contain    xpath=//*[id="header.title.userHome"]    Noah Brown
    Page Should Contain Element    xpath=//*[id="header.link.logout"]
    Page Should Contain Element    xpath=//*[@id="header.student-view-nav"]
    Element Should Contain    xpath=//*[id="stu.view.title"]    Student's View
    Page Should Contain Element    xpath=//*[id="overview.personalInfoForm"]
    Close Browser

Scenario 2 Teacher View
    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
    Set Window Size    1501    1104
    Click Element    xpath=//*[id="header.link.login"]
    Input Text    xpath=//*[id="loginPage.userNameInput"]    lazy
    Input Password    xpath=//*[id="loginPage.passwordInput"]    pass
    Click Button    xpath=//*[id="loginPage.loginFormSubmit"]
    Sleep    2s
    Page Should Not Contain Element    xpath=<!--[id="header.link.login]-->
    Element Should Contain    xpath=//*[id="header.title.userHome"]    John Lazy
    Page Should Contain Element    xpath=//*[id="header.link.logout"]
    Page Should Contain Element    xpath=//*[@id="header.teacher-view-nav"]
    Element Should Contain    xpath=//*[id="tea.view.title"]     Teacher's View
    Page Should Contain Element     xpath=//*[id="overview.personalInfoForm"]
    Close Browser

Scenario 3 Login Error Handling
        Open Browser     http://localhost:4680/tbuis/index.jsp   chrome
        Set Window Size  1501   1104
        Click Element   xpath=//*[id="header.link.login"]
        Input Text      xpath=*[id="loginPage.userNameInput"]  bla
        Input Password  xpath=*[id="loginPage.passwordInput"]  pass
        Click Button   xpath=*[id="loginPage.loginFormSubmit"]
        Sleep   2s
        Page Should Contain Element   xpath=*[id="loginPage.errorAlert"]
        Close Browser
        
        Open Browser     http://localhost:4680/tbuis/index.jsp   chrome
        Set Window Size  1501   1104
        Click Element   xpath=*[id="header.link.login"]
        Input Text      xpath=*[id="loginPage.userNameInput"]  lazy
        Input Password  xpath=*[id="loginPage.passwordInput"]  bla
        Click Button   xpath=*[id="loginPage.loginFormSubmit"]
        Sleep   2s  
        Page Should Contain Element   xpath=*[id="loginPage.errorAlert"]
        Close Browser