*** Settings ***
Library           SeleniumLibrary
Suite Teardown     Close Browser

*** Variables ***
${BROWSER}       Chrome
${DELAY}         0.5 seconds

*** Test Cases ***
Open Page And Check Teachers
    Open Browser    ${BROWSER}
    Go To           http://localhost:4680/tbuis/index.jsp
    Click Element   xpath://*[@id="header.link.login"]
    Click Element   xpath://*[@id="loginPage.userNameInput"]
    Input Text      xpath://*[@id="loginPage.userNameInput"]    lazy
    Click Element   xpath://*[@id="loginPage.passwordInput"]
    Input Text      xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element   xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element   xpath://*[@id="tea.menu.listOfAllTeachers"]
    Sleep           ${DELAY}
    ${names} =    Create List    Julia Easyrider    Olivia Keen    John Lazy    Alice Pedant    Thomas Scatterbrained    Peter Strict
    : FOR    ${name}    IN    @{names}
    \    Page Should Contain    ${name}
    Sleep           ${DELAY}
    Page Should Contain    Numerical Methods    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[3]
    Page Should Contain    Database Systems, Fundamentals of Computer Networks, Introduction to Algorithms, Mobile Applications, Web Programming    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3]
    Page Should Not Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[3]
    Page Should Contain    Computer System Engineering, Database Systems, Operating Systems, Programming Techniques    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]
    Page Should Contain    Computation Structures    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[3]
    Page Should Contain    Operating Systems, Programming in Java, Software Engineering, Software Quality Assurance    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3]
    Sleep           ${DELAY}