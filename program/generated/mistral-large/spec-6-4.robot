*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://localhost:4680/tbuis/index.jsp
${BROWSER}        Chrome
${DELAY}          2s

*** Test Cases ***
Student Test
    Open Browser    ${URL}    ${BROWSER}
    Set Selenium Speed    ${DELAY}

    # Login as student
    Click Element    xpath://*[@id="header.link.login"]
    Input Text       xpath://*[@id="loginPage.userNameInput"]    maroon
    Press Keys       xpath://*[@id="loginPage.userNameInput"]    \\t
    Input Text       xpath://*[@id="loginPage.passwordInput"]    pass
    Press Keys       xpath://*[@id="loginPage.passwordInput"]    \\0d

    # Navigate to Other Subjects page
    Click Element    xpath://*[@id="stu.menu.otherSubjects"]

    # Enroll in a subject
    Click Element    xpath://*[@id="stu.otherSubjects.table.enrollButton-10"]

    # Check success alert
    Wait Until Page Contains Element    xpath://*[@id="stu.otherSubjects.successAlert"]

    # Navigate to My Subjects page
    Click Element    xpath://*[@id="stu.menu.mySubjects"]

    # Check enrolled subject
    ${subject_row}    Get Element    xpath://tr[@id="stu.mySubjects.enrolledTable.subjectRow-2" and td="Software Quality Assurance" and td="Peter Strict"]
    Should Not Be Empty    ${subject_row}

    Close Browser

Teacher Test
    Open Browser    ${URL}    ${BROWSER}
    Set Selenium Speed    ${DELAY}

    # Login as teacher
    Click Element    xpath://*[@id="header.link.login"]
    Input Text       xpath://*[@id="loginPage.userNameInput"]    strict
    Press Keys       xpath://*[@id="loginPage.userNameInput"]    \\t
    Input Text       xpath://*[@id="loginPage.passwordInput"]    pass
    Press Keys       xpath://*[@id="loginPage.passwordInput"]    \\0d

    # Navigate to My Subjects page
    Click Element    xpath://*[@id="tea.menu.mySubjects"]

    # Check button text
    ${button_text}    Get Text    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Should Be Equal    ${button_text}    Students (2)

    # Click button and check student name
    Click Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Wait Until Page Contains Element    xpath://td[text()="William Maroon"]

    Close Browser