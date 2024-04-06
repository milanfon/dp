*** Settings ***
Library    SeleniumLibrary   

*** Keywords ***
Open browser and check element
    Open browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Sleep    3s
    Page should not contain element    xpath://*[@id="header.link.login"]
    Page should contain element    xpath://*[@id="header.title.userHome"]
    Page should contain element    xpath://*[@id="header.link.logout"]
    Page should contain element    xpath://*[@id="header.student-view-nav"]
    Page should contain element    xpath://*[@id="stu.view.title"]
    Page should contain element    xpath://*[@id="overview.personalInfoForm"]
    Close All Browsers

Login and check element
    Open browser    http://localhost:4680/tbuis/login    Chrome
    Sleep    3s
    Input Text    xpath://*[@id="loginPage.userNameInput"]    brown
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    3s
    ${text}=    Get Text    xpath://*[@id="stu.view.title"]
    Should Be Equal    ${text}    Student's View
    Page should not contain element    xpath://*[@id="loginPage.errorAlert"]
    Close All Browsers

*** Test Cases ***
Test student view
    Open browser and check element
    Login and check element

Test teacher view
    Open browser and check element
    Login and check element