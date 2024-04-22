*** Settings ***
Library           SeleniumLibrary
Documentation     Suite description
...               Student unenrolls from subject, teacher checks for changes in counts and lists
Suite Setup       Open Browser To Login Page
Suite Teardown    Close All Browsers

*** Variables ***
${LOGIN URL}      http://localhost:4680/tbuis/login
${BASE URL}       http://localhost:4680/tbuis/
${BROWSER}        chrome
${DELAY}          2s

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Sleep            ${DELAY}

Login As Student
    Input Text       xpath://*[@id="loginPage.userNameInput"]    gray
    Sleep            ${DELAY}
    Input Text       xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep            ${DELAY}
    Submit Form

Login As Teacher
    Input Text       xpath://*[@id="loginPage.userNameInput"]    pedant
    Sleep            ${DELAY}
    Input Text       xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep            ${DELAY}
    Submit Form

Open Page
    [Arguments]     ${page}
    Go To           ${BASE URL}${page}
    Sleep            ${DELAY}

*** Test Cases ***
Student Unenrolls From Subject
    Login As Student
    Open Page       student-view/mySubjects
    Click Element    xpath://*[@id="stu.mySubjects.enrolledTable.unenrollSubjectButton-1"]
    Sleep            ${DELAY}
    Click Element    xpath://*[@id="stu.mySubjects.unenrollSubjectModal.unenrollSubjectButton"]
    Sleep            ${DELAY}
    Element Should Be Visible    xpath://*[@id="stu.mySubjects.successAlert"]
    Element Should Be Visible    xpath://*[@id="stu.mySubjects.enrolledTable.Title"]
    Element Should Not Be Visible    xpath://td[text()="Database Systems"]
    Sleep            ${DELAY}

Teacher Checks For Changes In Counts And Lists
    Login As Teacher
    Open Page       teacher-view/mySubjects
    Element Text Should Be     xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-1"]    Students (0) 
    Sleep            ${DELAY}
    Open Page       teacher-view/myExamDates
    Element Text Should Be     xpath://*[@id="tea.myExamDates.table.participantsButton-1-0"]     Participants (0/10) 
    Sleep            ${DELAY}
    Open Page       teacher-view/setEvaluation
    Click Element    xpath://*[@id="tea.setEvaluation.form.examTermDateSelect"]
    Sleep            ${DELAY}
    Click Element    xpath://*[@id="tea.setEvaluation.form.examTermDateSelect"]/option[2]
    Sleep            ${DELAY}
    Element Should Be Visible    xpath://*[@id="tea.setEvaluation.form.noOneStudent"]
    Sleep            ${DELAY}
    Open Page       teacher-view/evaluationTable
    Click Element    xpath://*[@id="tea.evalTable.filter.subjectSelect"]
    Sleep            ${DELAY}
    Click Element    xpath://*[@id="tea.evalTable.filter.subjectSelect"]/option[3]
    Sleep            ${DELAY}
    Click Element    xpath://*[@id="tea.evalTable.filter.submitButton"]
    Sleep            ${DELAY}
    Element Should Be Visible    xpath://td[text()="No students on this exam date"]
    Sleep            ${DELAY}