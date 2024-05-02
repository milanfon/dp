*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
Suite Teardown    Close Browser

*** Test Cases ***
Teacher Login
    Login As Teacher
    Click Element    xpath://*[@id="tea.menu.otherSubjects"]
    Click Element    xpath://*[@id="tea.otherSubjects.table.participateButton-3"]
    Element Should Be Visible    xpath://*[@id="tea.otherSubjects.successAlert"]
    Element Should Contain    xpath://*[@id="tea.otherSubjects.table.participateButton-3"]/../..    Others' Subjects
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Element Should Contain    xpath://*[@id="tea.myExamDates.table.noRecords-2"]/../..    Linear Algebra
    Element Should Contain    xpath://*[@id="tea.myExamDates.table.noRecords-2"]/../..    No exam dates.
    Click Element    xpath://*[@id="tea.menu.newExamDates"]
    Element Should Contain    xpath://*[@id="tea.newExamDates.form.examSubject"]/option    Linear Algebra
    Click Element    xpath://*[@id="tea.menu.listOfAllTeachers"]
    Element Should Contain    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    Linear Algebra
    Element Should Contain    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2]    Alice Pedant
    Sleep    2 seconds
    Close Browser

Student Login
    Login As Student
    Click Element    xpath://*[@id="stu.menu.otherSubjects"]
    Element Should Contain    xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2]    Linear Algebra
    Element Should Contain    xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3]    Alice Pedant
    Sleep    2 seconds
    Close Browser

*** Keywords ***
Login As Teacher
    Input Text    xpath://*[@id="loginPage.userNameInput"]    pedant
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]

Login As Student
    Input Text    xpath://*[@id="loginPage.userNameInput"]    yellow
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]