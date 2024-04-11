*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Student Enrolment and Teacher Login Validation
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s

    # Student login
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    maroon
    Press Key    xpath=//*[@id="loginPage.userNameInput"]    TAB
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Press Key    xpath=//*[@id="loginPage.passwordInput"]    ENTER
    Sleep    2s

    # Navigate to Other Subjects
    Click Element    xpath=//*[@id="stu.menu.otherSubjects"]
    Sleep    2s
    Click Element    xpath=//*[@id="stu.otherSubjects.table.enrollButton-10"]
    Sleep    2s
    Element Should Be Visible    xpath=//*[@id="stu.otherSubjects.successAlert"]
    Sleep    2s

    # Navigate to My Subjects and check specifics
    Click Element    xpath=//*[@id="stu.menu.mySubjects"]
    Sleep    2s
    Page Should Contain Element    xpath=//tr[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[text()="Software Quality Assurance"]
    Page Should Contain Element    xpath=//tr[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[text()="Peter Strict"]
    Close Browser

    # Teacher login for validation
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    Sleep    1s
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s

    # Teacher login
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    strict
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s

    # Navigate to My Subjects as Teacher
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Sleep    2s
    Element Should Contain    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-3"]    Students (2)
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Sleep    2s
    Page Should Contain Element    xpath=//td[text()="William Maroon"]
    Close Browser