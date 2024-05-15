*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Student Enrollment and Teacher Verification
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Maximize Browser Window
    Sleep    1s
    
    # Student login and enrollment
    Click Element    xpath:///*[@id="header.link.login"]
    Sleep    1s
    Input Text    xpath:///*[@id="loginPage.userNameInput"]    maroon
    Press Keys    xpath:///*[@id="loginPage.userNameInput"]    TAB
    Input Password    xpath:///*[@id="loginPage.passwordInput"]    pass
    Press Keys    xpath:///*[@id="loginPage.passwordInput"]    ENTER
    Sleep    1s
    Click Element    xpath:///*[@id="stu.menu.otherSubjects"]
    Sleep    1s
    Click Element    xpath:///*[@id="stu.otherSubjects.table.enrollButton-10"]
    Sleep    1s
    Page Should Contain Element    xpath:///*[@id="stu.otherSubjects.successAlert"]
    Click Element    xpath:///*[@id="stu.menu.mySubjects"]
    Sleep    1s
    Element Should Contain    xpath:///*[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[1]    Software Quality Assurance
    Element Should Contain    xpath:///*[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[2]    Peter Strict
    Close Browser
    
    # Teacher login and verification
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Maximize Browser Window
    Sleep    1s
    Click Element    xpath:///*[@id="header.link.login"]
    Sleep    1s
    Input Text    xpath:///*[@id="loginPage.userNameInput"]    strict
    Click Element    xpath:///*[@id="loginPage.passwordInput"]
    Input Password    xpath:///*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath:///*[@id="loginPage.loginFormSubmit"]
    Sleep    1s
    Click Element    xpath:///*[@id="tea.menu.mySubjects"]
    Sleep    1s
    Element Should Contain    xpath:///*[@id="tea.mySubjects.table.listOfStudentsButton-3"]    Students (2)
    Click Element    xpath:///*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Sleep    1s
    Page Should Contain    William Maroon
    Close Browser