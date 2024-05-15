*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://localhost:4680/tbuis/index.jsp
${BROWSER}    Chrome
${DELAY}    2s

*** Test Cases ***
Teacher Test
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Login As Teacher
    Click Element    xpath://a[@id='tea.menu.otherSubjects']
    Sleep    ${DELAY}
    Click Element    xpath://button[@id='tea.otherSubjects.table.participateButton-3']
    Sleep    ${DELAY}
    Page Should Contain Element    xpath://*[@id="tea.otherSubjects.successAlert"]
    Element Should Be Visible    xpath://*[@id="tea.otherSubjects.successAlert"]
    Click Element    xpath://a[@id='tea.menu.myExamDates']
    Sleep    ${DELAY}
    Page Should Contain    Linear Algebra
    Page Should Contain Element    xpath://tr[@id='tea.myExamDates.table.noRecords-2']
    Click Element    xpath://a[@id='tea.menu.newExamDates']
    Sleep    ${DELAY}
    Page Should Contain Element    xpath://option[contains(text(), 'Linear Algebra')]
    Click Element    xpath://a[@id='tea.menu.listOfAllTeachers']
    Sleep    ${DELAY}
    Page Should Contain Element    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3][contains(text(), 'Linear Algebra')]
    Page Should Contain Element    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2][contains(text(), 'Alice Pedant')]
    Close Browser

Student Test
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Login As Student
    Click Element    xpath://a[@id='stu.menu.otherSubjects']
    Sleep    ${DELAY}
    Page Should Contain Element    xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2][contains(text(), 'Linear Algebra')]
    Page Should Contain Element    xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3][contains(text(), 'Alice Pedant')]
    Close Browser

*** Keywords ***
Login As Teacher
    Input Text    xpath://input[@id='loginPage.userNameInput']    pedant
    Input Text    xpath://input[@id='loginPage.passwordInput']    pass
    Click Element    xpath://button[@id='loginPage.loginFormSubmit']
    Sleep    ${DELAY}

Login As Student
    Input Text    xpath://input[@id='loginPage.userNameInput']    yellow
    Input Text    xpath://input[@id='loginPage.passwordInput']    pass
    Click Element    xpath://button[@id='loginPage.loginFormSubmit']
    Sleep    ${DELAY}