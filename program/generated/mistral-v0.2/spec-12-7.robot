*** Settings ***
Library      SeleniumLibrary
Browser      Chrome

*** Test Cases ***

# Teacher Test

# Open University information system
[Document]    ${url}
Set Viewport    width=1501    height=1104    deviceScaleFactor=1    isMobile=False    hasTouch=False    isLandscape=False
[Document]    ${title}
Click    main
    Selectors    [
        [aria]    Login
        [id]        header.link.login
        [xpath]    //*[@id="header.link.login"]
        [pierce]    pierce/header.link.login
        [text]        Login
    ]
    OffsetY    19
    OffsetX    49.671875
[Document]    ${title_login_page}
[Document]    ${url_login}
[Document]    ${title_login}
Click    main
    Selectors    [
        [aria]    Username
        [id]        loginPage.userNameInput
        [xpath]    //*[@id="loginPage.userNameInput"]
        [pierce]    pierce/loginPage.userNameInput
    ]
    OffsetY    3
    OffsetX    287.5
Change    main
    Value        scatterbrained
Click    main
    Selectors    [
        [aria]    Password
        [id]        loginPage.passwordInput
        [xpath]    //*[@id="loginPage.passwordInput"]
        [pierce]    pierce/loginPage.passwordInput
    ]
    OffsetY    9
    OffsetX    217.5
Change    main
    Value        pass
Click    main
    Selectors    [
        [aria]    Login[role="button"]
        [id]        loginPage.loginFormSubmit
        [xpath]    //*[@id="loginPage.loginFormSubmit"]
        [pierce]    pierce/loginPage.loginFormSubmit
    ]
    OffsetY    20
    OffsetX    43.5
[Document]    ${title_teacher_view}
Click    main
    Selectors    [
        [aria]    My Exam Dates
        [id]        tea.menu.myExamDates
        [xpath]    //*[@id="tea.menu.myExamDates"]
        [pierce]    pierce/tea.menu.myExamDates
        [text]        My Exam Dates
    ]
    OffsetY    19
    OffsetX    58.5
[Document]    ${url_my_exam_dates}
[Document]    ${title_my_exam_dates}
Click    main
    Selectors    [
        [aria]    X[role="button"]
        [id]        tea.myExamDates.table.cancelButton-0-0
        [xpath]    //*[@id="tea.myExamDates.table.cancelButton-0-0"]
        [pierce]    pierce/tea.myExamDates.table.cancelButton-0-0
        [text]        X
    ]
    OffsetY    16.40625
    OffsetX    12.984375
Click    main
    Selectors    [
        [aria]    Set Evaluation
        [id]        tea.menu.setEvaluation
        [xpath]    //*[@id="tea.menu.setEvaluation"]
        [pierce]    pierce/tea.menu.setEvaluation
        [text]        Set Evaluation
    ]
    OffsetY    19
    OffsetX    87.5
[Document]    ${url_set_evaluation}
[Document]    ${title_set_evaluation}
Click    main
    Selectors    [
        [aria]    Evaluation Table
        [id]        tea.menu.evaluationTable
        [xpath]    //*[@id="tea.menu.evaluationTable"]
        [pierce]    pierce/tea.menu.evaluationTable
        [text]        Evaluation Table
    ]
    OffsetY    21
    OffsetX    74.5
Click    main
    Selectors    [
        [aria]    Subject
        [id]        tea.evalTable.filter.subjectSelect
        [xpath]    //*[@id="tea.evalTable.filter.subjectSelect"]
        [pierce]    pierce/tea.evalTable.filter.subjectSelect
        [text]        -1
    ]
    OffsetY    16.40625
    OffsetX    110.3671875
Change    main
    Value        1202
Click    main
    Selectors    [
        [aria]    Filter[role="button"]
        [id]        tea.evalTable.filter.submitButton
        [xpath]    //*[@id="tea.evalTable.filter.submitButton"]
        [pierce]    pierce/tea.evalTable.filter.submitButton
    ]
    OffsetY    16.40625
    OffsetX    32.5
[Document]    ${url_evaluation_table_1202}
[Document]    ${title_evaluation_table_1202}

# Alert handling and checks
[Document]    ${url_my_exam_dates}
[Document]    ${title_my_exam_dates}
Click    main
    Selectors    [
        [aria]    X[role="button"]
        [id]        tea.myExamDates.table.cancelButton-0-0
        [xpath]    //*[@id="tea.myExamDates.table.cancelButton-0-0"]
        [pierce]    pierce/tea.myExamDates.table.cancelButton-0-0
        [text]        X
    ]
    OffsetY    16.40625
    OffsetX    12.984375
    Sleep    5
    Click    main
    Sleep    3
    Get Alert Text    alert
    Save As    alert_text
    Should Not Be Empty    alert_text

    Click    main
    Sleep    3
    Click    main
    Sleep    3

    Element Should Be Visible    main
    [Properties]    id=tea.myExamDates.successAlert

# Student Test

# Open University information system
[Document]    ${url}
Set Viewport    width=1501    height=1104    deviceScaleFactor=1    isMobile=False    hasTouch=False    isLandscape=False
[Document]    ${title}
Click    main
    Selectors    [
        [aria]    Login
        [id]        header.link.login
        [xpath]    //*[@id="header.link.login"]
        [pierce]    pierce/header.link.login
        [text]        Login
    ]
    OffsetY    19
    OffsetX    49.671875
[Document]    ${title_login_page}
[Document]    ${url_login}
[Document]    ${title_login}
Click    main
    Selectors    [
        [aria]    Username
        [id]        loginPage.userNameInput
        [xpath]    //*[@id="loginPage.userNameInput"]
        [pierce]    pierce/loginPage.userNameInput
    ]
    OffsetY    3
    OffsetX    287.5
Change    main
    Value        orange
Click    main
    Selectors    [
        [aria]    Password
        [id]        loginPage.passwordInput
        [xpath]    //*[@id="loginPage.passwordInput"]
        [pierce]    pierce/loginPage.passwordInput
    ]
    OffsetY    9
    OffsetX    217.5
Change    main
    Value        pass
Click    main
    Selectors    [
        [aria]    Login[role="button"]
        [id]        loginPage.loginFormSubmit
        [xpath]    //*[@id="loginPage.loginFormSubmit"]
        [pierce]    pierce/loginPage.loginFormSubmit
    ]
    OffsetY    20
    OffsetX    43.5
[Document]    ${title_student_view}
Click    main
    Selectors    [
        [aria]    My Exam Dates
        [id]        stu.menu.myExamDates
        [xpath]    //*[@id="stu.menu.myExamDates"]
        [pierce]    pierce/stu.menu.myExamDates
        [text]        My Exam Dates
    ]
    OffsetY    23
    OffsetX    82.5
[Document]    ${url_my_exam_dates}
[Document]    ${title_my_exam_dates}

# Check if text "Computation Structures" is not present
[Document]    ${url_my_exam_dates}
[Document]    ${title_my_exam_dates}
Element Should Not Be Visible    main
    [Properties]    text="Computation Structures"