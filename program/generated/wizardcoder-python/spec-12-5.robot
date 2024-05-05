*** Settings ***
Library    SeleniumLibrary    WITH NAME    Selenium
Library    Collections

*** Variables ***
${DELAY}                   0
${BROWSER}                 Chrome
${URL}                    http://localhost:4680
${USERNAME}               scatterbrained
${PASSWORD}              pass
${USERNAME_ST}            orange
${PASSWORD_ST}           pass

*** Test Cases ***
Teacher Scenario
    Open Browser    ${URL}    ${BROWSER}
    Input Text    id:loginPage.userNameInput    ${USERNAME}
    Input Text    id:loginPage.passwordInput    ${PASSWORD}
    Click Button    id:loginPage.loginFormSubmit
    Wait Until Page Contains    Teacher's View
    Click Link    Teacher's View
    Click Link    My Exam Dates
    Click Button    id:tea.myExamDates.table.cancelButton-0-0
    Wait Until Page Contains    My Exam Dates
    Click Link    Set Evaluation
    Wait Until Page Contains    Set Evaluation
    Click Link    Evaluation Table
    Wait Until Page Contains    Evaluation Table
    Click Element    xpath://*[@id="tea.evalTable.filter.subjectSelect"]
    Click Element    xpath://*[@id="tea.evalTable.filter.subjectSelect"]/option[2]
    Click Button    id:tea.evalTable.filter.submitButton
    Wait Until Page Contains    No exam dates for this subject
    Click Link    Logout
    Wait Until Page Contains    Login Page
    Close Browser

Student Scenario
    Open Browser    ${URL}    ${BROWSER}
    Input Text    id:loginPage.userNameInput    ${USERNAME_ST}
    Input Text    id:loginPage.passwordInput    ${PASSWORD_ST}
    Click Button    id:loginPage.loginFormSubmit
    Wait Until Page Contains    Student's View
    Click Link    Student's View
    Click Link    My Exam Dates
    Wait Until Page Contains    My Exam Dates
    Page Should Contain    Computation Structures
    Click Link    Logout
    Wait Until Page Contains    Login Page
    Close Browser

*** Keywords ***
Open Browser
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    ${browser}    chrome
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Set Browser Implicit Wait    10
    Set Selenium Timeout    10
    Set Selenium Implicit Wait    10
    Go To    ${url}

Wait Until Page Contains
    [Arguments]    ${text}
    Wait Until Page Contains Element    ${text}

Click Element
    [Arguments]    ${selector}
    ${element}    Get Webelement    ${selector}
    Wait Until Element Is Visible    ${element}    timeout=10
    Click Element    ${element}

Click Link
    [Arguments]    ${text}
    ${element}    Get Webelement    xpath=//a[text()='${text}']
    Wait Until Element Is Visible    ${element}    timeout=10
    Click Link    ${element}

Click Button
    [Arguments]    ${selector}
    ${element}    Get Webelement    ${selector}
    Wait Until Element Is Visible    ${element}    timeout=10
    Click Button    ${element}

Input Text
    [Arguments]    ${selector}    ${text}
    ${element}    Get Webelement    ${selector}
    Wait Until Element Is Visible    ${element}    timeout=10
    Input Text    ${element}    ${text}

Page Should Contain
    [Arguments]    ${text}
    Wait Until Page Contains    ${text}

Page Should Contain Element
    [Arguments]    ${selector}
    ${element}    Get Webelement    ${selector}
    Wait Until Element Is Visible    ${element}    timeout=10
    Page Should Contain Element    ${element}

Get Webelement
    [Arguments]    ${selector}
    ${element}    Get Webelement    ${selector}
    [Return]    ${element}

Close Browser
    Close Browser

Set Browser Implicit Wait
    [Arguments]    ${seconds}
    Set Selenium Implicit Wait    ${seconds}

Set Selenium Implicit Wait
    [Arguments]    ${seconds}
    Set Selenium Implicit Wait    ${seconds}

Set Selenium Speed
    [Arguments]    ${seconds}
    Set Selenium Speed    ${seconds}

Set Selenium Timeout
    [Arguments]    ${seconds}
    Set Selenium Timeout    ${seconds} 