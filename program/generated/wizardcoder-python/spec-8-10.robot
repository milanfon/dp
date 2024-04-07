## Solution
### Student Scenario

*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${LOGIN_URL}  http://localhost:4680/tbuis/
${BROWSER}  chrome
${DELAY}  0.5s

*** Test Cases ***
Login as student
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Input Text    id=loginPage.userNameInput    green
    Input Text    id=loginPage.passwordInput    pass
    Click Element    id=loginPage.loginFormSubmit
    Click Element    id=stu.menu.otherExamDates
    Click Element    id=stu.otherExamDates.table.registerButton-2-0
    Click Element    id=stu.menu.myExamDates
    Wait Until Element Is Visible    id=stu.otherExamDates.successAlert    ${DELAY}
    Click Element    id=stu.menu.myExamDates
    Wait Until Element Is Visible    xpath=//td[.="Programming in Java"]    ${DELAY}
    Close All Browsers

*** Keywords ***
Wait Until Element Is Visible
    [Arguments]    ${locator}    ${delay}
    Wait Until Keyword Succeeds    ${delay}    ${delay}    Element Should Be Visible    ${locator}

### Teacher Scenario

*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${LOGIN_URL}  http://localhost:4680/tbuis/
${BROWSER}  chrome
${DELAY}  0.5s

*** Test Cases ***
Login as teacher
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Input Text    id=loginPage.userNameInput    strict
    Input Text    id=loginPage.passwordInput    pass
    Click Element    id=loginPage.loginFormSubmit
    Click Element    id=tea.menu.myExamDates
    Click Element    id=tea.myExamDates.table.participantsButton-1-0
    Wait Until Element Is Visible    xpath=//td[.="Mia Orange"]    ${DELAY}
    Close All Browsers

*** Keywords ***
Wait Until Element Is Visible
    [Arguments]    ${locator}    ${delay}
    Wait Until Keyword Succeeds    ${delay}    ${delay}    Element Should Be Visible    ${locator}


# Additional Info
You can use the following code to add delays between the steps:

    Sleep    ${DELAY}

Just add it after each click or any other keyword that needs to be delayed. 