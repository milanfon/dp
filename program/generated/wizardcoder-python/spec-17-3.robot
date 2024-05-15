*** Settings ***
Library    SeleniumLibrary    run_on_failure=Close All Browsers

*** Variables ***
${URL}    http://localhost:4680/tbuis/
${BROWSER}    Chrome

*** Test Cases ***
Teacher View
    Open Browser    ${URL}    ${BROWSER}
    Set Window Size    1501    104
    Click Element    xpath://*[@aria-label='Login']
    Input Text    xpath://*[@id='loginPage.userNameInput']    pedant
    Input Text    xpath://*[@id='loginPage.passwordInput']    pass
    Click Element    xpath://*[@id='loginPage.loginFormSubmit']
    Click Element    xpath://*[@id='tea.menu.otherSubjects']
    Click Element    xpath://*[@id='tea.otherSubjects.table.participateButton-3']
    Click Element    xpath://*[@id='tea.menu.myExamDates']
    Click Element    xpath://*[@id='tea.menu.newExamDates']
    Click Element    xpath://*[@id='tea.menu.listOfAllTeachers']
    Element Should Be Visible    xpath://*[@id='tea.otherSubjects.successAlert']
    Element Should Be Visible    xpath://*[@id='tea.myExamDates.table.noRecords-2']
    Element Should Contain    xpath://*[@id='tea.myExamDates.table.noRecords-2']    No exam dates.
    Element Should Contain    xpath://*[@id='tea.listOfAllTeachers.table.teacherRow-3']/td[3]    Linear Algebra
    Element Should Contain    xpath://*[@id='tea.listOfAllTeachers.table.teacherRow-3']/td[2]    Alice Pedant
    Close Browser

Student View
    Open Browser    ${URL}    ${BROWSER}
    Set Window Size    1501    104
    Click Element    xpath://*[@aria-label='Login']
    Input Text    xpath://*[@id='loginPage.userNameInput']    yellow
    Input Text    xpath://*[@id='loginPage.passwordInput']    pass
    Click Element    xpath://*[@id='loginPage.loginFormSubmit']
    Click Element    xpath://*[@id='stu.menu.otherSubjects']
    Element Should Contain    xpath://*[@id='stu.otherSubjects.table.subjectRow-2']/td[2]    Linear Algebra
    Element Should Contain    xpath://*[@id='stu.otherSubjects.table.subjectRow-2']/td[3]    Alice Pedant
    Close Browser