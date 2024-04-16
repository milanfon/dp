*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}  http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Scenario
    Open Browser  ${URL}  chrome
    Maximize Browser Window
    Set Viewport  1501  1104  1  false  false  false
    Sleep  1s
    Click Element  xpath://*[@id="header.link.login"]
    Sleep  1s
    Input Text  xpath://*[@id="loginPage.userNameInput"]  lazy
    Sleep  1s
    Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
    Sleep  1s
    Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep  2s
    Click Element  xpath://*[@id="tea.menu.listOfAllTeachers"]
    Sleep  1s
    Page Should Contain Element  xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[3]  Numerical Methods
    Page Should Contain Element  xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3]  Database Systems, Fundamentals of Computer Networks, Introduction to Algorithms, Mobile Applications, Web Programming
    Page Should Not Contain Element  xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[3]
    Page Should Contain Element  xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]  Computer System Engineering, Database Systems, Operating Systems, Programming Techniques
    Page Should Contain Element  xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[3]  Computation Structures
    Page Should Contain Element  xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3]  Operating Systems, Programming in Java, Software Engineering, Software Quality Assurance
    Close Browser