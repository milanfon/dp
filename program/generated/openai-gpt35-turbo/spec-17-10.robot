*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://localhost:4680/tbuis/index.jsp
${Browser}        Chrome

*** Test Cases ***
Open Page and Verify Elements as Teacher
    Open Browser    ${URL}    ${Browser}
    Set Viewport    1501    1104
    Navigate    ${URL}
    Click Element    xpath///*[@id="header.link.login"]
    Input Text    xpath///*[@id="loginPage.userNameInput"]    pedant
    Input Text    xpath///*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath///*[@id="tea.menu.otherSubjects"]
    Click Element    xpath///*[@id="tea.otherSubjects.table.participateButton-3"]
    Sleep    2
    Page Should Contain Element    xpath///*[@id="tea.otherSubjects.successAlert"]
    Click Element    xpath///*[@id="tea.menu.myExamDates"]
    Sleep    2
    Page Should Contain    Linear Algebra
    Page Should Contain Element    xpath///*[@id="tea.myExamDates.table.noRecords-2"]
    Click Element    xpath///*[@id="tea.menu.newExamDates"]
    Sleep    2
    Page Should Contain Element    xpath//option[text()="Linear Algebra"]
    Click Element    xpath///*[@id="tea.menu.listOfAllTeachers"]
    Sleep    2
    Page Should Contain Element    xpath///*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3][contains(text(), "Linear Algebra")]
    Page Should Contain Element    xpath///*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2][text()="Alice Pedant"]
    Close Browser

Verify Elements as Student
    Open Browser    ${URL}    ${Browser}
    Set Viewport    1501    1104
    Navigate    ${URL}
    Click Element    xpath///*[@id="header.link.login"]
    Input Text    xpath///*[@id="loginPage.userNameInput"]    yellow
    Input Text    xpath///*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath///*[@id="stu.menu.otherSubjects"]
    Sleep    2
    Page Should Contain Element    xpath///*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2][contains(text(), "Linear Algebra")]
    Page Should Contain Element    xpath///*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3][contains(text(), "Alice Pedant"]
    Close Browser