*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${url}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Open Page and Check Elements for Student
    Open Browser    ${url}    chrome
    Maximize Browser Window
    Wait Until Element Is Visible    id=stu.mySubjects.successAlert
    Wait Until Element Is Visible    id=stu.mySubjects.enrolledTable.Title
    Wait Until Element Is Not Visible    xpath=//td[text()='Database Systems']
    Close Browser

Login as Teacher and Check Elements
    Open Browser    ${url}    chrome
    Maximize Browser Window
    Wait Until Element Is Visible    id=tea.mySubjects.table.listOfStudentsButton-1    timeout=10s
    Element Should Contain    id=tea.mySubjects.table.listOfStudentsButton-1    Students (0)
    Wait Until Element Is Visible    id=tea.myExamDates.table.participantsButton-1-0    timeout=10s
    Element Should Contain    id=tea.myExamDates.table.participantsButton-1-0    Participants (0/10)
    Wait Until Element Is Visible    id=tea.setEvaluation.form.noOneStudent    timeout=10s
    Close Browser