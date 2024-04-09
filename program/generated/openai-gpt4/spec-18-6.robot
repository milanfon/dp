*** Settings ***
Library           SeleniumLibrary
Test Teardown     Close Browser

*** Test Cases ***
Check Teachers And Courses
    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    lazy
    Sleep    2s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath=//*[@id="tea.menu.listOfAllTeachers"]
    Sleep    2s
    Page Should Contain    Julia Easyrider
    Page Should Contain    Olivia Keen
    Page Should Contain    John Lazy
    Page Should Contain    Alice Pedant
    Page Should Contain    Thomas Scatterbrained
    Page Should Contain    Peter Strict
    Sleep    1s
    Element Should Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[3]    Numerical Methods
    Sleep    1s
    Element Should Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3]    Database Systems, Fundamentals of Computer Networks, Introduction to Algorithms, Mobile Applications, Web Programming
    Sleep    1s
    Element Should Not Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[3]    .
    Sleep    1s
    Element Should Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    Computer System Engineering, Database Systems, Operating Systems, Programming Techniques
    Sleep    1s
    Element Should Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[3]    Computation Structures
    Sleep    1s
    Element Should Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3]    Operating Systems, Programming in Java, Software Engineering, Software Quality Assurance