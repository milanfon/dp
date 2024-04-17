*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome
${URL}        http://localhost:4680/tbuis/index.jsp
${DELAY}      2s

*** Test Cases ***
Teacher Test
    Open Browser To Login Page
    Login As Teacher
    Click Element    xpath://a[@id='tea.menu.otherSubjects']
    Click Element    xpath://button[@id='tea.otherSubjects.table.participateButton-3']
    Wait Until Page Contains    Others' Subjects    ${DELAY}
    Element Should Be Visible    xpath://div[@id='tea.otherSubjects.successAlert']
    Click Element    xpath://a[@id='tea.menu.myExamDates']
    Page Should Contain Element    xpath://tr[@id='tea.myExamDates.table.noRecords-2']
    Page Should Contain    Linear Algebra
    Click Element    xpath://a[@id='tea.menu.newExamDates']
    Page Should Contain Element    xpath://option[contains(text(), 'Linear Algebra')]
    Click Element    xpath://a[@id='tea.menu.listOfAllTeachers']
    Page Should Contain Element    xpath://td[@id='tea.listOfAllTeachers.table.teacherRow-3']/../td[contains(text(), 'Linear Algebra')]
    Page Should Contain Element    xpath://td[@id='tea.listOfAllTeachers.table.teacherRow-3']/../td[contains(text(), 'Alice Pedant')]
    Close Browser

Student Test
    Open Browser To Login Page
    Login As Student
    Click Element    xpath://a[@id='stu.menu.otherSubjects']
    Page Should Contain Element    xpath://td[@id='stu.otherSubjects.table.subjectRow-2']/../td[contains(text(), 'Linear Algebra')]
    Page Should Contain Element    xpath://td[@id='stu.otherSubjects.table.subjectRow-2']/../td[contains(text(), 'Alice Pedant')]
    Close Browser

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}    ${BROWSER}
    Wait Until Page Contains    Login    ${DELAY}

Login As Teacher
    Input Text    xpath://input[@id='loginPage.userNameInput']    pedant
    Input Text    xpath://input[@id='loginPage.passwordInput']    pass
    Click Element    xpath://button[@id='loginPage.loginFormSubmit']
    Wait Until Page Contains    Others' Subjects    ${DELAY}

Login As Student
    Input Text    xpath://input[@id='loginPage.userNameInput']    yellow
    Input Text    xpath://input[@id='loginPage.passwordInput']    pass
    Click Element    xpath://button[@id='loginPage.loginFormSubmit']
    Wait Until Page Contains    Other Subjects    ${DELAY}