*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${BASE_URL}    http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
List Of All Teachers
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    2s
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    lazy
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
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
    Element Text Should Be    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[3]    Numerical Methods
    Element Should Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3]    Database Systems
    Element Should Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3]    Fundamentals of Computer Networks
    Element Should Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3]    Introduction to Algorithms
    Element Should Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3]    Mobile Applications
    Element Should Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3]    Web Programming
    Element Text Should Be    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[3]    ${EMPTY}
    Element Should Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    Computer System Engineering
    Element Should Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    Database Systems
    Element Should Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    Operating Systems
    Element Should Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    Programming Techniques
    Element Text Should Be    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[3]    Computation Structures
    Element Should Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3]    Operating Systems
    Element Should Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3]    Programming in Java
    Element Should Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3]    Software Engineering
    Element Should Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3]    Software Quality Assurance
    Close Browser