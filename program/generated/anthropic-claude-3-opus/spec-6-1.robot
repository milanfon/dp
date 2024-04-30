*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Student Enrolls In Subject
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    1s
    Input Text    xpath://*[@id="loginPage.userNameInput"]    maroon
    Sleep    1s
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Press Keys    xpath://*[@id="loginPage.passwordInput"]    RETURN
    Sleep    1s
    Click Element    xpath://*[@id="stu.menu.otherSubjects"]
    Sleep    1s
    Click Element    xpath://*[@id="stu.otherSubjects.table.enrollButton-10"]
    Sleep    1s
    Page Should Contain Element    xpath://*[@id="stu.otherSubjects.successAlert"]
    Click Element    xpath://*[@id="stu.menu.mySubjects"]
    Sleep    1s
    Page Should Contain Element    xpath://tr[@id="stu.mySubjects.enrolledTable.subjectRow-2"][./td[text()="Software Quality Assurance"]][./td[text()="Peter Strict"]]
    Close Browser

Teacher Checks Enrolled Students
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    1s
    Input Text    xpath://*[@id="loginPage.userNameInput"]    strict
    Sleep    1s
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    1s
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    Sleep    1s
    Element Text Should Be    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-3"]    Students (2)
    Click Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Sleep    1s
    Page Should Contain Element    xpath://td[text()="William Maroon"]
    Close Browser
