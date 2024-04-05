
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://localhost:4680/tbuis/index.jsp
${BROWSER}    Chrome

*** Test Cases ***
Scenario
    [Setup]    Open Browser    ${URL}    ${BROWSER}
    Click Element    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    lazy
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="tea.menu.listOfAllTeachers"]
    # Check if there are these names present on the page
    Page Should Contain    Julia Easyrider
    Page Should Contain    Olivia Keen
    Page Should Contain    John Lazy
    Page Should Contain    Alice Pedant
    Page Should Contain    Thomas Scatterbrained
    Page Should Contain    Peter Strict
    # Check if element with path //*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[3] has text matching "Numerical Methods"
    Element Should Contain    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[3]    Numerical Methods
    # Check if element with path //*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3] has text matching "Database Systems, Fundamentals of Computer Networks, Introduction to Algorithms, Mobile Applications, Web Programming"
    Element Should Contain    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3]    Database Systems, Fundamentals of Computer Networks, Introduction to Algorithms, Mobile Applications, Web Programming
    # Check if element with path //*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[3] should not contain text
    Page Should Not Contain Element    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[3]
    # Check if element with path //*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3] has text matching "Computer System Engineering, Database Systems, Linear Algebra, Operating Systems, Programming Techniques"
    Element Should Contain    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    Computer System Engineering, Database Systems, Linear Algebra, Operating Systems, Programming Techniques
    # Check if element with path //*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[3] has text matching "Computation Structures"
    Element Should Contain    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[3]    Computation Structures
    # Check if element with path //*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3] has text matching "Operating Systems, Programming in Java, Software Engineering, Software Quality Assurance"
    Element Should Contain    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3]    Operating Systems, Programming in Java, Software Engineering, Software Quality Assurance
    [Teardown]    Close Browser