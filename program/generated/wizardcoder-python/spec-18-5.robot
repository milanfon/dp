*** Settings ***
Library    SeleniumLibrary    WITH NAME    SeleniumLibrary


*** Variables ***
${URL}    http://localhost:4680/tbuis/index.jsp
${BROWSER}    Chrome

*** Test Cases ***
Test Page
    Open Browser    ${URL}    ${BROWSER}
    Input Text    id:loginPage.userNameInput    lazy
    Input Text    id:loginPage.passwordInput    pass
    Click Button    id:loginPage.loginFormSubmit
    Click Link    id:tea.menu.listOfAllTeachers

    Check Name    Julia Easyrider
    Check Name    Olivia Keen
    Check Name    John Lazy
    Check Name    Alice Pedant
    Check Name    Thomas Scatterbrained
    Check Name    Peter Strict
    Check Courses    //*[@id="tea.listOfAllTeachers.table.teacherRow-0"]    Numerical Methods
    Check Courses    //*[@id="tea.listOfAllTeachers.table.teacherRow-1"]    Database Systems, Fundamentals of Computer Networks, Introduction to Algorithms, Mobile Applications, Web Programming
    Check Courses    //*[@id="tea.listOfAllTeachers.table.teacherRow-2"]    ${EMPTY}
    Check Courses    //*[@id="tea.listOfAllTeachers.table.teacherRow-3"]    Computer System Engineering, Database Systems, Operating Systems, Programming Techniques
    Check Courses    //*[@id="tea.listOfAllTeachers.table.teacherRow-4"]    Computation Structures
    Check Courses    //*[@id="tea.listOfAllTeachers.table.teacherRow-5"]    Operating Systems, Programming in Java, Software Engineering, Software Quality Assurance
    Close Browser


*** Keywords ***
Check Name
    [Arguments]    ${teacherRow}    ${teacher}
    ${teacherName}    Get Text    xpath:${teacherRow}/td[1]
    Should Be Equal    ${teacherName}    ${teacher}


Check Courses
    [Arguments]    ${teacherRow}    ${courses}
    ${teacherCourses}    Get Text    xpath:${teacherRow}/td[3]
    Should Be Equal    ${teacherCourses}    ${courses}


Open Browser
    [Arguments]    ${url}    ${browser}
    SeleniumLibrary.Open Browser    ${url}    ${browser}    options=add_argument("--headless")
    SeleniumLibrary.Set Window Size    ${1501}    ${104}

    SeleniumLibrary.Set Selenium Implicit Wait    ${5}
    SeleniumLibrary.Set Selenium Timeout    ${5}
    SeleniumLibrary.Set Selenium Speed    ${0.1}

Login
    Input Text    id:loginPage.userNameInput    lazy
    Input Text    id:loginPage.passwordInput    pass
    Click Button    id:loginPage.loginFormSubmit
    Sleep    ${0.1}

Go To Teacher List
    Click Link    id:tea.menu.listOfAllTeachers
    Sleep    ${0.1}

*** Test Teardown ***
Close Browser

*** Keywords ***
Close Browser
    SeleniumLibrary.Close Browser

Sleep
    [Arguments]    ${seconds}
    Sleep    ${seconds}   