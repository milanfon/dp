*** Settings ***
Library            SeleniumLibrary
Library            Selenium2Library
Browser            Chrome

*** Variables ***
${URL}            http://localhost:4680/tbuis/

*** Test Cases ***

Test Case        student
    [Documentation]        Test student functionality

    [Preparation]        Set Viewport
        Set Viewport            width=1501    height=1104    deviceScaleFactor=1    isMobile=false    hasTouch=false    isLandscape=false

    [Actions]        Go To
        Go To            ${URL}

    [Actions]        Login
        Click Element            id=header.link.login
        Set Value            #loginPage.userNameInput            ${username}
        Set Value            #loginPage.passwordInput            ${password}
        Click Element            id=loginPage.loginFormSubmit

    [Actions]        Click Other Exam Dates
        Click Element            id=stu.menu.otherExamDates

    [Actions]        Register
        Click Element            id=stu.otherExamDates.table.registerButton-2-0

    [Conditions]        Element Is Visible
        Element Should Be Visible            id=stu.otherExamDates.successAlert

    [Actions]        Go To
        Go To            ${URL}/student-view/myExamDates

    [Conditions]        Element Should Contain
        Element Should Contain            xpath=//td[.='Programming in Java']            text=Programming in Java

Test Case        teacher
    [Documentation]        Test teacher functionality

    [Preparation]        Set Viewport
        Set Viewport            width=1501    height=1104    deviceScaleFactor=1    isMobile=false    hasTouch=false    isLandscape=false

    [Actions]        Go To
        Go To            ${URL}

    [Actions]        Login
        Click Element            id=header.link.login
        Set Value            #loginPage.userNameInput            ${teacher_username}
        Set Value            #loginPage.passwordInput            ${teacher_password}
        Click Element            id=loginPage.loginFormSubmit

    [Actions]        Click My Exam Dates
        Click Element            id=tea.menu.myExamDates

    [Conditions]        Element Should Exist
        Element Should Exist            xpath=//td[.='Mia Orange']

*** Keywords ***