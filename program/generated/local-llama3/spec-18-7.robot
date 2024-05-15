*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
Suite Teardown    Close Browser

*** Test Cases ***
Check Teacher Page
    Set Viewport    1501    1104
    Navigate    http://localhost:4680/tbuis/index.jsp
    Click    xpath://*[@id="header.link.login"]
    Click    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    lazy
    Click    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click    xpath://*[@id="loginPage.loginFormSubmit"]
    Click    xpath://*[@id="tea.menu.listOfAllTeachers"]
    Sleep    2
    ${names} =    Create List    Julia Easyrider    Olivia Keen    John Lazy    Alice Pedant    Thomas Scatterbrained    Peter Strict
    ${present} =    Create List
    FOR    ${name}    IN    @{names}
        ${element} =    Get Webelement    xpath://*//*[contains(text(), "${name}")]
        IF    ${element}    Run Keyword And Continue On Failure    Append To List    ${present}    ${name}
    END
    ${present} =    Evaluate    sorted(${present}) == sorted(${names})
    Should Be True    ${present}
    ${element} =    Get Webelement    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[3]
    Should Contain    ${element.text}    Numerical Methods
    ${element} =    Get Webelement    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3]
    Should Contain    ${element.text}    Database Systems, Fundamentals of Computer Networks, Introduction to Algorithms, Mobile Applications, Web Programming
    ${element} =    Get Webelement    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[3]
    Should Be Empty    ${element.text}
    ${element} =    Get Webelement    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]
    Should Contain    ${element.text}    Computer System Engineering, Database Systems, Operating Systems, Programming Techniques
    ${element} =    Get Webelement    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[3]
    Should Contain    ${element.text}    Computation Structures
    ${element} =    Get Webelement    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3]
    Should Contain    ${element.text}    Operating Systems, Programming in Java, Software Engineering, Software Quality Assurance