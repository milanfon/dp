*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${url}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Open Page and Check Elements for Student
    Open Browser    ${url}    Chrome
    Maximize Browser Window
    Wait Until Page Contains Element    stu.mySubjects.successAlert    timeout=10s
    Wait Until Page Contains Element    stu.mySubjects.enrolledTable.Title    timeout=10s
    Wait Until Element Does Not Contain    xpath=//td[text()="Database Systems"]    visible    timeout=10s
    Close Browser

Login as Teacher and Check Elements
    Open Browser    ${url}    Chrome
    Maximize Browser Window
    Wait Until Page Contains Element    tea.mySubjects.table.listOfStudentsButton-1    text=Students (0)    timeout=10s
    Wait Until Page Contains Element    tea.myExamDates.table.participantsButton-1-0    text=Participants (0/10)    timeout=10s
    Click Element    tea.setEvaluation.form.examTermDateSelect
    Select From List by Index    tea.setEvaluation.form.examTermDateSelect    1
    Wait Until Page Contains Element    tea.setEvaluation.form.noOneStudent    timeout=10s
    Click Element    tea.evalTable.filter.subjectSelect
    Select From List by Index    tea.evalTable.filter.subjectSelect    2
    Click Element    tea.evalTable.filter.submitButton
    Wait Until Page Contains Element    xpath=//td[text()="No students on this exam date"]    timeout=10s
    Close Browser