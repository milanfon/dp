Here's the Robot Framework code:


*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${DELAY}    ${0}    # set the delay between steps to ${0} to run the steps as fast as possible

*** Test Cases ***
Teacher Test
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    ${1501}    ${104}    # set the window size
    Set Selenium Speed    ${DELAY}    # set the delay between steps
    Login    pedant    pass    # log in as the teacher
    Click Element    xpath://*[@id="tea.otherSubjects.table.participateButton-3"]    # participate in the subject
    # check if we're still on the "Others' Subjects" page
    Location Should Be    http://localhost:4680/tbuis/teacher-view/otherSubjects
    # check if the success alert is visible
    Page Should Contain Element    xpath://*[@id="tea.otherSubjects.successAlert"]
    # check if the "My Exam Dates" page has "Linear Algebra" and "No exam dates" message
    Click Link    xpath://*[@id="tea.menu.myExamDates"]
    Location Should Be    http://localhost:4680/tbuis/teacher-view/myExamDates
    Wait Until Page Contains    Linear Algebra    # check if "Linear Algebra" is present
    Page Should Contain Element    xpath://*[@id="tea.myExamDates.table.noRecords-2"]    # check if "No exam dates." is present
    # check if "Linear Algebra" is present on "New Exam Dates" page
    Click Link    xpath://*[@id="tea.menu.newExamDates"]
    Location Should Be    http://localhost:4680/tbuis/teacher-view/newExamDates
    Wait Until Page Contains    Linear Algebra    # check if "Linear Algebra" is present
    Page Should Contain Element    xpath://select/option[text()='Linear Algebra']    # check if "Linear Algebra" is present in the dropdown
    # check if "Linear Algebra" is present in "List of All Teachers" page
    Click Link    xpath://*[@id="tea.menu.listOfAllTeachers"]
    Location Should Be    http://localhost:4680/tbuis/teacher-view/listOfAllTeachers
    Wait Until Page Contains    Linear Algebra    # check if "Linear Algebra" is present
    Page Should Contain Element    //*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3][contains(text(), "Linear Algebra")]    # check if "Linear Algebra" is present in the table
    Page Should Contain Element    //*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2][contains(text(), "Alice Pedant")]    # check if "Alice Pedant" is present in the table
    Close Browser

Student Test
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    ${1501}    ${104}    # set the window size
    Set Selenium Speed    ${DELAY}    # set the delay between steps
    Login    yellow    pass    # log in as the student
    # check if "Linear Algebra" is present in "Other Subjects" page
    Click Link    xpath://*[@id="stu.menu.otherSubjects"]
    Location Should Be    http://localhost:4680/tbuis/student-view/otherSubjects
    Wait Until Page Contains    Linear Algebra    # check if "Linear Algebra" is present
    Page Should Contain Element    //*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2][contains(text(), "Linear Algebra")]    # check if "Linear Algebra" is present
    Page Should Contain Element    //*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3][contains(text(), "Alice Pedant")]    # check if "Alice Pedant" is present
    Close Browser

*** Keywords ***
Login
    [Arguments]    ${username}    ${password}
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    ${username}
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    ${password}
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]

Close Browser
    Close Browser




The code assumes that you're running a local instance of the University Information System on port 4680. 