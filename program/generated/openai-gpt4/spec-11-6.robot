*** Settings ***
Library    SeleniumLibrary    timeout=20

*** Variables ***
${BROWSER}    Chrome
${DELAY}   2s
${URL}    http://localhost:4680/tbuis/index.jsp
${BUTTON_LOGIN}    aria/Login
${INPUT_USERNAME}    aria/Username
${INPUT_PASSWORD}    aria/Password
${BUTTON_LOGIN_SUBMIT}    aria/Login[role=\"button\"]
${BUTTON_SUBJECT}    aria/My Subjects
${BUTTON_CLOSE_MODAL}    id:closeModalButtonCross
${BUTTON_STUDENT}    id:tea.mySubjects.table.listOfStudentsButton-2
${BUTTON_STUDENT_2}    id:tea.mySubjects.table.listOfStudentsButton-2


*** Keywords ***
Open Browser And Maximize
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Wait And Click
    [Arguments]    ${selector}
    Wait Until Element Is Visible    ${selector}    ${DELAY}
    Click Element    ${selector}

Wait And Input
    [Arguments]    ${selector}    ${value}
    Wait Until Element Is Visible    ${selector}    ${DELAY}
    Input Text    ${selector}    ${value}

Wait And Click Button
    [Arguments]    ${selector}
    Wait Until Element Is Visible    ${selector}    ${DELAY}
    Click Button    ${selector}

Wait And Click Button By Text
    [Arguments]    ${value}
    Wait Until Element Is Visible    xpath=//*[contains(text(), "${value}")]    ${DELAY}
    Click Button    xpath=//*[contains(text(), "${value}"]

Wait And Click Element By Xpath
    [Arguments]    ${xpath}
    Wait Until Element Is Visible    xpath=${xpath}    ${DELAY}
    Click Element    xpath=${xpath}

Wait And Click Element By Id
    [Arguments]    ${id}
    Wait Until Element Is Visible    ${id}    ${DELAY}
    Click Element    ${id}

Wait And Get Text
    [Arguments]    ${selector}
    Wait Until Element Is Visible    ${selector}    ${DELAY}
    ${text}    Get Text    ${selector}
    [Return]    ${text}

Wait And Get Text By Xpath
    [Arguments]    ${xpath}
    Wait Until Element Is Visible    ${xpath}    ${DELAY}
    ${text}    Get Text    ${xpath}
    [Return]    ${text}

Wait And Get Text By Id
    [Arguments]    ${id}
    Wait Until Element Is Visible    ${id}    ${DELAY}
    ${text}    Get Text    ${id}
    [Return]    ${text}

Check Text Presence
    [Arguments]    ${text}
    ${students}    Wait And Get Text    xpath://*[@id="tea.students.table.studentsTable"]
    Should Contain    ${students}    ${text}

Check Text Presence By Id
    [Arguments]    ${id}    ${text}
    ${students}    Wait And Get Text By Id    ${id}
    Should Contain    ${students}    ${text}

*** Test Cases ***
Test Scenario
    [Setup]    Open Browser And Maximize
    Wait And Click    ${BUTTON_LOGIN}
    Wait And Input    ${INPUT_USERNAME}    pedant
    Wait And Input    ${INPUT_PASSWORD}    pass
    Wait And Click    ${BUTTON_LOGIN_SUBMIT}
    Wait And Click    ${BUTTON_SUBJECT}
    Wait And Click    ${BUTTON_CLOSE_MODAL}
    Wait And Click    ${BUTTON_STUDENT}
    ${students}    Wait And Get Text    xpath://*[@id="tea.students.table.studentsTable"]
    Check Text Presence    Benjamin Green
    Check Text Presence    Mia Orange
    Check Text Presence    Charlotte Purple
    Check Text Presence    Isabella Yellow
    Wait And Click    ${BUTTON_STUDENT_2}
    Check Text Presence    Benjamin Green
    Check Text Presence    Mia Orange
    Check Text Presence    Charlotte Purple
    Check Text Presence    Isabella Yellow
    Wait And Click    ${BUTTON_CLOSE_MODAL}
    Close Browser