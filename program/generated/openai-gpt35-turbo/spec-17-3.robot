*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Open Page and Check Elements as Teacher
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Set Viewport    1501    1104
    Navigate    ${URL}
    Click Element    xpath///*[@id="header.link.login"]
    Click Element    xpath///*[@id="loginPage.userNameInput"]
    Input Text    xpath///*[@id="loginPage.userNameInput"]    pedant
    Click Element    xpath///*[@id="loginPage.passwordInput"]
    Input Text    xpath///*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath///*[@id="tea.menu.otherSubjects"]
    Click Element    xpath///*[@id="tea.otherSubjects.table.participateButton-3"]
    Sleep    2
    Page Should Contain Element    xpath///*[@id="tea.otherSubjects.successAlert"]
    Click Element    xpath///*[@id="tea.menu.myExamDates"]
    Page Should Contain    Linear Algebra
    Page Should Contain Element    xpath///*[@id="tea.myExamDates.table.noRecords-2"]
    Page Should Contain    No exam dates.
    Click Element    xpath///*[@id="tea.menu.newExamDates"]
    Page Should Contain Element    xpath//option[text()="Linear Algebra"]
    Click Element    xpath///*[@id="tea.menu.listOfAllTeachers"]
    Page Should Contain Element    xpath///*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    Linear Algebra
    Page Should Contain    Alice Pedant
    Close Browser

Open Page and Check Elements as Student
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Set Viewport    1501    1104
    Navigate    ${URL}
    Click Element    xpath///*[@id="header.link.login"]
    Click Element    xpath///*[@id="loginPage.userNameInput"]
    Input Text    xpath///*[@id="loginPage.userNameInput"]    yellow
    Click Element    xpath///*[@id="loginPage.passwordInput"]
    Input Text    xpath///*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath///*[@id="stu.menu.otherSubjects"]
    Page Should Contain Element    xpath///*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2]    Linear Algebra
    Page Should Contain Element    xpath///*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3]    Alice Pedant
    Close Browser