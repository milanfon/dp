*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Check Teachers And Courses
    [Setup]    Open Browser    http://localhost:4680/tbuis/index.jsp    browser=gc
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    lazy
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="tea.menu.listOfAllTeachers"]
    Check If Element Contains    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[3]    Numerical Methods
    Check If Element Contains    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3]    Database Systems, Fundamentals of Computer Networks, Introduction to Algorithms, Mobile Applications, Web Programming
    Check If Element Does Not Contain    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[3]    text
    Check If Element Contains    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    Computer System Engineering, Database Systems, Linear Algebra, Operating Systems, Programming Techniques
    Check If Element Contains    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[3]    Computation Structures
    Check If Element Contains    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3]    Operating Systems, Programming in Java, Software Engineering, Software Quality Assurance
    Check If Element Contains    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[2]    Julia Easyrider
    Check If Element Contains    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[2]    Olivia Keen
    Check If Element Contains    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[2]    John Lazy
    Check If Element Contains    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2]    Alice Pedant
    Check If Element Contains    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[2]    Thomas Scatterbrained
    Check If Element Contains    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[2]    Peter Strict
    Close Browser