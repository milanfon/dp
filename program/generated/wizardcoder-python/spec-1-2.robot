*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://localhost:4680
${BROWSER}    Chrome
${DELAY}    ${0}    # Set the delay between steps in seconds

*** Keywords ***
Open Browser To Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Close Browser
    Close Browser

Login
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    ${USERNAME}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    ${PASSWORD}
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]

*** Test Cases ***
Student Login
    [Setup]    Open Browser To Page
    ${USERNAME}    Set Variable    brown
    ${PASSWORD}    Set Variable    pass
    Login
    Sleep    ${DELAY}
    Page Should Not Contain Element    xpath://*[@id="header.link.login"]
    Element Should Contain    xpath://*[@id="header.title.userHome"]    Noah Brown
    Page Should Contain Element    xpath://*[@id="header.link.logout"]
    Page Should Contain Element    xpath://*[@id="header.student-view-nav"]
    Element Should Contain    xpath://*[@id="stu.view.title"]    Student's View
    Page Should Contain Element    xpath://*[@id="overview.personalInfoForm"]
    Close Browser

Teacher Login
    [Setup]    Open Browser To Page
    ${USERNAME}    Set Variable    lazy
    ${PASSWORD}    Set Variable    pass
    Login
    Sleep    ${DELAY}
    Page Should Not Contain Element    xpath://*[@id="header.link.login"]
    Element Should Contain    xpath://*[@id="header.title.userHome"]    John Lazy
    Page Should Contain Element    xpath://*[@id="header.link.logout"]
    Page Should Contain Element    xpath://*[@id="header.teacher-view-nav"]
    Element Should Contain    xpath://*[@id="tea.view.title"]    Teacher's View
    Page Should Contain Element    xpath://*[@id="overview.personalInfoForm"]
    Close Browser

Invalid Login
    [Setup]    Open Browser To Page
    ${USERNAME}    Set Variable    bla
    ${PASSWORD}    Set Variable    pass
    Login
    Sleep    ${DELAY}
    Page Should Contain Element    xpath://*[@id="loginPage.errorAlert"]
    Close Browser

Invalid Login
    [Setup]    Open Browser To Page
    ${USERNAME}    Set Variable    lazy
    ${PASSWORD}    Set Variable    bla
    Login
    Sleep    ${DELAY}
    Page Should Contain Element    xpath://*[@id="loginPage.errorAlert"]
    Close Browser