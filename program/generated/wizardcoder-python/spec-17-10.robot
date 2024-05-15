*** Settings ***
Library    SeleniumLibrary   

*** Variables ***
${browser}    Chrome
${URL}    http://localhost:4680/tbuis/
${delay}    0.5s

*** Test Cases ***
Scenario 1
    Open Browser    ${URL}    ${browser}
    Set Viewport Size    1501    104
    Maximize Browser Window
    Login as Teacher
    [Teardown]    Close Browser

Scenario 2
    Open Browser    ${URL}    ${browser}
    Set Viewport Size    1501    104
    Maximize Browser Window
    Login as Student
    [Teardown]    Close Browser

*** Keywords ***
Login as Teacher
    Go to ${URL}
    Click Element    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    pedant
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath=//*[@id="tea.menu.otherSubjects"]
    Click Element    xpath=//*[@id="tea.otherSubjects.table.participateButton-3"]
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Click Element    xpath=//*[@id="tea.menu.newExamDates"]
    Click Element    xpath=//*[@id="tea.menu.listOfAllTeachers"]

    ${tea.otherSubjects.successAlert}    Get Element Attribute    xpath=//*[@id="tea.otherSubjects.successAlert"]    aria-hidden
    ${tea.otherSubjects.successAlert}    Get Element Attribute    xpath=//*[@id="tea.otherSubjects.successAlert"]    aria-hidden
    Run Keyword If    '${tea.otherSubjects.successAlert}' == 'true'    Element Should Be Visible    xpath=//*[@id="tea.otherSubjects.successAlert"]
    Element Should Be Visible    xpath=//*[@id="tea.myExamDates.table.noRecords-2"]
    Element Should Be Visible    xpath=//*[@id="tea.myExamDates.table.noRecords-2"]//*[contains(text(), "No exam dates.")]
    Element Should Be Visible    xpath=//*[@id="tea.newExamDates.table"]//*[contains(text(), "Linear Algebra")]
    Element Should Be Visible    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]
    Element Should Be Visible    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]//*[contains(text(), "Linear Algebra")]
    Element Should Be Visible    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]//*[contains(text(), "Alice Pedant")]
    Sleep    ${delay}

Login as Student
    Go to ${URL}
    Click Element    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    yellow
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath=//*[@id="stu.menu.otherSubjects"]
    Element Should Be Visible    xpath=//*[@id="stu.otherSubjects.table.subjectRow-2"]//*[contains(text(), "Linear Algebra")]
    Element Should Be Visible    xpath=//*[@id="stu.otherSubjects.table.subjectRow-2"]//*[contains(text(), "Alice Pedant")]