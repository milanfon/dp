*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROWSER}  Chrome

*** Test Cases ***
Open Page and Perform Actions as Teacher
    Open Browser  http://localhost:4680/tbuis/index.jsp  ${BROWSER}
    Click Element  xpath///*[@id="header.link.login"]
    Input Text  xpath///*[@id="loginPage.userNameInput"]  pedant
    Input Text  xpath///*[@id="loginPage.passwordInput"]  pass
    Click Element  xpath///*[@id="loginPage.loginFormSubmit"]
    Sleep  2s
    Click Element  xpath///*[@id="tea.menu.otherSubjects"]
    Sleep  2s
    Click Element  xpath///*[@id="tea.otherSubjects.table.participateButton-3"]
    Sleep  2s
    Click Element  xpath///*[@id="tea.menu.myExamDates"]
    Sleep  2s
    Click Element  xpath///*[@id="tea.menu.newExamDates"]
    Sleep  2s
    Click Element  xpath///*[@id="tea.menu.listOfAllTeachers"]
    Sleep  2s
    Close Browser

Login as Student and Verify Information
    Open Browser  http://localhost:4680/tbuis/index.jsp  ${BROWSER}
    Click Element  xpath///*[@id="header.link.login"]
    Input Text  xpath///*[@id="loginPage.userNameInput"]  yellow
    Input Text  xpath///*[@id="loginPage.passwordInput"]  pass
    Click Element  xpath///*[@id="loginPage.loginFormSubmit"]
    Sleep  2s
    Click Element  xpath///*[@id="stu.menu.otherSubjects"]
    Sleep  2s
    Element Should Contain  xpath///*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2]  Linear Algebra
    Element Should Contain  xpath///*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3]  Alice Pedant
    Close Browser