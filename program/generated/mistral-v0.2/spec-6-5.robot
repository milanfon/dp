*** Settings ***
Library        SeleniumLibrary
Browser        Chrome

*** Test Cases ***

Scenario1
    [Tags]    student
    [Documentation]    This scenario opens the student page, enrolls in a subject and checks if the success message appears

    Set Viewport   1501   1104
    Set Environment    url    http://localhost:4680/tbuis/index.jsp

    Navigate    ${url}

    ${username}    Set Variable    {}
    ${password}    Set Variable    {}

    Click    main
    [Target]    text=Login

    Set Value    ${username}    maroon
    Set Value    #loginPage.passwordInput    pass

    KeyDown    main    Tab
    KeyUp    main    Tab

    Click    main
    [Target]    text=Other Subjects

    Click    main
    [Target]    #stu.otherSubjects.table.enrollButton-10

    Sleep   1s

    ElementShouldBeVisible    main    #stu.otherSubjects.successAlert

    Set Environment    url    http://localhost:4680/tbuis/student-view/mySubjects

    Navigate    ${url}

    Click    main
    [Target]    text=My Subjects

    Table Should Contain    stu.mySubjects.enrolledTable    subjectRow-2    Software Quality Assurance
    Table Should Contain    stu.mySubjects.enrolledTable    subjectRow-2    text=Peter Strict

Scenario2
    [Tags]    teacher
    [Documentation]    This scenario opens the teacher page, checks the number of students and the presence of a specific student

    Set Viewport   1501   1104
    Set Environment    url    http://localhost:4680/tbuis/index.jsp

    Navigate    ${url}

    ${username}    Set Variable    {}
    ${password}    Set Variable    {}

    Click    main
    [Target]    text=Login

    Set Value    ${username}    strict
    Set Value    #loginPage.passwordInput    pass

    Click    main
    [Target]    text=Login

    Click    main
    [Target]    text=My Subjects

    Click    main
    [Target]    #tea.mySubjects.table.listOfStudentsButton-3

    Sleep   1s

    ElementShouldContain    main    #tea.mySubjects.table.listOfStudentsButton-3    text=Students (2)

    Sleep   2s

    ElementShouldBeVisible    main    #tea.mySubjects.table.studentRow
    ElementShouldContain    main    #tea.mySubjects.table.studentRow    td     text=William
    ElementShouldContain    main    #tea.mySubjects.table.studentRow    td     text=Maroon