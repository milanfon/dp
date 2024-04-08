*** Settings ***
Library    SeleniumLibrary   

*** Test Cases ***
spec 17 teacher
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome   
    Input Text    xpath://*[@id="loginPage.userNameInput"]    pedant
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="tea.otherSubjects.table.participateButton-3"]
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Click Element    xpath://*[@id="tea.menu.newExamDates"]
    Click Element    xpath://*[@id="tea.menu.listOfAllTeachers"]
    Element Should Be Visible    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    Element with id "tea.listOfAllTeachers.table.teacherRow-3" should be visible
    Element Should Contain    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    Linear Algebra    Element with id "tea.listOfAllTeachers.table.teacherRow-3" should contain "Linear Algebra"
    Element Should Contain    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2]    Alice Pedant    Element with id "tea.listOfAllTeachers.table.teacherRow-3" should contain "Alice Pedant"
    Close Browser

spec 17 student
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Input Text    xpath://*[@id="loginPage.userNameInput"]    yellow
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="stu.menu.otherSubjects"]
    Element Text Should Be    xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2]    Linear Algebra    Element with path "stu.otherSubjects.table.subjectRow-2/td[2]" should have text "Linear Algebra"
    Element Text Should Be    xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3]    Alice Pedant    Element with path "stu.otherSubjects.table.subjectRow-2/td[3]" should have text "Alice Pedant"
    Close Browser