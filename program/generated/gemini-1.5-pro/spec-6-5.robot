*** Settings ***
Library    SeleniumLibrary
Test Setup    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
Test Teardown    Close Browser

*** Test Cases ***
Enroll To Subject
    Sleep    2s
    Click Element    xpath///*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath///*[@id="loginPage.userNameInput"]
    Sleep    2s
    Input Text    xpath///*[@id="loginPage.userNameInput"]    maroon
    Sleep    2s
    Press Keys    xpath///*[@id="loginPage.userNameInput"]    TAB
    Sleep    2s
    Input Text    xpath///*[@id="loginPage.passwordInput"]    pass
    Sleep    2s
    Press Keys    xpath///*[@id="loginPage.passwordInput"]    ENTER
    Sleep    2s
    Click Element    xpath///*[@id="stu.menu.otherSubjects"]
    Sleep    2s
    Click Element    xpath///*[@id="stu.otherSubjects.table.enrollButton-10"]
    Sleep    2s
    Click Element    xpath///*[@id="stu.menu.mySubjects"]
    Sleep    2s
    Page Should Contain Element    xpath///*[@id="stu.otherSubjects.successAlert"]
    Sleep    2s
    Page Should Contain Element    xpath///*[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[text()="Software Quality Assurance"]
    Sleep    2s
    Page Should Contain Element    xpath///*[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[text()=" Peter Strict "]
    Sleep    2s

Teacher View Enrolled Students
    Sleep    2s
    Click Element    xpath///*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath///*[@id="loginPage.userNameInput"]
    Sleep    2s
    Input Text    xpath///*[@id="loginPage.userNameInput"]    strict
    Sleep    2s
    Click Element    xpath///*[@id="loginPage.passwordInput"]
    Sleep    2s
    Input Text    xpath///*[@id="loginPage.passwordInput"]    pass
    Sleep    2s
    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath///*[@id="tea.menu.mySubjects"]
    Sleep    2s
    Element Text Should Be    xpath///*[@id="tea.mySubjects.table.listOfStudentsButton-3"]    Students (2) 
    Sleep    2s
    Click Element    xpath///*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Sleep    2s
    Page Should Contain Element    xpath///*[text()="William Maroon"]
    Sleep    2s
