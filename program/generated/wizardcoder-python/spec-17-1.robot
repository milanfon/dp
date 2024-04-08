*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://localhost:4680/tbuis/
${BROWSER}    Chrome

*** Test Cases ***
Teacher Scenario
    Open Browser    ${URL}    ${BROWSER}
    Input Text    id:loginPage.userNameInput    pedant
    Input Text    id:loginPage.passwordInput    pass
    Click Button    id:loginPage.loginFormSubmit
    Click Link    xpath://*[@id="tea.menu.otherSubjects"]
    Click Link    xpath://*[@id="tea.otherSubjects.table.participateButton-3"]
    ${status}    Get Text    id:tea.otherSubjects.successAlert
    Should Contain    ${status}    You have successfully participated in the subject
    Page Should Contain    Linear Algebra
    Page Should Contain    id:tea.myExamDates.table.noRecords-2    No exam dates.
    Click Link    xpath://*[@id="tea.menu.myExamDates"]
    Click Link    xpath://*[@id="tea.menu.newExamDates"]
    Click Link    xpath://*[@id="tea.menu.listOfAllTeachers"]
    Page Should Contain    Linear Algebra
    Page Should Contain    Alice Pedant    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]
    Close Browser

Student Scenario
    Open Browser    ${URL}    ${BROWSER}
    Input Text    id:loginPage.userNameInput    yellow
    Input Text    id:loginPage.passwordInput    pass
    Click Button    id:loginPage.loginFormSubmit
    Click Link    xpath://*[@id="stu.menu.otherSubjects"]
    Page Should Contain    id:stu.otherSubjects.table.subjectRow-2    Linear Algebra
    Page Should Contain    Alice Pedant    xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3]
    Close Browser