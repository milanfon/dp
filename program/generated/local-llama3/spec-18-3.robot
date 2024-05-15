*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
Suite Teardown    Close Browser

*** Test Cases ***
Check Page Content
    Set Browser Implicit Wait    10
    Set Viewport Size    1501    1104
    Navigate    http://localhost:4680/tbuis/index.jsp
    Wait Until Page Contains    University information system
    Click Element    xpath://*[@id="header.link.login"]
    Wait Until Page Contains    
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    lazy
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Wait Until Page Contains    
    Click Element    xpath://*[@id="tea.menu.listOfAllTeachers"]
    Wait Until Page Contains    Teacher's View
    ${names}    Create List    Julia Easyrider    Olivia Keen    John Lazy    Alice Pedant    Thomas Scatterbrained    Peter Strict
    : FOR    ${name}    IN    @{names}
    \    Page Should Contain    ${name}
    Sleep    1
    Page Should Contain    Numerical Methods    //*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[3]
    Sleep    1
    Page Should Contain    Database Systems, Fundamentals of Computer Networks, Introduction to Algorithms, Mobile Applications, Web Programming    //*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3]
    Sleep    1
    Page Should Not Contain    //*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[3]
    Sleep    1
    Page Should Contain    Computer System Engineering, Database Systems, Operating Systems, Programming Techniques    //*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]
    Sleep    1
    Page Should Contain    Computation Structures    //*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[3]
    Sleep    1
    Page Should Contain    Operating Systems, Programming in Java, Software Engineering, Software Quality Assurance    //*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3]
    Sleep    1