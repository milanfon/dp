*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser    chrome    executable_path=/path/to/chromedriver
Suite Teardown    Close Browser

*** Test Cases ***
Student View
    Open Page    http://localhost:4680/tbuis/index.jsp
    Click Element    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    gray
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginButton"]
    Click Element    xpath://*[@id="stu.menu.mySubjects"]
    Click Element    xpath://*[@id="stu.mySubjects.enrolledTable.unenrollSubjectButton-1"]
    Click Element    xpath://*[@id="stu.mySubjects.unenrollSubjectModal.unenrollSubjectButton"]
    Wait Until Element Is Present    xpath://*[@id="stu.mySubjects.successAlert"]
    Element Should Be Present    xpath://*[@id="stu.mySubjects.enrolledTable.Title"]
    Element Should Not Be Present    xpath://*[@text="Database Systems"]

Teacher View
    Open Page    http://localhost:4680/tbuis/index.jsp
    Click Element    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    pedant
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginButton"]
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    Element Should Contain    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-1"]    Students (0) 
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Element Should Contain    xpath://*[@id="tea.myExamDates.table.participantsButton-1-0"]    Participants (0/10) 
    Click Element    xpath://*[@id="tea.menu.setEvaluation"]
    Click Element    xpath://*[@id="tea.setEvaluation.form.examTermDateSelect"]
    Click Element    xpath://*[@id="tea.setEvaluation.form.examTermDateSelect"]/option[2]
    Element Should Be Present    xpath://*[@id="tea.setEvaluation.form.noOneStudent"]
    Click Element    xpath://*[@id="tea.menu.evaluationTable"]
    Click Element    xpath://*[@id="tea.evalTable.filter.subjectSelect"]
    Click Element    xpath://*[@id="tea.evalTable.filter.subjectSelect"]/option[3]
    Click Element    xpath://*[@id="tea.evalTable.filter.submitButton"]
    Element Should Contain    xpath://*[@text="No students on this exam date"]
    Sleep    1s    # add a delay to see the result

*** Keywords ***
Open Page
    [Arguments]    ${url}
    Go To    ${url}
    Sleep    1s    # add a delay to see the result