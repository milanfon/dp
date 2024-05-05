**Test Scenario:**

- Check names on page
- Check courses for each teacher

**Test Case:**

    Open page
        Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
        Input Text    xpath://*[@id="loginPage.userNameInput"]    lazy
        Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
        Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
        Click Element    xpath://*[@id="tea.menu.listOfAllTeachers"]
        ${AllTeachers}=    Get Elements    xpath://*[@id="tea.listOfAllTeachers.teacher"]
        ${teacherNames}=    Get Elements    xpath://*[@id="tea.listOfAllTeachers.teacher"]/td[1]
        ${teacherCourses}=    Get Elements    xpath://*[@id="tea.listOfAllTeachers.teacher"]/td[3]
        : FOR    ${teacher}    IN    @{AllTeachers}
        \    ${name}=    Get Text    xpath://*[@id="tea.listOfAllTeachers.teacher"]/td[1]
        \    ${courses}=    Get Text    xpath://*[@id="tea.listOfAllTeachers.teacher"]/td[3]
        \    ${id}=    Get Element Attribute    ${teacher}    id
        \    ${id}=    Replace String    ${id}    tea.listOfAllTeachers.teacher    ${EMPTY}
        \    ${id}=    Replace String    ${id}    .    ${EMPTY}
        \    ${id}=    Convert To Integer    ${id}
        \    ${name}=    Get Text    ${teacherNames}[${id}]
        \    ${courses}=    Get Text    ${teacherCourses}[${id}]
        \    Run Keyword If    ${name} == "Julia Easyrider"    Run Keyword And Continue On Failure    Check Teacher    ${id}    ${courses}    Numerical Methods
        \    Run Keyword If    ${name} == "Olivia Keen"    Run Keyword And Continue On Failure    Check Teacher    ${id}    ${courses}    Database Systems, Fundamentals of Computer Networks, Introduction to Algorithms, Mobile Applications, Web Programming
        \    Run Keyword If    ${name} == "John Lazy"    Run Keyword And Continue On Failure    Check Teacher    ${id}    ${courses}    ${EMPTY}
        \    Run Keyword If    ${name} == "Alice Pedant"    Run Keyword And Continue On Failure    Check Teacher    ${id}    ${EMPTY}
        \    Run Keyword If    ${name} == "Thomas Scatterbrained"    Run Keyword And Continue On Failure    Check Teacher    ${id}    Computer System Engineering, Database Systems, Operating Systems, Programming Techniques
        \    Run Keyword If    ${name} == "Peter Strict"    Run Keyword And Continue On Failure    Check Teacher    ${id}    Operating Systems, Programming in Java, Software Engineering, Software Quality Assurance
        Close Browser


    Check Teacher
        [Arguments]    ${id}    ${courses}    ${expectedCourses}
        ${expectedCoursesList}=    Split String    ${expectedCourses}    ,
        ${coursesList}=    Split String    ${courses}    ,
        ${expectedCoursesListLength}=    Get Length    ${expectedCoursesList}
        ${coursesListLength}=    Get Length    ${coursesList}
        ${status}=    Set Variable    ${coursesListLength} == ${expectedCoursesListLength}
        ${status}=    Set Variable If    ${status} == ${False}    ${False}    ${False}
        : FOR    ${course}    IN    @{coursesList}
        \    ${status}=    Set Variable If    ${status} == ${False}    ${False}    ${False}
        \    ${status}=    Set Variable If    ${course} == ${expectedCoursesList}    ${True}    ${True}
        \    ${status}=    Set Variable If    ${status} == ${False}    ${False}    ${False}
        Should Be True    ${status}    ${name} teaches ${expectedCourses}

        ${status}=    Set Variable If    ${status} == ${False}    ${False}    ${False}
        Should Be True    ${status}    ${name} teaches ${expectedCourses}


    Check names on page
        ${teacherNames}=    Get Webelements    xpath://*[@id="tea.listOfAllTeachers.teacher"]/td[1]
        ${expectedNames}=    Create List    Julia Easyrider    Olivia Keen    John Lazy    Alice Pedant    Thomas Scatterbrained    Peter Strict
        ${teacherNames}=    Evaluate    [x.text for x in ${teacherNames}]
        ${expectedNames}=    Evaluate    [x.strip() for x in ${expectedNames}]
        ${teacherNames}=    Evaluate    [x.strip() for x in ${teacherNames}]
        ${status}=    Evaluate    set($expectedNames) == set($teacherNames)
        Should Be True    ${status}    The expected teacher names are present


    Check courses for each teacher
        ${teacherNames}=    Get Webelements    xpath://*[@id="tea.listOfAllTeachers.teacher"]/td[1]
        ${teacherCourses}=    Get Webelements    xpath://*[@id="tea.listOfAllTeachers.teacher"]/td[3]
        ${status}=    Set Variable    ${True}
        ${id}=    Set Variable    ${0}
        : FOR    ${teacher}    IN    @{teacherNames}
        \    ${name}=    Get Text    ${teacher}
        \    ${courses}=    Get Text    ${teacherCourses}[${id}]
        \    ${id}=    Evaluate    ${id} + 1
        \    ${courses}=    Split String    ${courses}    ,
        \    ${