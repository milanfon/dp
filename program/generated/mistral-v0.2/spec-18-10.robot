*** Settings ***
Library          SeleniumLibrary
Browser          Chrome

*** Variables ***
${URL}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Check Teacher List
    [Documentation]          Check presence of specific names and text in the teacher list

    [Preparation]            Set Viewport
        *** Set Viewport ***
        width                1501
        height               1104
        deviceScaleFactor     1
        isMobile              false
        hasTouch              false
        isLandscape           false

    [Teardown]               Close Browser

    [Step]                    Navigate to URL
        *** Navigate ***
        URL                  ${URL}
        Title                University information system

    [Step]                    Login
        *** Click Element ***
        Target               //*[@id="header.link.login"]
        offset_x              44.671875
        offset_y              27

        *** Input Text ***
        Target               //*[@id="loginPage.userNameInput"]
        Text                lazy

        *** Click Element ***
        Target               //*[@id="loginPage.passwordInput"]

        *** Input Text ***
        Target               //*[@id="loginPage.passwordInput"]
        Text                pass

        *** Click Element ***
        Target               //*[@id="loginPage.loginFormSubmit"]
        offset_x              52.5
        offset_y              26

    [Step]                    Click on List of All Teachers
        *** Click Element ***
        Target               //*[@id="tea.menu.listOfAllTeachers"]
        offset_x              137.5
        offset_y              17

    [Step]                    Check Teacher Names
        *** Wait ***
        Seconds              3

        *** Assert Key ***
        Key                  Teacher Names
        Element              //*[@id="tea.listOfAllTeachers.table.teacherRow-*"]/td[1]
        Timeout              30

        *** Should Contain ***
        Element              //*[@id="tea.listOfAllTeachers.table.teacherRow-*"]/td[1]
        Text                 [|        Julia Easyrider        |]
        Regexp               Yes

        *** Should Contain ***
        Element              //*[@id="tea.listOfAllTeachers.table.teacherRow-*"]/td[1]
        Text                 [|        Olivia Keen           |]
        Regexp               Yes

        *** Should Contain ***
        Element              //*[@id="tea.listOfAllTeachers.table.teacherRow-*"]/td[1]
        Text                 [|        John Lazy             |]
        Regexp               Yes

        *** Should Contain ***
        Element              //*[@id="tea.listOfAllTeachers.table.teacherRow-*"]/td[1]
        Text                 [|        Alice Pedant          |]
        Regexp               Yes

        *** Should Contain ***
        Element              //*[@id="tea.listOfAllTeachers.table.teacherRow-*"]/td[1]
        Text                 [|        Thomas Scatterbrained|]
        Regexp               Yes

        *** Should Contain ***
        Element              //*[@id="tea.listOfAllTeachers.table.teacherRow-*"]/td[1]
        Text                 [|        Peter Strict          |]
        Regexp               Yes

    [Step]                    Check Subjects
        *** Wait ***
        Seconds              3

        *** Assert Text ***
        Element              //*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[3]
        Text                 Numerical Methods

        *** Assert Text ***
        Element              //*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3]
        Text                 Database Systems, Fundamentals of Computer Networks, Introduction to Algorithms, Mobile Applications, Web Programming

        *** Should Not ***
        Element               //*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[3]
        Text                 Contains Text

        *** Assert Text ***
        Element               //*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]
        Text                 Computer System Engineering, Database Systems, Operating Systems, Programming Techniques

        *** Assert Text ***
        Element               //*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[3]
        Text                 Computation Structures

        *** Assert Text ***
        Element               //*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3]
        Text                 Operating Systems, Programming in Java, Software Engineering, Software Quality Assurance