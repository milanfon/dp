*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${Browser}    chrome
${URL}        http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Student View
    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window
    Set Selenium Speed    0.5

    Input Text    id=loginPage.userNameInput    gray
    Input Password    id=loginPage.passwordInput    pass
    Click Button    id=loginPage.loginButton

    Click Element    xpath//a[contains(text(), 'My Subjects')]

    ${present1}    Run Keyword And Return Status    Page Should Contain Element    id=stu.mySubjects.successAlert
    ${present2}    Run Keyword And Return Status    Page Should Contain Element    id=stu.mySubjects.enrolledTable.Title
    ${not_present}    Run Keyword And Return Status    Page Should Not Contain Element    xpath//td[contains(text(), 'Database Systems')]

    Close Browser

Teacher View
    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window
    Set Selenium Speed    0.5

    Input Text    id=loginPage.userNameInput    pedant
    Input Password    id=loginPage.passwordInput    pass
    Click Button    id=loginPage.loginButton

    Click Element    xpath//a[contains(text(), 'My Subjects')]
    ${text1}    Get Text    id=tea.mySubjects.table.listOfStudentsButton-1

    Click Element    xpath//a[contains(text(), 'My Exam Dates')]
    ${text2}    Get Text    id=tea.myExamDates.table.participantsButton-1-0

    Click Element    xpath//a[contains(text(), 'Set Evaluation')]
    Select From List By Index    id=tea.setEvaluation.form.examTermDateSelect    1
    ${visible}    Run Keyword And Return Status    Page Should Contain Element    id=tea.setEvaluation.form.noOneStudent

    Click Element    xpath//a[contains(text(), 'Evaluation Table')]
    Select From List By Index    id=tea.evalTable.filter.subjectSelect    2
    Click Button    id=tea.evalTable.filter.submitButton
    ${present3}    Run Keyword And Return Status    Page Should Contain Element    xpath//td[contains(text(), 'No students on this exam date')]

    Close Browser