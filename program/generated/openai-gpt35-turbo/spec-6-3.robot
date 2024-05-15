*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${url}  http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Open Page and Check Elements
    Open Browser  ${url}  chrome
    Set Viewport  1501  1104
    Wait Until Page Contains Element  main
    Click Element  main  xpath://*[@id="header.link.login"]
    Wait Until Page Contains Element  main  xpath://*[@id="loginPage.userNameInput"]
    Input Text  main  xpath://*[@id="loginPage.userNameInput"]  maroon
    Press Keys  main  xpath://*[@id="loginPage.userNameInput"]  TAB
    Input Text  main  xpath://*[@id="loginPage.passwordInput"]  pass
    Press Keys  main  xpath://*[@id="loginPage.passwordInput"]  ENTER
    Wait Until Page Contains Element  main  xpath://*[@id="stu.menu.otherSubjects"]
    Click Element  main  xpath://*[@id="stu.menu.otherSubjects"]
    Wait Until Page Contains Element  main  xpath://*[@id="stu.otherSubjects.table.enrollButton-10"]
    Click Element  main  xpath://*[@id="stu.otherSubjects.table.enrollButton-10"]
    Wait Until Page Contains Element  main  xpath://*[@id="stu.menu.mySubjects"]
    Click Element  main  xpath://*[@id="stu.menu.mySubjects"]
    Wait Until Page Contains Element  main  xpath://*[@id="stu.mySubjects.enrolledTable.subjectRow-2"]
    Wait Until Page Contains Element  main  xpath://*[@id="stu.mySubjects.enrolledTable.subjectRow-2"]//td[text()="Software Quality Assurance"]
    Wait Until Page Contains Element  main  xpath://*[@id="stu.mySubjects.enrolledTable.subjectRow-2"]//td[text()="Peter Strict"]
    Close Browser

Login as Teacher and Check Elements
    Open Browser  ${url}  chrome
    Set Viewport  1501  1104
    Wait Until Page Contains Element  main
    Click Element  main  xpath://*[@id="header.link.login"]
    Wait Until Page Contains Element  main  xpath://*[@id="loginPage.userNameInput"]
    Input Text  main  xpath://*[@id="loginPage.userNameInput"]  strict
    Input Text  main  xpath://*[@id="loginPage.passwordInput"]  pass
    Click Element  main  xpath://*[@id="loginPage.loginFormSubmit"]
    Wait Until Page Contains Element  main  xpath://*[@id="tea.menu.mySubjects"]
    Click Element  main  xpath://*[@id="tea.menu.mySubjects"]
    Wait Until Page Contains Element  main  xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Page Should Contain Element  main  xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-3"][text()="Students (2)"]
    Click Element  main  xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Wait Until Page Contains Element  main  xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-3"]//td[text()="William Maroon"]
    Close Browser