*** Settings ***
Library        SeleniumLibrary
Browser        Chrome

*** Variables ***
${URL}          http://localhost:4680/tbuis/

*** Test Cases ***

Test Student Page
    [Documentation]    Test student page functionality

    [Preparation]       Open URL
    Open Browser       ${URL}

    [Actions]           Login as student
    Input Text         #loginPage.userNameInput     student
    Input Text         #loginPage.passwordInput     studentPassword
    Click Button       #loginPage.loginButton
    Sleep             1s

    [Verification]      Check for student subjects
    Element Should Exist     #stu.mySubjects.successAlert
    Element Should Exist     #stu.mySubjects.enrolledTable.Title
    Element Should Not Exist     //td[.='Database Systems']

    [Teardown]          Close Browser
    Close Browser

Test Teacher Page
    [Documentation]    Test teacher page functionality

    [Preparation]       Open URL
    Open Browser       ${URL}

    [Actions]           Login as teacher
    Input Text         #loginPage.userNameInput     teacher
    Input Text         #loginPage.passwordInput     teacherPassword
    Click Button       #loginPage.loginButton
    Sleep             1s

    [Verification]      Check for teacher views
    Element Should Exist     #tea.mySubjects.table.listOfStudentsButton-1
    Element Should Exist     #tea.myExamDates.table.participantsButton-1-0

    [Actions]           Go to Set Evaluation page
    Click Element         #tea.menu.setEvaluation
    Sleep             1s

    [Verification]      Check for no students on exam date
    Element Should Exist     #tea.setEvaluation.form.noOneStudent

    [Teardown]          Close Browser
    Close Browser

Test Delays
    [Documentation]    Test delay functionality

    [Actions]           Open Student Page
    Open Browser       ${URL}
    Input Text         #loginPage.userNameInput     student
    Input Text         #loginPage.passwordInput     studentPassword
    Click Button       #loginPage.loginButton
    Sleep             1s

    [Actions]           Go to My Subjects page
    Click Element         #stu.menu.mySubjects
    Sleep             2s

    [Actions]           Go to My Exam Dates page
    Click Element         #stu.menu.myExamDates
    Sleep             2s

    [Actions]           Go to Set Evaluation page
    Click Element         #stu.menu.setEvaluation
    Sleep             2s

    [Actions]           Go to Evaluation Table page
    Click Element         #stu.menu.evaluationTable
    Sleep             2s

    [Teardown]          Close Browser
    Close Browser

Test Teacher Delays
    [Documentation]    Test delay functionality for teacher

    [Preparation]       Open URL
    Open Browser       ${URL}

    [Actions]           Login as teacher
    Input Text         #loginPage.userNameInput     teacher
    Input Text         #loginPage.passwordInput     teacherPassword
    Click Button       #loginPage.loginButton
    Sleep             1s

    [Actions]           Go to My Subjects page
    Click Element         #tea.menu.mySubjects
    Sleep             2s

    [Actions]           Go to My Exam Dates page
    Click Element         #tea.menu.myExamDates
    Sleep             2s

    [Actions]           Go to Set Evaluation page
    Click Element         #tea.menu.setEvaluation
    Sleep             2s

    [Actions]           Go to Evaluation Table page
    Click Element         #tea.menu.evaluationTable
    Sleep             2s

    [Teardown]          Close Browser
    Close Browser