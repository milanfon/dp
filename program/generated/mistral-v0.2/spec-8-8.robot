*** Settings ***
Library            SeleniumLibrary
Browser            Chrome

*** Variables ***
${base_url}        http://localhost:4680/tbuis/

*** Test Cases ***

Test Case        student_exam_dates
    [Documentation]        Test case for student exam dates functionality

    [Preparation]        Set Viewport
        **Viewport**
        **Width**        1501
        **Height**        1104
        **Device Scale Factor**        1
        **Is Mobile**        False
        **Has Touch**        False
        **Is Landscape**        False

    [Setup]        Navigate To
        **Url**        ${base_url}

    [Teardown]        Close Browser

    [Steps]        Login As Student
        **Click**        #header.link.login
        **Element Should Contain**        main
        **Text**        Login
        **Click**        #loginPage.userNameInput
        **Input**        userName        green
        **Click**        #loginPage.passwordInput
        **Input**        password        pass
        **Click**        #loginPage.loginFormSubmit
        **Element Should Contain**        main
        **Text**        Student's View

        [Conditions]        Success Alert Is Present
            **Element Should Contain**        main
            **XPath**        //*[@id="stu.otherExamDates.successAlert"]

        [Conditions]        Programming In Java Is Present
            **Element Should Contain**        main
            **Find XPath**        //*[text()="Programming in Java"]
            **Should Contain**        //*[text()="Programming in Java"]

        [Teardown]        Logout
            **Click**        #header.link.logout

Test Case        teacher_exam_dates
    [Documentation]        Test case for teacher exam dates functionality

    [Preparation]        Set Viewport
        **Viewport**
        **Width**        1501
        **Height**        1104
        **Device Scale Factor**        1
        **Is Mobile**        False
        **Has Touch**        False
        **Is Landscape**        False

    [Setup]        Navigate To
        **Url**        ${base_url}

    [Teardown]        Close Browser

    [Steps]        Login As Teacher
        **Click**        #header.link.login
        **Element Should Contain**        main
        **Text**        Login
        **Click**        #loginPage.userNameInput
        **Input**        userName        strict
        **Click**        #loginPage.passwordInput
        **Input**        password        pass
        **Click**        #loginPage.loginFormSubmit
        **Element Should Contain**        main
        **Text**        Teacher's View

        [Conditions]        Mia Orange Is Present
            **Element Should Contain**        main
            **Find XPath**        //*[text()="Mia Orange"]
            **Should Contain**        //*[text()="Mia Orange"]

Test Case        student_and_teacher_exam_dates
    [Documentation]        Test case for student and teacher exam dates functionality

    [Preparation]        Set Viewport
        **Viewport**
        **Width**        1501
        **Height**        1104
        **Device Scale Factor**        1
        **Is Mobile**        False
        **Has Touch**        False
        **Is Landscape**        False

    [Setup]        Navigate To
        **Url**        ${base_url}

    [Teardown]        Close Browser

    [Steps]        Login As Student
        **Click**        #header.link.login
        **Element Should Contain**        main
        **Text**        Login
        **Click**        #loginPage.userNameInput
        **Input**        userName        green
        **Click**        #loginPage.passwordInput
        **Input**        password        pass
        **Click**        #loginPage.loginFormSubmit
        **Element Should Contain**        main
        **Text**        Student's View

        [Conditions]        Success Alert Is Present
            **Element Should Contain**        main
            **XPath**        //*[@id="stu.otherExamDates.successAlert"]

        [Steps]        Logout
            **Click**        #header.link.logout

        [Steps]        Login As Teacher
            **Click**        #header.link.login
            **Text**        Login
            **Click**        #loginPage.userNameInput
            **Input**        userName        strict
            **Click**        #loginPage.passwordInput
            **Input**        password        pass
            **Click**        #loginPage.loginFormSubmit
            **Element Should Contain**        main
            **Text**        Teacher's View

        [Conditions]        Mia Orange Is Present
            **Element Should Contain**        main
            **Find XPath**        //*[text()="Mia Orange"]
            **Should Contain**        //*[text()="Mia Orange"]

        [Teardown]        Logout
            **Click**        #header.link.logout