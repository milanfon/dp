*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
Suite Teardown    Close All Browsers

*** Test Cases ***
Scenario 1
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    brown
    Input Password    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Page Should Not Contain Element    xpath=//*[@id="header.link.login"]
    Element Text Should Be    xpath=//*[@id="header.title.userHome"]    Noah Brown
    Page Should Contain Element    xpath=//*[@id="header.link.logout"]
    Page Should Contain Element    xpath=//*[@id="header.student-view-nav"]
    Element Text Should Be    xpath=//*[@id="stu.view.title"]    Student's View
    Page Should Contain Element    xpath=//*[@id="overview.personalInfoForm"]

Scenario 2
    Close Browser
    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    lazy
    Input Password    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Page Should Not Contain Element    xpath=//*[@id="header.link.login"]
    Element Text Should Be    xpath=//*[@id="header.title.userHome"]    John Lazy
    Page Should Contain Element    xpath=//*[@id="header.link.logout"]
    Page Should Contain Element    xpath=//*[@id="header.teacher-view-nav"]
    Element Text Should Be    xpath=//*[@id="tea.view.title"]    Teacher's View
    Page Should Contain Element    xpath=//*[@id="overview.personalInfoForm"]

Scenario 3 - Invalid Login 1
    Close Browser
    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]   bla
    Input Password   xpath=//*[@id="loginPage.passwordInput"]   pass
     Click Element   xpath=//*[@id="loginPage.loginFormSubmit"]
     Sleep   2s
     Page Should Contain Element   xpath=//*[@id="loginPage.errorAlert"]

Scenario 4 - Invalid Login 2
     Close Browser 
     Open Browser   http://localhost:4680/tbuis/index.jsp   chrome 
     Set Window Size   1501   1104 
     Click Element   xpath=//*[@id="header.link.login"] 
     Input Text   xpath=//*[@id="loginPage.userNameInput"]   lazy 
     Input Password   xpath=//*[@id="loginPage.passwordInput"]   bla 
      Click Element   xpath=//*[@id="loginPage.loginFormSubmit"] 
      Sleep   2s 
      Page Should Contain Element   xpath=//*[@id="loginPage.errorAlert"]