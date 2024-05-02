*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
Suite Teardown    Close Browser

*** Test Cases ***
Check Teachers Page
    Set Viewport    1501    1104
    Navigate    http://localhost:4680/tbuis/index.jsp
    Click    xpath://*[@id="header.link.login"]
    Click    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    lazy
    Click    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click    xpath://*[@id="loginPage.loginFormSubmit"]
    Click    xpath://*[@id="tea.menu.listOfAllTeachers"]
    Sleep    1
    ${names}    Create List    Julia Easyrider    Olivia Keen    John Lazy    Alice Pedant    Thomas Scatterbrained    Peter Strict
    FOR    ${name}    IN    @{names}
        Page Should Contain    ${name}
    END
    Page Should Contain    Numerical Methods    //*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[3]
    Page Should Contain    Database Systems, Fundamentals of Computer Networks, Introduction to Algorithms, Mobile Applications, Web Programming    //*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3]
    Page Should Not Contain    //*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[3]
    Page Should Contain    Computer System Engineering, Database Systems, Operating Systems, Programming Techniques    //*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]
    Page Should Contain    Computation Structures    //*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[3]
    Page Should Contain    Operating Systems, Programming in Java, Software Engineering, Software Quality Assurance    //*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3]
    Sleep    1