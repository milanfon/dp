*** Settings ***
Documentation     Scenario for verifying the "Student's View" title on a specific page.
Library           SeleniumLibrary

*** Variables ***
${BASE_URL}    http://localhost:4680/tbuis
${USERNAME}    brown
${PASSWORD}    pass

*** Test Cases ***
Verify Student's View Title
    Open Browser To Login Page
    Login As Student
    Verify Student View Title

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${BASE_URL}/index.jsp    Chrome
    Maximize Browser Window
    Wait Until Page Contains Element    id=header.link.login    10s
    Click Element    id=header.link.login

Login As Student
    Wait Until Page Contains Element    id=loginPage.userNameInput    10s
    Input Text    id=loginPage.userNameInput    ${USERNAME}
    Input Text    id=loginPage.passwordInput    ${PASSWORD}
    Click Element    id=loginPage.loginFormSubmit
    Wait Until Page Contains    Student's View    10s    # Wait for redirection and page load

Verify Student View Title
    Wait Until Page Contains Element    id=stu.view.title    10s
    ${pageTitle}=    Get Text    id=stu.view.title
    Should Be Equal    ${pageTitle}    Student's View

    [Teardown]    Close Browser
