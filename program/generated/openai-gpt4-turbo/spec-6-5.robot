*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome

*** Test Cases ***
Student Enrollment and Verification
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    maroon
    Press Keys    xpath=//*[@id="loginPage.userNameInput"]    TAB
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Press Keys    None    ENTER
    Sleep    2s
    Click Element    xpath=//*[@id="stu.menu.otherSubjects"]
    Sleep    2s
    Click Element    xpath=//*[@id="stu.otherSubjects.table.enrollButton-10"]
    Sleep    2s
    Element Should Be Visible    xpath=//*[@id="stu.otherSubjects.successAlert"]
    Click Element    xpath=//*[@id="stu.menu.mySubjects"]
    Sleep    2s
    Element Should Contain    xpath=//tr[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td    Software Quality Assurance
    Element Should Contain    xpath=//tr[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td    Peter Strict
    Close Browser

Teacher Verification After Student Enrollment
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    strict
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Sleep    2s
    Element Should Contain    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-3"]    Students (2)
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Sleep    2s
    Element Should Contain    xpath=//td    William Maroon
    Close Browser