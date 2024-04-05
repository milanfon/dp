*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Check Teachers and Courses
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Wait Until Page Contains    Login
    Click Element    xpath://*[@id="header.link.login"]
    Wait Until Page Contains    Username
    Input Text    xpath://*[@id="loginPage.userNameInput"]    lazy
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Wait Until Page Contains    List of All Teachers
    Click Element    xpath://*[@id="tea.menu.listOfAllTeachers"]

    Wait Until Page Contains    Julia Easyrider
    Wait Until Page Contains    Olivia Keen
    Wait Until Page Contains    John Lazy
    Wait Until Page Contains    Alice Pedant
    Wait Until Page Contains    Thomas Scatterbrained
    Wait Until Page Contains    Peter Strict

    Element Text Should Be    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[3]    Numerical Methods
    Element Text Should Be    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3]    Database Systems, Fundamentals of Computer Networks, Introduction to Algorithms, Mobile Applications, Web Programming
    Element Should Not Contain    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[3]    text
    Element Text Should Be    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    Computer System Engineering, Database Systems, Linear Algebra, Operating Systems, Programming Techniques
    Element Text Should Be    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[3]    Computation Structures
    Element Text Should Be    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3]    Operating Systems, Programming in Java, Software Engineering, Software Quality Assurance

    Close Browser