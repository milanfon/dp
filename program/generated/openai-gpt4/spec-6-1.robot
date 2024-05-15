*** Settings ***
Documentation     A test suite for University Information System scenarios.
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome

*** Test Cases ***
Student Enrolls in Other Subjects
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    maroon
    Input Password    xpath=//*[@id="loginPage.passwordInput"]    pass
    Press Keys    None    ENTER
    Sleep    2s
    Click Element    xpath=//*[@id="stu.menu.otherSubjects"]
    Sleep    2s
    Click Element    xpath=//*[@id="stu.otherSubjects.table.enrollButton-10"]
    Sleep    2s
    Element Should Be Visible    id=stu.otherSubjects.successAlert
    Close Browser

Student Checks Enrolled Subjects
    Open Browser    http://localhost:4680/tbuis/student-view/overview    ${BROWSER}
    Set Window Size    1501    1104
    Sleep    2s
    Click Element    xpath=//*[@id="stu.menu.mySubjects"]
    Sleep    2s
    Table Should Contain    xpath=//*[@id="stu.mySubjects.enrolledTable.subjectRow-2"]    Software Quality Assurance
    Table Should Contain    xpath=//*[@id="stu.mySubjects.enrolledTable.subjectRow-2"]    Peter Strict
    Close Browser

Teacher Checks Students in Subject
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    strict
    Input Password    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Sleep    2s
    ${buttonText}=    Get Text    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Should Be Equal As Strings    ${buttonText}    Students (2)
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Sleep    2s
    Page Should Contain    William Maroon
    Close Browser