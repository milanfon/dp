*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}    http://localhost:4680
${DELAY}    ${0}
${USERNAME}    strict
${PASSWORD}    pass
${USERNAME_STUDENT}    orange
${PASSWORD_STUDENT}    pass

*** Test Cases ***
Teacher Test
    Open Browser    ${URL}    ${BROWSER}
    Login Teacher
    Teacher Test
    [Teardown]    Close Browser

Student Test
    Open Browser    ${URL}    ${BROWSER}
    Login Student
    Student Test
    [Teardown]    Close Browser


*** Keywords ***
Login Teacher
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${USERNAME}
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${PASSWORD}
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Element Should Be Visible    xpath=//*[@id="tea.menu.mySubjects"]
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Element Should Be Visible    xpath=//*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Click Element    xpath=//*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Element Should Be Visible    xpath=//*[@id="tea.mySubjects.successAlert"]
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Element Should Not Be Visible    xpath=//th[contains(text(), "Operating Systems")]
    Click Element    xpath=//*[@id="tea.menu.newExamDates"]
    Element Should Not Be Visible    xpath=//*[@id="tea.newExamDates.table"]//*[contains(text(), "Operating Systems")]
    Click Element    xpath=//*[@id="tea.menu.setEvaluation"]
    Element Should Not Be Visible    xpath=//*[@id="tea.setEvaluation.table"]//*[contains(text(), "Operating Systems")]
    Click Element    xpath=//*[@id="tea.menu.evaluationTable"]
    Element Should Not Be Visible    xpath=//*[@id="tea.evaluationTable.table"]//*[contains(text(), "Operating Systems")]
    Click Element    xpath=//*[@id="tea.menu.otherSubjects"]
    Element Should Be Visible    xpath=//*[@id="tea.otherSubjects.table"]//*[contains(text(), "Operating Systems")]
    Click Element    xpath=//*[@id="tea.menu.listOfAllTeachers"]
    Element Should Be Visible    xpath=//*[@id="tea.listOfAllTeachers.table"]//*[contains(text(), "Operating Systems")]
    Element Should Not Be Visible    xpath=//*[@id="tea.listOfAllTeachers.table"]//*[contains(text(), "Operating Systems") and contains(text(), "Peter Strict")]

Login Student
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${USERNAME_STUDENT}
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${PASSWORD_STUDENT}
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Element Should Be Visible    xpath=//*[@id="stu.menu.otherSubjects"]
    Click Element    xpath=//*[@id="stu.menu.otherSubjects"]
    Element Should Be Visible    xpath=//*[@id="stu.otherSubjects.table"]//*[contains(text(), "Operating Systems")]
    Element Should Be Visible    xpath=//*[@id="stu.otherSubjects.table"]//*[contains(text(), "Peter Strict")]