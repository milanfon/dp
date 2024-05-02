*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
Suite Teardown    Close Browser

*** Test Cases ***
Scenario: Check teachers and courses
    Navigate to page
    Check teachers and courses

*** Keywords ***
Navigate to page
    Set Window Size    1501    1104
    Click Element    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    lazy
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="tea.menu.listOfAllTeachers"]
    Sleep    1s    # wait for page to load

Check teachers and courses
    Sleep    1s    # wait for page to load
    ${names}=    Create List    Julia Easyrider    Olivia Keen    John Lazy    Alice Pedant    Thomas Scatterbrained    Peter Strict
    ${present}=    Create List
    FOR    ${name}    IN    @{names}
        ${element}=    Get Element    xpath://*[contains(text(), "${name}")]
        IF    ${element}
            Append To List    ${present}    ${name}
        END
    END
    List Should Contain Value    ${present}    Julia Easyrider
    List Should Contain Value    ${present}    Olivia Keen
    List Should Contain Value    ${present}    John Lazy
    List Should Contain Value    ${present}    Alice Pedant
    List Should Contain Value    ${present}    Thomas Scatterbrained
    List Should Contain Value    ${present}    Peter Strict
    Element Should Contain    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[3]    Numerical Methods
    Element Should Contain    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3]    Database Systems, Fundamentals of Computer Networks, Introduction to Algorithms, Mobile Applications, Web Programming
    Element Should Not Contain    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[3]    *
    Element Should Contain    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    Computer System Engineering, Database Systems, Operating Systems, Programming Techniques
    Element Should Contain    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[3]    Computation Structures
    Element Should Contain    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3]    Operating Systems, Programming in Java, Software Engineering, Software Quality Assurance
    Sleep    1s    # wait for page to load