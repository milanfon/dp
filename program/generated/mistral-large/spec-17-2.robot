*** Test Cases ***

Open page and perform actions for teacher
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    Login as teacher
    Click Element    xpath://*[@id="tea.menu.otherSubjects"]
    Click Element    xpath://*[@id="tea.otherSubjects.table.participateButton-3"]

    ${current_page}    Get Location
    Page Should Contain Element    tea.otherSubjects.successAlert
    Element Should Be Visible    id=tea.otherSubjects.successAlert

    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Page Should Contain    Linear Algebra
    Page Should Contain Element    xpath://tr[@id='tea.myExamDates.table.noRecords-2' and contains(., 'No exam dates.')]

    Click Element    xpath://*[@id="tea.menu.newExamDates"]
    Page Should Contain Element    xpath://option[contains(., 'Linear Algebra')]

    Click Element    xpath://*[@id="tea.menu.listOfAllTeachers"]
    Page Should Contain Element    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3][contains(., 'Linear Algebra')]
    Page Should Contain Element    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2][contains(., 'Alice Pedant')]

    Close Browser

Open page and perform actions for student
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    Login as student
    Click Element    xpath://*[@id="stu.menu.otherSubjects"]

    Page Should Contain Element    xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2][contains(., 'Linear Algebra')]
    Page Should Contain Element    xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3][contains(., 'Alice Pedant')]

    Close Browser

*** Keywords ***

Login as teacher
    Input Text    id=loginPage.userNameInput    pedant
    Input Text    id=loginPage.passwordInput    pass
    Click Element    id=loginPage.loginFormSubmit

Login as student
    Input Text    id=loginPage.userNameInput    yellow
    Input Text    id=loginPage.passwordInput    pass
    Click Element    id=loginPage.loginFormSubmit