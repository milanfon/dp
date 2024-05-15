*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${DELAY}    1

*** Test Cases ***
Teacher Scenario
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Maximize Browser Window
    Click Element    xpath=//*[@id="header.link.login"]
    Input Text    id=loginPage.userNameInput    pedant
    Sleep    ${DELAY}
    Input Password    id=loginPage.passwordInput    pass
    Sleep    ${DELAY}
    Submit Form    id=loginPage.loginForm
    Click Element    id=tea.menu.otherSubjects
    Click Button    id=tea.otherSubjects.table.participateButton-3
    Page Should Contain    Others' Subjects
    Element Should Be Visible    id=tea.otherSubjects.successAlert
    Sleep    ${DELAY}
    Click Element    id=tea.menu.myExamDates
    Page Should Contain    Linear Algebra
    Page Should Contain Element    xpath=//tr[@id="tea.myExamDates.table.noRecords-2" and contains(text(), "No exam dates.")]
    Sleep    ${DELAY}    
    Click Element    id=tea.menu.newExamDates
    Page Should Contain Element    xpath=//option[text()="Linear Algebra"]
    Sleep    ${DELAY}
    Click Element    id=tea.menu.listOfAllTeachers
    Element Should Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    Linear Algebra
    Element Text Should Be    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2]    Alice Pedant
    Sleep    ${DELAY}
    Close Browser
    
Student Scenario
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Maximize Browser Window
    Click Element    xpath=//*[@id="header.link.login"]
    Input Text    id=loginPage.userNameInput    yellow  
    Sleep    ${DELAY}
    Input Password    id=loginPage.passwordInput    pass
    Sleep    ${DELAY}  
    Submit Form    id=loginPage.loginForm
    Click Element    id=stu.menu.otherSubjects
    Element Text Should Be    xpath=//*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2]    Linear Algebra
    Element Text Should Be    xpath=//*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3]    Alice Pedant
    Sleep    ${DELAY}
    Close Browser