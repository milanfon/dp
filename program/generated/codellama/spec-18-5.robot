*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://localhost:4680/tbuis/index.jsp
${BROWSER}    Chrome
${DELAY}    5s

*** Test Cases ***
Spec 18
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    # Step 1
    Click Element    xpath=//*[@id="header.link.login"]
    # Step 2
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    lazy
    # Step 3
    Click Element    xpath=//*[@id="loginPage.passwordInput"]
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    # Step 4
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    # Step 5
    Click Element    xpath=//*[@id="tea.menu.listOfAllTeachers"]
    # Step 6
    # Check if there are these names present on the page: Julia Easyrider, Olivia Keen, John Lazy, Alice Pedant, Thomas Scatterbrained, Peter Strict
    # Check if element with path //*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[3] has text matching "Numerical Methods"
    Page Should Contain Element    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[3]
    Element Text Should Be    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[3]    Numerical Methods
    # Check if element with path //*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3] has text matching "Database Systems, Fundamentals of Computer Networks, Introduction to Algorithms, Mobile Applications, Web Programming"
    Page Should Contain Element    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3]
    Element Text Should Be    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3]    Database Systems, Fundamentals of Computer Networks, Introduction to Algorithms, Mobile Applications, Web Programming
    # Check if element with path //*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[3] should not contain text
    Page Should Contain Element    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[3]
    Element Should Be Empty    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[3]
    # Check if element with path //*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3] has text matching "Computer System Engineering, Database Systems, Linear Algebra, Operating Systems, Programming Techniques"
    Page Should Contain Element    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]
    Element Text Should Be    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    Computer System Engineering, Database Systems, Linear Algebra, Operating Systems, Programming Techniques
    # Check if element with path //*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[3] has text matching "Computation Structures"
    Page Should Contain Element    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[3]
    Element Text Should Be    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[3]    Computation Structures
    # Check if element with path //*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3] has text matching "Operating Systems, Programming in Java, Software Engineering, Software Quality Assurance"
    Page Should Contain Element    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3]
    Element Text Should Be    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3]    Operating Systems, Programming in Java, Software Engineering, Software Quality Assurance
    # Add delay
    Sleep    ${DELAY}
    # Close Browser
    Close Browser