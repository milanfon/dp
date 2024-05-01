*** Settings ***
Library         SeleniumLibrary
Browser         Chrome

*** Variables ***
${URL}         http://localhost:4680/tbuis/index.jsp

*** Test Cases ***

Test Teacher Scenario
    [Documentation]         Test Teacher Scenario

    [Tags]         @tag1 @tag2

    [Preparation]         Set Viewport 1501 1104
    Set Teacher URL ${URL}

    [Actions]         Navigate To ${Teacher URL}
    ${login}         Click Element    xpath=//*[@id="header.link.login"]
    Set Variable    username    pedant
    Set Variable    password    pass
    Input Text    #loginPage.userNameInput    ${username}
    Input Text    #loginPage.passwordInput    ${password}
    Click Element    #loginPage.loginFormSubmit
    ${other_subjects}         Click Element    xpath=//*[@id="tea.menu.otherSubjects"]
    ${participate}         Click Element    xpath=//*[@id="tea.otherSubjects.table.participateButton-3"]

    [Verification]         Wait Until Element Is Visible    xpath=//*[@id="tea.otherSubjects.successAlert"]
    Should Be Element Visible    xpath=//*[@id="tea.otherSubjects.successAlert"]

    [Actions]         Navigate To    xpath=//*[@id="tea.menu.myExamDates"]
    Should Be Text Present    My Exam Dates
    Should Be Text Present    Linear Algebra
    Should Be Element Present    xpath=//tr[@id="tea.myExamDates.table.noRecords-2"]
    Should Contain Element Text    xpath=//tr[@id="tea.myExamDates.table.noRecords-2"]/td[2]    Linear Algebra

    [Actions]         Navigate To    xpath=//*[@id="tea.menu.newExamDates"]
    Should Be Element Present    xpath=//option[@text="Linear Algebra"]

    [Actions]         Navigate To    xpath=//*[@id="tea.menu.listOfAllTeachers"]
    Should Be Text Present    List of All Teachers
    ${teacher_row_3}         Get Element    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]
    Should Contain Element Text    ${teacher_row_3}/td[3]    Linear Algebra
    Should Contain Element Text    ${teacher_row_3}/td[2]    Alice Pedant

    [Teardown]         Close Browser

Test Student Scenario
    [Documentation]         Test Student Scenario

    [Tags]         @tag1 @tag2

    [Preparation]         Set Viewport 1501 1104
    Set Student URL ${URL}

    [Actions]         Navigate To ${Student URL}
    ${login}         Click Element    xpath=//*[@id="header.link.login"]
    Set Variable    username    yellow
    Set Variable    password    pass
    Input Text    #loginPage.userNameInput    ${username}
    Input Text    #loginPage.passwordInput    ${password}
    Click Element    #loginPage.loginFormSubmit
    ${other_subjects}         Click Element    xpath=//*[@id="stu.menu.otherSubjects"]

    [Verification]         Should Be Text Present    xpath=//tr[@id="stu.otherSubjects.table.subjectRow-2"]/td[2]    Linear Algebra
    Should Contain Element Text    xpath=//tr[@id="stu.otherSubjects.table.subjectRow-2"]/td[3]    Alice Pedant

    [Teardown]         Close Browser