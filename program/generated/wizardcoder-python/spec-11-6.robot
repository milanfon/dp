*** Settings ***
Library    SeleniumLibrary   

*** Keywords ***
Check if names "Benjamin Green", "Mia Orange", "Charlotte Purple" and "Isabella Yellow" are present on the page
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Input Text    id:loginPage.userNameInput    pedant
    Input Text    id:loginPage.passwordInput    pass
    Click Button    id:loginPage.loginFormSubmit
    Click Link    xpath://a[@aria-label="My Subjects"]
    Click Button    xpath://a[@aria-label="Students (4)"]
    Wait Until Element Is Visible    xpath://tr[@aria-label="Benjamin Green"]
    Wait Until Element Is Visible    xpath://tr[@aria-label="Mia Orange"]
    Wait Until Element Is Visible    xpath://tr[@aria-label="Charlotte Purple"]
    Wait Until Element Is Visible    xpath://tr[@aria-label="Isabella Yellow"]
    Click Button    xpath://button[@id="closeModalButtonCross"]
    Click Button    xpath://tr[@aria-label="Students (4)"]
    Wait Until Element Is Visible    xpath://tr[@aria-label="No students"]
    Close All Browsers

*** Test Cases ***
Check names
    Check if names "Benjamin Green", "Mia Orange", "Charlotte Purple" and "Isabella Yellow" are present on the page