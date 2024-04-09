*** Settings ***
Documentation     Verify the appearance of a modal with participant names after an action.
Library           SeleniumLibrary

*** Variables ***
${LOGIN_URL}    http://localhost:4680/tbuis/index.jsp
${USERNAME}     orange
${PASSWORD}     pass

*** Test Cases ***
Check Participants After Clicking Participants Button
    Open Browser    ${LOGIN_URL}    Chrome
    Maximize Browser Window
    Set Selenium Speed    1 seconds
    Login And Navigate To My Exam Dates
    Verify Participants Modal And Its Contents
    Close Browser

*** Keywords ***
Login And Navigate To My Exam Dates
    Wait Until Element Is Visible    xpath=//input[@id='loginPage.userNameInput']    timeout=10
    Input Text    xpath=//input[@id='loginPage.userNameInput']    ${USERNAME}
    Input Text    xpath=//input[@id='loginPage.passwordInput']    ${PASSWORD}
    Click Element    xpath=//button[@id='loginPage.loginFormSubmit']
    Wait Until Element Is Visible    xpath=//a[@id='stu.menu.myExamDates']    timeout=10
    Click Element    xpath=//a[@id='stu.menu.myExamDates']
    Click Element    xpath=//button[contains(@id,'stu.myExamDates.table.ParticipantsButton-1')]

Verify Participants Modal And Its Contents
    Wait Until Element Is Visible    id=stu.myExamDates.participantsModal.title    timeout=10
    ${GreenVisible}=    Run Keyword And Return Status    Page Should Contain Element    xpath=//td[text()='Benjamin Green']
    ${OrangeVisible}=    Run Keyword And Return Status    Page Should Contain Element    xpath=//td[text()='Mia Orange']
    ${PurpleVisible}=    Run Keyword And Return Status    Page Should Contain Element    xpath=//td[text()='Charlotte Purple']
    ${YellowVisible}=    Run Keyword And Return Status    Page Should Contain Element    xpath=//td[text()='Isabella Yellow']
    Should Be True    ${GreenVisible}
    Should Be True    ${OrangeVisible}
    Should Be True    ${PurpleVisible}
    Should Be True    ${YellowVisible}