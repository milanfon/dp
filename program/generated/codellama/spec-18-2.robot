*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Check Teacher's Names And Subjects
    [Setup]    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Sleep    1s
    Click Element    id:header.link.login
    Sleep    1s
    Click Element    id:loginPage.userNameInput
    Sleep    1s
    Input Text    id:loginPage.userNameInput    lazy
    Sleep    1s
    Click Element    id:loginPage.passwordInput
    Sleep    1s
    Input Text    id:loginPage.passwordInput    pass
    Sleep    1s
    Click Element    id:loginPage.loginFormSubmit
    Sleep    1s
    Click Element    id:tea.menu.listOfAllTeachers
    Sleep    1s
    Page Should Contain Element    xpath://*[text()[contains(.,'Julia Easyrider')]]
    Page Should Contain Element    xpath://*[text()[contains(.,'Olivia Keen')]]
    Page Should Contain Element    xpath://*[text()[contains(.,'John Lazy')]]
    Page Should Contain Element    xpath://*[text()[contains(.,'Alice Pedant')]]
    Page Should Contain Element    xpath://*[text()[contains(.,'Thomas Scatterbrained')]]
    Page Should Contain Element    xpath://*[text()[contains(.,'Peter Strict')]]
    Element Text Should Be    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[3]    Numerical Methods
    Element Text Should Be    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3]    Database Systems, Fundamentals of Computer Networks, Introduction to Algorithms, Mobile Applications, Web Programming
    Element Should Not Be Visible    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[3]
    Element Text Should Be    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    Computer System Engineering, Database Systems, Linear Algebra, Operating Systems, Programming Techniques
    Element Text Should Be    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[3]    Computation Structures
    Element Text Should Be    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3]    Operating Systems, Programming in Java, Software Engineering, Software Quality Assurance
    Close Browser
