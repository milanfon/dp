*** Settings ***
Library           SeleniumLibrary
Suite Teardown    Close Browser

*** Test Cases ***
Open Student Page And Verify Elements
    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    brown
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    1s
    Page Should Not Contain Element    xpath=//*[@id="header.link.login"]
    Element Text Should Be    xpath=//*[@id="header.title.userHome"]    Noah Brown
    Page Should Contain Element    xpath=//*[@id="header.link.logout"]
    Page Should Contain Element    css=#header.student-view-nav
    Element Text Should Be    xpath=//*[@id="stu.view.title"]    Student's View
    Page Should Contain Element    xpath=//*[@id="overview.personalInfoForm"]

Open Teacher Page And Verify Elements
    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    lazy
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    1s
    Page Should Not Contain Element    xpath=//*[@id="header.link.login"]
    Element Text Should Be    xpath=//*[@id="header.title.userHome"]    John Lazy
    Page Should Contain Element    xpath=//*[@id="header.link.logout"]
    Page Should Contain Element    css=#header.teacher-view-nav
    Element Text Should Be    xpath=//*[@id="tea.view.title"]    Teacher's View
    Page Should Contain Element    xpath=//*[@id="overview.personalInfoForm"]

Login With Invalid Credentials
    [Documentation]    Executes login attempts with invalid credentials and verifies error visibility.
    ${INVALID_USERNAMES}    Create List    bla    lazy
    ${INVALID_PASSWORDS}    Create List    pass    bla

    FOR    ${username}    IN    @{INVALID_USERNAMES}
        FOR    ${password}    IN    @{INVALID_PASSWORDS}
            Run Keyword    Attempt Login With Invalid Credentials    ${username}    ${password}
        END
    END

*** Keywords ***
Attempt Login With Invalid Credentials
    [Arguments]    ${username}    ${password}
    Open Browser    http://localhost:4680/tbuis/login    chrome
    Set Window Size    1501    1104
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${username}
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${password}
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    1s
    Page Should Contain Element    xpath=//*[@id="loginPage.errorAlert"]
    Close Browser