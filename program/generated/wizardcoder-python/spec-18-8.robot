*** Settings ***
Library    SeleniumLibrary   


*** Test Cases ***
Test Teacher's View
    Open Browser    http://localhost:4680/tbuis/login    Chrome
    Input Text    //*[@id="loginPage.userNameInput"]    lazy
    Input Text    //*[@id="loginPage.passwordInput"]    pass
    Click Element    //*[@id="loginPage.loginFormSubmit"]
    Click Element    //*[@id="tea.menu.listOfAllTeachers"]
    Wait Until Element Is Visible    //*[@id="tea.listOfAllTeachers.table.teacherRow-0"]    timeout=10
    Element Text Should Be    //*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[1]    Julia Easyrider
    Element Text Should Be    //*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[1]    Olivia Keen
    Element Text Should Be    //*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[1]    John Lazy
    Element Text Should Be    //*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[1]    Alice Pedant
    Element Text Should Be    //*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[1]    Thomas Scatterbrained
    Element Text Should Be    //*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[1]    Peter Strict
    Element Text Should Be    //*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[3]    Numerical Methods
    Element Text Should Be    //*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3]    Database Systems, Fundamentals of Computer Networks, Introduction to Algorithms, Mobile Applications, Web Programming
    Element Should Not Contain    //*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[3]    text
    Element Text Should Be    //*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    Computer System Engineering, Database Systems, Operating Systems, Programming Techniques
    Element Text Should Be    //*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[3]    Computation Structures
    Element Text Should Be    //*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3]    Operating Systems, Programming in Java, Software Engineering, Software Quality Assurance
    Close Browser