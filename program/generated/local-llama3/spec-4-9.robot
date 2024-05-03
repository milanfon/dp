*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open Browser    chrome
Suite Teardown    Close Browser

*** Test Cases ***
Student View
    Open Page
    Login As Student
    Check Student View

Teacher View
    Open Page
    Login As Teacher
    Check Teacher View

*** Keywords ***
Open Page
    Open Browser    chrome    http://localhost:4680/tbuis/index.jsp
    Set Window Size    1501    1104
    Set Selenium Timeout    30

Login As Student
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    gray
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginButton"]
    Click Element    xpath://*[@id="stu.menu.mySubjects"]
    Click Element    xpath://*[@id="stu.mySubjects.enrolledTable.unenrollSubjectButton-1"]
    Click Element    xpath://*[@id="stu.mySubjects.unenrollSubjectModal.unenrollSubjectButton"]
    Sleep    1

Check Student View
    Element Should Be Present    xpath://*[@id="stu.mySubjects.successAlert"]
    Element Should Be Present    xpath://*[@id="stu.mySubjects.enrolledTable.Title"]
    Element Should Not Be Present    xpath://*[@text="Database Systems" and @type="td"]
    Sleep    1

Login As Teacher
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    pedant
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginButton"]
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Click Element    xpath://*[@id="tea.menu.setEvaluation"]
    Click Element    xpath://*[@id="tea.setEvaluation.form.examTermDateSelect"]
    Click Element    xpath://*[@id="tea.setEvaluation.form.examTermDateSelect"]/option[2]
    Click Element    xpath://*[@id="tea.menu.evaluationTable"]
    Click Element    xpath://*[@id="tea.evalTable.filter.subjectSelect"]
    Click Element    xpath://*[@id="tea.evalTable.filter.subjectSelect"]/option[3]
    Click Element    xpath://*[@id="tea.evalTable.filter.submitButton"]
    Sleep    1

Check Teacher View
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    Element Should Contain    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-1"]    Students (0)
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Element Should Contain    xpath://*[@id="tea.myExamDates.table.participantsButton-1-0"]    Participants (0/10)
    Click Element    xpath://*[@id="tea.menu.setEvaluation"]
    Element Should Be Present    xpath://*[@id="tea.setEvaluation.form.noOneStudent"]
    Click Element    xpath://*[@id="tea.menu.evaluationTable"]
    Click Element    xpath://*[@id="tea.evalTable.filter.submitButton"]
    Element Should Be Present    xpath://*[@text="No students on this exam date" and @type="td"]
    Sleep    1