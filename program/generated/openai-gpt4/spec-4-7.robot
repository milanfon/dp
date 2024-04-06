*** Settings ***
Documentation     Validate student and teacher functionalities in university information system
Library           SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${BASE_URL}   http://localhost:4680/tbuis

*** Keywords ***
Open University System Page
    Open Browser    ${BASE_URL}/index.jsp    ${BROWSER}
    Set Window Size    1501    1104

Login As User
    [Arguments]    ${username}    ${password}
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${username}
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${password}
    Press Key    xpath=//*[@id="loginPage.passwordInput"]    ENTER
    Sleep    3s

Student Actions
    Click Element    xpath=//*[@id="stu.menu.mySubjects"]
    Sleep    2s
    Page Should Contain Element    id=stu.mySubjects.successAlert
    Page Should Contain Element    id=stu.mySubjects.enrolledTable.Title
    Element Should Not Be Visible    xpath=//td[text()='Database Systems']

Teacher Actions
    Select From List By Index    xpath=//*[@id="tea.setEvaluation.form.examTermDateSelect"]    2
    Sleep    1s
    Page Should Contain Element    id=tea.setEvaluation.form.noOneStudent
    Select From List By Index    xpath=//*[@id="tea.evalTable.filter.subjectSelect"]    3
    Sleep    1s
    Click Element    xpath=//*[@id="tea.evalTable.filter.submitButton"]
    Sleep    2s
    Page Should Contain    xpath=//td    No students on this exam date

*** Test Cases ***
Student Scenario
    Open University System Page
    Login As User    gray    pass
    Student Actions
    Close Browser

Teacher Scenario
    Open University System Page
    Login As User    pedant    pass
    Teacher Actions
    Close Browser