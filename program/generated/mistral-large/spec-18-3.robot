*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}        http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Check Teachers and Courses
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    # Login steps
    Click Element    xpath://*[@id="header.link.login"]
    Input Text       xpath://*[@id="loginPage.userNameInput"]    lazy
    Input Text       xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]

    # Navigate to List of All Teachers
    Click Element    xpath://*[@id="tea.menu.listOfAllTeachers"]

    # Check if names are present on the page
    ${names}    Create List    Julia Easyrider    Olivia Keen    John Lazy    Alice Pedant    Thomas Scatterbrained    Peter Strict
    : FOR    ${name}    IN    @{names}
    \    Page Should Contain    ${name}

    # Check courses for each teacher
    Page Should Contain Element    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[3]    Numerical Methods
    Page Should Contain Element    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3]    Database Systems    Fundamentals of Computer Networks    Introduction to Algorithms    Mobile Applications    Web Programming
    Page Should Not Contain Element    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[3]
    Page Should Contain Element    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    Computer System Engineering    Database Systems    Operating Systems    Programming Techniques
    Page Should Contain Element    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[3]    Computation Structures
    Page Should Contain Element    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3]    Operating Systems    Programming in Java    Software Engineering    Software Quality Assurance

    Close Browser
