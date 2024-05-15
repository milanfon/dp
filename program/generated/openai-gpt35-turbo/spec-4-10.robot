*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Open Page and Check Elements for Student
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//*[@id='header.link.login']
    Click Element    xpath=//*[@id='header.link.login']
    Wait Until Element Is Visible    xpath=//*[@id='loginPage.userNameInput']
    Input Text    xpath=//*[@id='loginPage.userNameInput']    gray
    Press Keys    xpath=//*[@id='loginPage.userNameInput']    TAB
    Input Text    xpath=//*[@id='loginPage.passwordInput']    pass
    Press Keys    xpath=//*[@id='loginPage.passwordInput']    ENTER
    Wait Until Element Is Visible    xpath=//*[@id='stu.menu.mySubjects']
    Click Element    xpath=//*[@id='stu.menu.mySubjects']
    Wait Until Element Is Visible    xpath=//*[@id='stu.mySubjects.enrolledTable.unenrollSubjectButton-1']
    Click Element    xpath=//*[@id='stu.mySubjects.enrolledTable.unenrollSubjectButton-1']
    Wait Until Element Is Visible    xpath=//*[@id='stu.mySubjects.unenrollSubjectModal.unenrollSubjectButton]
    Click Element    xpath=//*[@id='stu.mySubjects.unenrollSubjectModal.unenrollSubjectButton]
    Close Browser

Open Page and Check Elements for Teacher
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//*[@id='header.link.login']
    Click Element    xpath=//*[@id='header.link.login']
    Wait Until Element Is Visible    xpath=//*[@id='loginPage.userNameInput']
    Input Text    xpath=//*[@id='loginPage.userNameInput']    pedant
    Press Keys    xpath=//*[@id='loginPage.userNameInput']    TAB
    Input Text    xpath=//*[@id='loginPage.passwordInput']    pass
    Press Keys    xpath=//*[@id='loginPage.passwordInput']    ENTER
    Wait Until Element Is Visible    xpath=//*[@id='tea.menu.mySubjects']
    Click Element    xpath=//*[@id='tea.menu.mySubjects']
    Wait Until Element Is Visible    xpath=//*[@id='tea.menu.myExamDates']
    Click Element    xpath=//*[@id='tea.menu.myExamDates']
    Wait Until Element Is Visible    xpath=//*[@id='tea.menu.setEvaluation']
    Click Element    xpath=//*[@id='tea.menu.setEvaluation']
    Wait Until Element Is Visible    xpath=//*[@id='tea.setEvaluation.form.examTermDateSelect']
    Click Element    xpath=//*[@id='tea.setEvaluation.form.examTermDateSelect']
    Select From List by Index    xpath=//*[@id='tea.setEvaluation.form.examTermDateSelect']    1
    Wait Until Element Is Visible    xpath=//*[@id='tea.menu.evaluationTable']
    Click Element    xpath=//*[@id='tea.menu.evaluationTable']
    Wait Until Element Is Visible    xpath=//*[@id='tea.evalTable.filter.subjectSelect']
    Click Element    xpath=//*[@id='tea.evalTable.filter.subjectSelect']
    Select From List by Index    xpath=//*[@id='tea.evalTable.filter.subjectSelect']    2
    Click Element    xpath=//*[@id='tea.evalTable.filter.submitButton']
    Close Browser