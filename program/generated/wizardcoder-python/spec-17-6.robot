*** Settings ***
Library    SeleniumLibrary    run_on_failure    Capture Page Screenshot

*** Variables ***
${URL}    http://localhost:4680/tbuis/
${BROWSER}    Chrome
${DELAY}    0.5s

*** Test Cases ***
Scenario: Teacher spec 17
    Open Browser    ${URL}    ${BROWSER}
    Set Window Size    1501    104
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    pedant
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="tea.menu.otherSubjects"]
    Click Element    xpath://*[@id="tea.otherSubjects.table.participateButton-3"]
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Click Element    xpath://*[@id="tea.menu.newExamDates"]
    Click Element    xpath://*[@id="tea.menu.listOfAllTeachers"]
    [Teardown]    Close Browser

Scenario: Student spec 17
    Open Browser    ${URL}    ${BROWSER}
    Set Window Size    1501    104
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    yellow
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="stu.menu.otherSubjects"]
    [Teardown]    Close Browser 

*** Keywords ***
Open Browser
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    browser=${browser}
    Maximize Browser Window
    Sleep    ${DELAY} 