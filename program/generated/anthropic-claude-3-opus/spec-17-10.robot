*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${DELAY}    0.5

*** Test Cases ***
Teacher Scenario
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Maximize Browser Window
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    pedant
    Sleep    ${DELAY}
    Input Password    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Click Button    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.menu.otherSubjects"]
    Sleep    ${DELAY}
    Click Button    xpath://*[@id="tea.otherSubjects.table.participateButton-3"]
    Sleep    ${DELAY}
    Page Should Contain    Others' Subjects
    Page Should Contain Element    xpath://*[@id="tea.otherSubjects.successAlert"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Sleep    ${DELAY}
    Page Should Contain    Linear Algebra
    Page Should Contain Element    xpath://*[@id="tea.myExamDates.table.noRecords-2" and contains(., "No exam dates.")]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.menu.newExamDates"]
    Sleep    ${DELAY}
    Page Should Contain Element    xpath://option[contains(text(), "Linear Algebra")]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.menu.listOfAllTeachers"]
    Sleep    ${DELAY}
    Element Text Should Be    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    Linear Algebra
    Element Text Should Match    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2]    Alice Pedant
    Sleep    ${DELAY}
    Close Browser

Student Scenario
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Maximize Browser Window
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    yellow
    Sleep    ${DELAY}  
    Input Password    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Click Button    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="stu.menu.otherSubjects"]
    Sleep    ${DELAY}
    Element Text Should Be    xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2]    Linear Algebra
    Element Text Should Be    xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3]    Alice Pedant
    Sleep    ${DELAY}
    Close Browser