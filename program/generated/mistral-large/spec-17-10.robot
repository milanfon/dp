*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}        http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Teacher Test
    Open Browser    ${URL}    ${BROWSER}
    Set Selenium Speed    1s

    # Login as teacher
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    pedant
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Button    xpath=//*[@id="loginPage.loginFormSubmit"]

    # Others' Subjects page
    Click Element    xpath=//*[@id="tea.menu.otherSubjects"]
    Click Element    xpath=//*[@id="tea.otherSubjects.table.participateButton-3"]
    Sleep    1s
    Page Should Contain Element    xpath=//*[@id="tea.otherSubjects.successAlert"]
    Page Should Contain    Others' Subjects

    # My Exam Dates page
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Page Should Contain    Linear Algebra
    Page Should Contain Element    xpath=//*[@id="tea.myExamDates.table.noRecords-2"]

    # New Exam Dates page
    Click Element    xpath=//*[@id="tea.menu.newExamDates"]
    Page Should Contain Element    xpath=//option[contains(text(), 'Linear Algebra')]

    # List of All Teachers page
    Click Element    xpath=//*[@id="tea.menu.listOfAllTeachers"]
    Page Should Contain Element    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3][contains(text(), 'Linear Algebra')]
    Page Should Contain Element    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2][contains(text(), 'Alice Pedant')]

    Close Browser

Student Test
    Open Browser    ${URL}    ${BROWSER}
    Set Selenium Speed    1s

    # Login as student
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    yellow
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Button    xpath=//*[@id="loginPage.loginFormSubmit"]

    # Other Subjects page
    Click Element    xpath=//*[@id="stu.menu.otherSubjects"]
    Page Should Contain Element    xpath=//*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2][contains(text(), 'Linear Algebra')]
    Page Should Contain Element    xpath=//*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3][contains(text(), 'Alice Pedant')]

    Close Browser
