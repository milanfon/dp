 ```python
*** Settings ***
Library                    SeleniumLibrary
Browser                    Chrome

*** Test Cases ***

# Teacher Scenario
My Teacher Scenario
    [Documentation]        Open the page and execute the steps from the recording
    [Documentation]        After cancelling an exam, check the page and alert

    [Setup]                 Open Browser

    [Step]                 Click Element      id=tea.menu.myExamDates
    [Step]                 Click Element      id=tea.menu.setEvaluation
    [Step]                 Click Element      id=tea.menu.evaluationTable
    [Step]                 Click Element      id=tea.evalTable.filter.subjectSelect
    [Step]                 Select From List    label=-1
    [Step]                 Click Element      id=tea.evalTable.filter.submitButton

    [Step]                 Click Element      id=tea.myExamDates.table.cancelButton-0-0
    [Step]                 Accept Alert
    [Step]                 Click Element      id=tea.myExamDates.table.cancelButton-0-0
    [Step]                 Click Element      id=tea.menu.myExamDates

    [Step]                 Click Element      id=tea.menu.setEvaluation
    [Step]                 Click Element      id=tea.menu.evaluationTable

    [Step]                 Click Element      id=tea.evalTable.filter.subjectSelect
    [Step]                 Select From List    label=-1
    [Step]                 Click Element      id=tea.evalTable.filter.submitButton

    [Step]                 Click Element      id=tea.evalTable.filter.subjectSelect
    [Step]                 Select From List    label=1202

    [Step]                 Click Element      id=tea.evalTable.filter.submitButton

    [Step]                 Click Element      id=tea.evalTable.filter.subjectSelect
    [Step]                 Select From List    label=1202

    [Step]                 Click Element      id=tea.evalTable.filter.submitButton

    [Step]                 Click Element      id=tea.evalTable.filter.subjectSelect
    [Step]                 Select From List    label=1202

    [Step]                 Click Element      id=tea.evalTable.filter.submitButton

    [Step]                 Click Element      id=tea.evalTable.filter.subjectSelect
    [Step]                 Select From List    label=1202

    [Step]                 Click Element      id=tea.evalTable.filter.submitButton

    [Step]                 Click Element      id=tea.evalTable.filter.subjectSelect
    [Step]                 Select From List    label=1202

    [Step]                 Click Element      id=tea.evalTable.filter.submitButton

    [Step]                 Click Element      id=tea.evalTable.filter.subjectSelect
    [Step]                 Select From List    label=1202

    [Step]                 Click Element      id=tea.evalTable.filter.submitButton

    [Step]                 Click Element      id=tea.evalTable.filter.subjectSelect
    [Step]                 Select From List    label=1202

    [Step]                 Click Element      id=tea.evalTable.filter.submitButton

    [Step]                 Click Element      id=tea.evalTable.filter.subjectSelect
    [Step]                 Select From List    label=1202

    [Step]                 Click Element      id=tea.evalTable.filter.submitButton

    [Step]                 Click Element      id=tea.evalTable.filter.subjectSelect
    [Step]                 Select From List    label=1202

    [Step]                 Click Element      id=tea.evalTable.filter.submitButton

    [Step]                 Click Element      id=tea.evalTable.filter.subjectSelect
    [Step]                 Select From List    label=1202

    [Step]                 Click Element      id=tea.evalTable.filter.submitButton

    [Step]                 Click Element      id=tea.evalTable.filter.subjectSelect
    [Step]                 Select From List    label=1202

    [Step]                 Click Element      id=tea.evalTable.filter.submitButton

    [Step]                 Click Element      id=tea.evalTable.filter.subjectSelect
    [Step]                 Select From List    label=1202

    [Step]                 Click Element      id=tea.evalTable.filter.submitButton

    [Step]                 Click Element      id=tea.evalTable.filter.subjectSelect
    [Step]                 Select From List    label=1202

    [Step]                 Click Element      id=tea.evalTable.filter.submitButton

    [Step]                 Click Element      id=tea.evalTable.filter.subjectSelect
    [Step]                 Select From List    label=1202

    [Step]                 Click Element      id=tea.evalTable.filter.submitButton

    [Step]                 Click Element      id=tea.evalTable.filter.subjectSelect
    [Step]                 Select From List    label=1202

    [Step]                 Click Element      id=tea.evalTable.filter.submitButton

    [Step]                 Click Element      id=tea.evalTable.filter.subjectSelect
    [Step]                 Select From List    label=1202

    [Step]                 Click Element      id=tea.evalTable.filter.submitButton

    [Step]                 Click Element      id=tea.evalTable.filter.subjectSelect
    [Step]                 Select From List    label=1202

    [Step]                 Click Element      id=tea.evalTable.filter.submitButton

    [Step]                 Click Element      id=tea.evalTable.filter.subjectSelect
    [Step]                 Select From List    label=1202

    [Step]                 Click Element      id=tea.evalTable.filter.submitButton

    [Step]                 Click Element      id=tea.evalTable.filter.subjectSelect
    [Step]                 Select From List    label=1202

    [Step]                 Click Element      id=tea.evalTable.filter.submitButton

    [Step]                 Click Element      id=tea.evalTable.filter.subjectSelect
    [Step]                 Select From List    label=1202

    [Step]                 Click Element      id=tea.evalTable.filter.submitButton

    [Step]                 Click Element      id=tea.evalTable.filter.subjectSelect
    [Step]                 Select From List    label=1202

    [Step]                 Click Element      id=tea.evalTable.filter.submitButton

    [Step]                 Click Element      id=tea.evalTable.filter.subjectSelect
    [Step]                 Select From List    label=1202

    [Step]                 Click Element      id=tea.evalTable.filter.submitButton

    [Step]                 Click Element      id=tea.evalTable.filter.subjectSelect
    [Step]                 Select From List    label=1202

    [Step]                 Click Element      id=tea.evalTable.filter.submitButton

    [Step]                 Click Element      id=tea.evalTable.filter.subjectSelect
    [Step]                 Select From List    label=1202

    [Step]                 Click Element      id=tea.evalTable.filter.submitButton

    [Step]                 Click Element      id=tea.evalTable.filter.subjectSelect
    [Step]                 Select From List    label=1202

    [Step]                 Click Element      id=tea.evalTable.filter.submitButton

    [Step]                 Click Element      id=tea.evalTable.filter.subjectSelect
    [Step]                 Select From List    label=1202

    [Step]                 Click Element      id=tea.evalTable.filter.submitButton

    [Step]                 Click Element      id=tea.evalTable.filter.subjectSelect
    [Step]                 Select From List    label=1202

    [Step]                 Click Element      id=tea.evalTable.filter.submitButton

    [Step]                 Click Element      id=tea.evalTable.filter.subjectSelect
    [Step]                 Select From List    label=1202

    [Step]                 Click Element      id=tea.evalTable.filter.submitButton

    [Step]                 Click Element      id=tea.evalTable.filter.subjectSelect
    [Step]                 Select From List    label=1202

    [Step]                 Click Element      id=tea.evalTable.filter.submitButton

    [Step]                 Click Element      id=tea.evalTable.filter.subjectSelect
    [Step]                 Select From List    label=1202

    [Step]                 Click Element      id=tea.evalTable.filter.submitButton

    [Step]                 Click Element      id=tea.evalTable.filter.subjectSelect
    [Step]                 Select From List    label=1202

    [Step]                 Click Element      id=tea.evalTable.filter.submitButton

    [Step]                 Click Element      id=tea.evalTable.filter.subjectSelect
    [Step]                 Select From List    label=1202

    [Step]                 Click Element      id=tea.evalTable.filter.submitButton

    [Step]                 Click Element      id=tea.evalTable.filter.subjectSelect
    [Step]                 Select From List    label=1202

    [Step]                 Click Element      id=tea.evalTable.filter.submitButton

    [Step]                 Click Element      id=tea.evalTable.filter.subjectSelect
    [Step]                 Select From List    label=1202

    [Step]                 Click Element      id=tea.evalTable.filter.submitButton

    [Step]                 Click Element      id=tea.evalTable.filter.subjectSelect
    [Step]                 Select From List    label=1202

    [Step]                 Click Element      id=tea.evalTable.filter.submitButton

    [Step]                 Click Element      id=tea.evalTable.filter.subjectSelect
    [Step]                 Select From List    label=1202

    [Step]                 Click Element      id=tea.evalTable.filter.submitButton

    [Step]                 Click Element      id=tea.evalTable.filter.subjectSelect
    [Step]                 Select From List    label=1202

    [Step]                 Click Element      id=tea.evalTable.filter.submitButton

    [Step]                 Click Element      id=tea.evalTable.filter.subjectSelect
    [Step]                 Select From List    label=1202

    [Step]                 Click Element      id=tea.evalTable.filter.submitButton

    [Step]                 Click Element      id=tea.evalTable.filter.subjectSelect
    [Step]                 Select From List    label=1202

    [Step]                 Click Element      id=tea.evalTable.filter.submitButton

    [Step]                 Click Element      id=tea.evalTable.filter.subjectSelect
    [Step]                 Select From List    label=1202

    [Step]                 Click Element      id=tea.evalTable.filter.submitButton

    [Step]                 Click Element      id=tea.evalTable.filter.subjectSelect
    [Step]                 Select From List    label=1202

    [Step]                 Click Element      id=tea.evalTable.filter.submitButton

    [Step]                 Click Element      id=tea.evalTable.filter.subjectSelect
    [Step]                 Select From List    label=1202

    [Step]                 Click Element      id=tea.evalTable.filter.submitButton

    [Step]                 Click Element      id=tea.evalTable.filter.subjectSelect
    [Step]                 Select From List    label=1202

    [Step]                 Click Element      id=tea.evalTable.filter.submitButton

    [Step]                 Click Element      id=tea.evalTable.filter.subjectSelect
    [Step]                 Select From List    label=120