*** Settings ***
Library           SeleniumLibrary
Suite Teardown    Close All Browsers

*** Variables ***
${BASE_URL}    http://localhost:4680/tbuis
${BROWSER}    chrome

*** Test Cases ***
Student View Verification
    Open Browser And Navigate    ${BASE_URL}/index.jsp
    Perform Login    brown    pass
    Verify Student View Elements

Teacher View Verification
    Open Browser And Navigate    ${BASE_URL}/index.jsp
    Perform Login    lazy    pass
    Verify Teacher View Elements

Invalid Login Verification
    Perform Invalid Login Verification    bla    pass
    Perform Invalid Login Verification    lazy    bla

*** Keywords ***
Open Browser And Navigate
    [Arguments]    ${url}
    Open Browser    ${url}    ${BROWSER}
    Set Window Size    1501    1104
    Sleep    2s

Perform Login
    [Arguments]    ${username}    ${password}
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${username}
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${password}
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s

Verify Student View Elements
    Page Should Not Contain Element    xpath=//*[@id="header.link.login"]
    Element Text Should Be    xpath=//*[@id="header.title.userHome"]    Noah Brown
    Page Should Contain Element    xpath=//*[@id="header.link.logout"]
    Page Should Contain Element    css=#header.student-view-nav
    Element Text Should Be    xpath=//*[@id="stu.view.title"]    Student's View
    Page Should Contain Element    xpath=//*[@id="overview.personalInfoForm"]
    Close Browser

Verify Teacher View Elements
    Page Should Not Contain Element    xpath=//*[@id="header.link.login"]
    Element Text Should Be    xpath=//*[@id="header.title.userHome"]    John Lazy
    Page Should Contain Element    xpath=//*[@id="header.link.logout"]
    Page Should Contain Element    css=#header.teacher-view-nav
    Element Text Should Be    xpath=//*[@id="tea.view.title"]    Teacher's View
    Page Should Contain Element    xpath=//*[@id="overview.personalInfoForm"]
    Close Browser

Perform Invalid Login Verification
    [Arguments]    ${username}    ${password}
    Open Browser And Navigate    ${BASE_URL}/login
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${username}
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${password}
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Page Should Contain Element    xpath=//*[@id="loginPage.errorAlert"]
    Close Browser
