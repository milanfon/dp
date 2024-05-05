*** Settings ***
Library    SeleniumLibrary    plugins=SeleniumTestability;True;True;30    timeout=5s

*** Variables ***
${BROWSER}    Chrome
${DELAY}    0s
${URL}    http://localhost:4680

*** Test Cases ***
Teacher Test
    Open Browser    ${URL}    ${BROWSER}
    Set Viewport Size    1501    104
    Input Text    id:loginPage.userNameInput    strict
    Input Text    id:loginPage.passwordInput    pass
    Click Button    id:loginPage.loginFormSubmit
    Click Link    aria:My Subjects
    Click Button    id:tea.mySubjects.table.unregisterSubjectButton-0
    Click Link    aria:My Exam Dates
    Click Link    aria:New Exam Dates
    Click Link    aria:Set Evaluation
    Click Link    aria:Evaluation Table
    Click Link    aria:Others' Subjects
    Click Link    aria:List of All Teachers
    Close All Browsers

Student Test
    Open Browser    ${URL}    ${BROWSER}
    Set Viewport Size    1501    104
    Input Text    id:loginPage.userNameInput    orange
    Input Text    id:loginPage.passwordInput    pass
    Click Button    id:loginPage.loginFormSubmit
    Click Link    aria:Other Subjects
    Close All Browsers

*** Keywords ***
Open Browser
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    browser=${browser}    desired_capabilities=chromeOptions:args=['--headless', '--disable-gpu', '--no-sandbox', '--disable-dev-shm-usage', '--disable-extensions', '--disable-infobars', '--disable-browser-side-navigation', '--disable-dev-shm-usage', '--disable-gpu', '--disable-extensions', '--disable-extensions-file-access-check', '--disable-extensions-http-throttling', '--disable-extensions-https-check', '--disable-extensions-notifications', '--disable-notifications', '--disable-session-crashed-bubble', '--disable-session-storage', '--disable-web-security', '--ignore-certificate-errors', '--ignore-certificate-errors-spki-list', '--ignore-ssl-errors', '--allow-running-insecure-content', '--disable-web-security', '--disable-web-security', '--ignore-certificate-errors', '--ignore-ssl-errors=true']

Click Button
    [Arguments]    ${selector}
    Click Element    ${selector}
    Sleep    ${DELAY}

Click Link
    [Arguments]    ${selector}
    Click Element    ${selector}
    Sleep    ${DELAY}

Input Text
    [Arguments]    ${selector}    ${text}
    Input Text    ${selector}    ${text}
    Sleep    ${DELAY}