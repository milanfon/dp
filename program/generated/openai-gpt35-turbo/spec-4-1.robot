*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${url}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Open Page and Perform Actions as Student
    Open Browser    ${url}    chrome
    Maximize Browser Window
    Set Viewport    1501    1104
    Wait Until Page Contains Element    id=stu.mySubjects.successAlert    timeout=10s
    Wait Until Page Contains Element    id=stu.mySubjects.enrolledTable.Title    timeout=10s
    Wait Until Page Does Not Contain Element    xpath=//td[text()='Database Systems']    timeout=10s
    Close Browser

Login as Teacher and Verify Elements
    Open Browser    ${url}    chrome
    Maximize Browser Window
    Set Viewport    1501    1104
    Wait Until Page Contains Element    id=tea.mySubjects.table.listOfStudentsButton-1    timeout=10s
    Wait Until Page Contains Element    id=tea.myExamDates.table.participantsButton-1-0    timeout=10s
    Wait Until Element Is Visible    id=tea.setEvaluation.form.noOneStudent    timeout=10s
    Wait Until Element Is Visible    xpath=//td[text()='No students on this exam date']    timeout=10s
    Close Browser