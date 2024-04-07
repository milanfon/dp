*** Settings ***
Library    SeleniumLibrary

Suite Setup    Open Browser    http://localhost:4680    Chrome
Suite Teardown    Close Browser

*** Test Cases ***
spec 4 student
    Set Window Size    ${10000}    ${800}
    Input Text    id:loginPage.userNameInput    gray
    Input Text    id:loginPage.passwordInput    pass
    Click Element    id:loginPage.loginButton
    Sleep    ${10}
    Click Element    id:stu.menu.mySubjects
    Sleep    ${10}
    Click Element    id:stu.mySubjects.enrolledTable.unenrollSubjectButton-1
    Sleep    ${10}
    Click Element    id:stu.mySubjects.unenrollSubjectModal.unenrollSubjectButton
    Sleep    ${10}
    ${elem1}    Get Element Attribute    id:stu.mySubjects.successAlert    visible
    ${elem2}    Get Element Attribute    id:stu.mySubjects.enrolledTable.Title    visible
    ${elem3}    Get Elements    xpath://td[text()="Database Systems"]
    ${elem4}    Get Element Attribute    ${elem3[0]}    visible
    Should Be Equal    ${elem1}    ${True}
    Should Be Equal    ${elem2}    ${True}
    Should Be Equal    ${elem4}    ${False}

spec 4 teacher
    Set Window Size    ${10000}    ${800}
    Input Text    id:loginPage.userNameInput    pedant
    Input Text    id:loginPage.passwordInput    pass
    Click Element    id:loginPage.loginButton
    Sleep    ${10}
    Click Element    id:tea.menu.mySubjects
    Sleep    ${10}
    Click Element    id:tea.menu.myExamDates
    Sleep    ${10}
    Click Element    id:tea.menu.setEvaluation
    Sleep    ${10}
    Select From List By Value    id:tea.setEvaluation.form.examTermDateSelect    35
    Sleep    ${10}
    Click Element    id:tea.menu.evaluationTable
    Sleep    ${10}
    Select From List By Value    id:tea.evalTable.filter.subjectSelect    3
    Sleep    ${10}
    Click Element    id:tea.evalTable.filter.submitButton
    Sleep    ${10}
    ${elem1}    Get Element Attribute    id:tea.mySubjects.table.listOfStudentsButton-1    text
    ${elem2}    Get Element Attribute    id:tea.myExamDates.table.participantsButton-1-0    text
    ${elem3}    Get Element Attribute    id:tea.setEvaluation.form.noOneStudent    visible
    ${elem4}    Get Elements    xpath://td[text()="No students on this exam date"]
    ${elem5}    Get Element Attribute    ${elem4[0]}    visible
    Should Be Equal    ${elem1}    ${True}
    Should Be Equal    ${elem2}    ${True}
    Should Be Equal    ${elem3}    ${True}
    Should Be Equal    ${elem4}    ${True}