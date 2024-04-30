*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Student Login And Verify
    [Setup]    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    Click Element    xpath:///*[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath:///*[@id="loginPage.userNameInput"]    brown
    Sleep    2s
    Input Text    xpath:///*[@id="loginPage.passwordInput"]    pass
    Sleep    2s
    Click Element    xpath:///*[@id="loginPage.loginFormSubmit"]
    Sleep    5s
    Page Should Not Contain Element    xpath:///*[@id="header.link.login"]
    Element Text Should Be    xpath:///*[@id="header.title.userHome"]    Noah Brown
    Page Should Contain Element    xpath:///*[@id="header.link.logout"]
    Page Should Contain Element    css:#header.student-view-nav
    Element Text Should Be    xpath:///*[@id="stu.view.title"]    Student's View
    Page Should Contain Element    xpath:///*[@id="overview.personalInfoForm"]
    [Teardown]    Close Browser

Teacher Login And Verify
    [Setup]    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    Click Element    xpath:///*[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath:///*[@id="loginPage.userNameInput"]    lazy
    Sleep    2s
    Input Text    xpath:///*[@id="loginPage.passwordInput"]    pass
    Sleep    2s
    Click Element    xpath:///*[@id="loginPage.loginFormSubmit"]
    Sleep    5s
    Page Should Not Contain Element    xpath:///*[@id="header.link.login"]
    Element Text Should Be    xpath:///*[@id="header.title.userHome"]    John Lazy    
    Page Should Contain Element    xpath:///*[@id="header.link.logout"]
    Page Should Contain Element    css:#header.teacher-view-nav
    Element Text Should Be    xpath:///*[@id="tea.view.title"]    Teacher's View
    Page Should Contain Element    xpath:///*[@id="overview.personalInfoForm"]
    [Teardown]    Close Browser
    
Invalid Username Login
    [Setup]    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Click Element    xpath:///*[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath:///*[@id="loginPage.userNameInput"]    bla
    Sleep    2s
    Input Text    xpath:///*[@id="loginPage.passwordInput"]    pass
    Sleep    2s
    Click Element    xpath:///*[@id="loginPage.loginFormSubmit"]
    Sleep    5s
    Page Should Contain Element    xpath:///*[@id="loginPage.errorAlert"]
    [Teardown]    Close Browser
    
Invalid Password Login    
    [Setup]    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Click Element    xpath:///*[@id="header.link.login"]
    Sleep    2s 
    Input Text    xpath:///*[@id="loginPage.userNameInput"]    lazy
    Sleep    2s
    Input Text    xpath:///*[@id="loginPage.passwordInput"]    bla
    Sleep    2s
    Click Element    xpath:///*[@id="loginPage.loginFormSubmit"]
    Sleep    5s
    Page Should Contain Element    xpath:///*[@id="loginPage.errorAlert"]
    [Teardown]    Close Browser