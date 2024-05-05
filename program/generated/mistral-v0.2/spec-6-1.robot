*** Settings ***
Library           SeleniumLibrary
Browser           Chrome

*** Test Case ***
Open Page
    [Document]        url=http://localhost:4680/tbuis/index.jsp
    [Document]        set_viewport=1501,1104,1
    [Document]        Go To
    *** Keywords ***
    Login As Student
        [Document]        Go To
            *** Args ***
            url=http://localhost:4680/tbuis/login
        [Document]        Input Text
            *** Name ***
            userNameInput
            *** Text ***
            maroon
        [Document]        Click Button
            *** Name ***
            loginFormSubmit
        [Document]        Go To
            *** Args ***
            url=http://localhost:4680/tbuis/student-view/otherSubjects

    *** Check ***
    Element Should Be Visible
        *** Name ***
        stu.otherSubjects.successAlert

    Go To My Subjects
        [Document]        Click Element
            *** Name ***
            stu.menu.mySubjects

    *** Check ***
    Element Should Contain
        *** Name ***
        tr
        *** Text ***
        Software Quality Assurance

    *** Check ***
    Element Should Contain
        *** Name ***
        tr
        *** Text ***
        Peter Strict

    Logout
        [Document]        Click Element
            *** Name ***
            stu.menu.logout

    *** Teach ***
    Login As Teacher
        [Document]        Go To
            *** Args ***
            url=http://localhost:4680/tbuis/login
        [Document]        Input Text
            *** Name ***
            userNameInput
            *** Text ***
            strict
        [Document]        Input Text
            *** Name ***
            passwordInput
            *** Text ***
            pass
        [Document]        Click Button
            *** Name ***
            loginFormSubmit
        [Document]        Go To
            *** Args ***
            url=http://localhost:4680/tbuis/teacher-view/overview

    *** Check ***
    Element Should Contain
        *** Name ***
        #tea.mySubjects.table.listOfStudentsButton-3
        *** Text ***
        Students (2)

    Click Students Button
        [Document]        Click Element
            *** Name ***
            #tea.mySubjects.table.listOfStudentsButton-3

    *** Check ***
    Element Should Be Visible
        *** Name ***
        td
        *** Text ***
        William Maroon

    Logout
        [Document]        Click Element
            *** Name ***
            tea.menu.logout

*** Test ***
Open Page

*** Teardown ***
Close Browser