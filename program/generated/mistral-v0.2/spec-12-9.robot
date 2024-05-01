*** Settings ***
Library            SeleniumLibrary
Browser            Chrome

*** Test Cases ***

# Scenario 1: Teacher checks My Exam Dates page

My Exam Dates Teacher
    [Document]    url = http://localhost:4680/tbuis/index.jsp
    [Document]    Login
    [Document]    Go To My Exam Dates
    [Document]    Click Cancel on My Exam Dates page
    [Document]    Accept Alert
    [Document]    Title Should Be My Exam Dates
    [Document]    Element Should Be Visible    id=tea.myExamDates.successAlert

    [Document]    Go To Set Evaluation
    [Document]    Title Should Be Set Evaluation
    [Document]    Element Should Be Visible    id=tea.setEvaluation.form.noRecords

# Scenario 2: Teacher checks Evaluation Table page

    [Document]    Go To Evaluation Table
    [Document]    Title Should Be Evaluation Table
    [Document]    Element Should Be Visible    option=0    tag=select    id=tea.evalTable.filter.subjectSelect
    [Document]    Click Filter
    [Document]    Text Should Be Equal    No exam dates for this subject

# Scenario 3: Student checks My Exam Dates page

My Exam Dates Student
    [Document]    url = http://localhost:4680/tbuis/index.jsp
    [Document]    Login
    [Document]    Title Should Not Contain    Computation Structures

*** Keywords ***

Login
    [Document]    ${LOGIN_BUTTON} = Find Element    xpath=//*[@id="header.link.login"]
    [Document]    Input Text    ${LOGIN_INPUT}    ${USERNAME}
    [Document]    Input Text    ${PASSWORD_INPUT}    ${PASSWORD}
    [Document]    Click Element    ${LOGIN_BUTTON}

Go To My Exam Dates
    [Document]    ${MY_EXAM_DATES_BUTTON} = Find Element    xpath=//*[@id="tea.menu.myExamDates"]
    [Document]    Click Element    ${MY_EXAM_DATES_BUTTON}

Click Cancel
    [Document]    ${CANCEL_BUTTON} = Find Element    xpath=//*[@id="tea.myExamDates.table.cancelButton-0-0"]
    [Document]    Click Element    ${CANCEL_BUTTON}

Accept Alert
    [Document]    Alert Text Should Be Equal    OK
    [Document]    Alert Accept

Title Should Be My Exam Dates
    [Document]    Title Should Be Equal    My Exam Dates

Element Should Be Visible
    [Document]    ${ELEMENT} = Find Element    ${LOCATOR}
    [Document]    Element Should Be Visible    ${ELEMENT}

Go To Set Evaluation
    ${SET_EVALUATION_BUTTON} = Find Element    xpath=//*[@id="tea.menu.setEvaluation"]
    [Document]    Click Element    ${SET_EVALUATION_BUTTON}

Go To Evaluation Table
    ${EVALUATION_TABLE_BUTTON} = Find Element    xpath=//*[@id="tea.menu.evaluationTable"]
    [Document]    Click Element    ${EVALUATION_TABLE_BUTTON}

Text Should Be Equal
    [Document]    ${TEXT} = Get Text    ${ELEMENT}
    [Document]    Text Should Be Equal    ${TEXT}

*** Variables ***

USERNAME = scatterbrained
PASSWORD = pass

*** Teardown ***

Teardown
    [Document]    Close Browser