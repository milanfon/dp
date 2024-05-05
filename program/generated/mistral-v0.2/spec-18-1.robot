*** Settings ***
Library         SeleniumLibrary
Browser         Chrome

*** Variables ***
${urls.base}    http://localhost:4680/tbuis/

*** Test Cases ***
Test Teacher List
    [Documentation]         Test case for checking teacher list

    [Preparation]          Set Viewport
        *** Set Viewport ***
        width            1501
        height           1104
        device_scale_factor    1
        is_mobile          False
        has_touch         False
        is_landscape       False

    [Actions]             Open URL
        *** Open Browser ***
        url           =${urls.base}/index.jsp

    [Actions]             Login
        *** Click Keyboard ***
            keys            Tab

        *** Click Element ***
            [Find Ids]       header.link.login

        *** Click Element ***
            [Find Ids]       loginPage.userNameInput
            [Find Texts]     username

        *** Input Text ***
            [Find Ids]       loginPage.userNameInput
            text            John.Lazy

        *** Click Element ***
            [Find Ids]       loginPage.passwordInput

        *** Input Text ***
            [Find Ids]       loginPage.passwordInput
            text            pass

        *** Click Element ***
            [Find Ids]       loginPage.loginFormSubmit

        *** Sleep ***
            seconds        3

        *** Click Element ***
            [Find Ids]       tea.menu.listOfAllTeachers

        *** Sleep ***
            seconds        3

    [Teardown]         Close Browser
        *** Close Browser ***

    [Checks]            Check Teacher Names
        *** Element Should Contain ***
            [Find XPaths]    //*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[3]
            [Find Texts]    ~Julia Easyrider|Olivia Keen|Alice Pedant|Thomas Scatterbrained|Peter Strict

        *** Element Should Contain ***
            [Find XPaths]    //*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3]
            [Find Texts]    Database Systems, Fundamentals of Computer Networks, Introduction to Algorithms, Mobile Applications, Web Programming

        *** Element Should Not Contain Text ***
            [Find XPaths]    //*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[3]

        *** Element Should Contain ***
            [Find XPaths]    //*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]
            [Find Texts]    Computer System Engineering, Database Systems, Operating Systems, Programming Techniques

        *** Element Should Contain ***
            [Find XPaths]    //*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[3]
            [Find Texts]    Computation Structures

        *** Element Should Contain ***
            [Find XPaths]    //*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3]
            [Find Texts]    Operating Systems, Programming in Java, Software Engineering, Software Quality Assurance

    [Checks]            Check Numerical Methods
        *** Text Should Be Equal ***
            [Find XPaths]    //*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[3]
            [Find Texts]    Numerical Methods