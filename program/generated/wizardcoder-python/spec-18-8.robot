*** Settings ***
Library    SeleniumLibrary    run_on_failure=Close Browser

*** Variables ***
${URL}    http://localhost:4680/tbuis/
${BROWSER}    chrome

*** Test Cases ***
Scenario
    Open Browser    ${URL}    ${BROWSER}
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    lazy
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="tea.menu.listOfAllTeachers"]
    
    # Check if there are these names present on the page
    Element Text Should Be    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[1]    Julia Easyrider
    Element Text Should Be    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[1]    Olivia Keen
    Element Text Should Be    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[1]    John Lazy
    Element Text Should Be    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[1]    Alice Pedant
    Element Text Should Be    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[1]    Thomas Scatterbrained
    Element Text Should Be    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[1]    Peter Strict

    # Check if element with path //*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[3] has text matching "Numerical Methods"
    Element Text Should Match    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[3]    Numerical Methods
    
    # Check if element with path //*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3] has text matching "Database Systems, Fundamentals of Computer Networks, Introduction to Algorithms, Mobile Applications, Web Programming"
    Element Text Should Match    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3]    Database Systems, Fundamentals of Computer Networks, Introduction to Algorithms, Mobile Applications, Web Programming

    # Check if element with path //*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[3] should not contain text
    Page Should Not Contain    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[3]    text
    
    # Check if element with path //*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3] has text matching "Computer System Engineering, Database Systems, Operating Systems, Programming Techniques"
    Element Text Should Match    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    Computer System Engineering, Database Systems, Operating Systems, Programming Techniques
    
    # Check if element with path //*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[3] has text matching "Computation Structures"
    Element Text Should Match    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[3]    Computation Structures
    
    # Check if element with path //*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3] has text matching "Operating Systems, Programming in Java, Software Engineering, Software Quality Assurance"
    Element Text Should Match    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3]    Operating Systems, Programming in Java, Software Engineering, Software Quality Assurance
    
    Close Browser 