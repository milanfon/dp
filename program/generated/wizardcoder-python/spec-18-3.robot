*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${url}    http://localhost:4680/tbuis/index.jsp
${username}    lazy
${password}    pass
${browser}    Chrome

*** Test Cases ***
Test
    Open browser    ${url}    ${browser}
    Input text    id:loginPage.userNameInput    ${username}
    Input text    id:loginPage.passwordInput    ${password}
    Click button    id:loginPage.loginFormSubmit
    Click link    link:List of All Teachers
    Wait until page contains    Julia Easyrider
    Wait until page contains    Olivia Keen
    Wait until page contains    John Lazy
    Wait until page contains    Alice Pedant
    Wait until page contains    Thomas Scatterbrained
    Wait until page contains    Peter Strict
    ${text0}    Get text    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[3]
    ${text1}    Get text    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3]
    ${text2}    Get text    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[3]
    ${text3}    Get text    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]
    ${text4}    Get text    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[3]
    ${text5}    Get text    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3]
    Should be equal    ${text0}    Numerical Methods
    Should be equal    ${text1}    Database Systems, Fundamentals of Computer Networks, Introduction to Algorithms, Mobile Applications, Web Programming
    Should be equal    ${text3}    Computer System Engineering, Database Systems, Operating Systems, Programming Techniques
    Should be equal    ${text4}    Computation Structures
    Should be equal    ${text5}    Operating Systems, Programming in Java, Software Engineering, Software Quality Assurance
    Close all browsers