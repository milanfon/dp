*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Student View Test
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Viewport Size    1501    1104
    Input Text    xpath///*[@id="loginPage.userNameInput"]    brown
    Input Text    xpath///*[@id="loginPage.passwordInput"]    pass
    Click Button    xpath///*[@id="loginPage.loginFormSubmit"]
    Wait Until Page Contains    Student's View

    # Checks for student view
    Page Should Not Contain Element    xpath///*[@id="header.link.login"]
    Page Should Contain Element    xpath///*[@id="header.title.userHome"]    Noah Brown
    Page Should Contain Element    xpath///*[@id="header.link.logout"]
    Page Should Contain Element    css:#header.student-view-nav
    ${text}=    Get Text    xpath///*[@id="stu.view.title"]
    Should Be Equal    ${text}    Student's View
    Page Should Contain Element    xpath///*[@id="overview.personalInfoForm"]
    Close Browser

Teacher View Test
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Viewport Size    1501    1104
    Input Text    xpath///*[@id="loginPage.userNameInput"]    lazy
    Input Text    xpath///*[@id="loginPage.passwordInput"]    pass
    Click Button    xpath///*[@id="loginPage.loginFormSubmit"]
    Wait Until Page Contains    Teacher's View

    # Checks for teacher view
    Page Should Not Contain Element    xpath///*[@id="header.link.login"]
    Page Should Contain Element    xpath///*[@id="header.title.userHome"]    John Lazy
    Page Should Contain Element    xpath///*[@id="header.link.logout"]
    Page Should Contain Element    css:#header.teacher-view-nav
    ${text}=    Get Text    xpath///*[@id="tea.view.title"]
    Should Be Equal    ${text}    Teacher's View
    Page Should Contain Element    xpath///*[@id="overview.personalInfoForm"]
    Close Browser

Invalid Login Test - Wrong Username
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Viewport Size    1501    1104
    Input Text    xpath///*[@id="loginPage.userNameInput"]    bla
    Input Text    xpath///*[@id="loginPage.passwordInput"]    pass
    Click Button    xpath///*[@id="loginPage.loginFormSubmit"]

    # Check for invalid login - wrong username
    Page Should Contain Element    xpath///*[@id="loginPage.errorAlert"]
    Close Browser

Invalid Login Test - Wrong Password
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Viewport Size    1501    1104
    Input Text    xpath///*[@id="loginPage.userNameInput"]    lazy
    Input Text    xpath///*[@id="loginPage.passwordInput"]    bla
    Click Button    xpath///*[@id="loginPage.loginFormSubmit"]

    # Check for invalid login - wrong password
    Page Should Contain Element    xpath///*[@id="loginPage.errorAlert"]
    Close Browser