*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://localhost:4680/tbuis/index.jsp
${LOGIN_URL}      http://localhost:4680/tbuis/login
${STUDENT_VIEW_URL}    http://localhost:4680/tbuis/student-view/overview
${USERNAME}       brown
${PASSWORD}       pass

*** Test Cases ***
Open Page And Verify Title
    Open Browser And Set Viewport
    Navigate To Login Page And Login
    Verify Page Title Is Students View

*** Keywords ***
Open Browser And Set Viewport
    Open Browser    ${URL}    Chrome
    Set Window Size    1501    1104
    Sleep    2s

Navigate To Login Page And Login
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${USERNAME}
    Sleep    1s
    Press Keys    xpath=//*[@id="loginPage.userNameInput"]    TAB
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${PASSWORD}
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s

Verify Page Title Is Students View
    ${title}=    Get Text    xpath=//*[@id="stu.view.title"]
    Should Be Equal    ${title}    Student's View

