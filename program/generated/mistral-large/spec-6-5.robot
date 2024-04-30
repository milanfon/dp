*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Student Scenario
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104

    # Login as student
    Click Element    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    maroon
    Press Key    xpath://*[@id="loginPage.userNameInput"]    TAB
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Press Key    xpath://*[@id="loginPage.passwordInput"]    ENTER

    # Navigate to Other Subjects and enroll
    Click Element    xpath://*[@id="stu.menu.otherSubjects"]
    Click Element    xpath://*[@id="stu.otherSubjects.table.enrollButton-10"]

    # Check if success alert appears
    Wait Until Page Contains Element    xpath://*[@id="stu.otherSubjects.successAlert"]    10

    # Navigate to My Subjects
    Click Element    xpath:///*[@id="stu.menu.mySubjects"]

    # Check if enrolled subject appears
    ${enrolledSubject}=    Get Text    xpath://tr[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[1]
    Should Be Equal    ${enrolledSubject}    Software Quality Assurance
    ${enrolledTeacher}=    Get Text    xpath://tr[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[2]
    Should Be Equal    ${enrolledTeacher}    Peter Strict

    Close Browser

Teacher Scenario
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104

    # Login as teacher
    Click Element    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    strict
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]

    # Navigate to My Subjects
    Click Element    xpath://*[@id="tea.menu.mySubjects"]

    # Check if button has correct text
    ${buttonText}=    Get Text    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Should Be Equal    ${buttonText}    Students (2)

    # Click the button and check if student appears
    Click Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Wait Until Page Contains Element    xpath://td[text()="William Maroon"]    10

    Close Browser
