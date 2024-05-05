*** Settings ***
Library            SeleniumLibrary
Browser            Chrome

*** Variables ***
${URL}             http://localhost:4680/tbuis/index.jsp
${USER}            lazy
${PASS}            pass

*** Test Case ***
Verify Teacher List
    [Documentation]     Test case to verify the presence of certain names and text in the Teacher List

    Set Viewport
        width            1501
        height           1104
        deviceScaleFactor 1
        isMobile          False
        hasTouch          False
        isLandscape       False

    Navigate To
        URL                ${URL}
        Title              Universitatskomplett System

    Click Element
        Target Element     xpath//*[@id="header.link.login"]
        Offset X           44.671875
        Offset Y           27

    Input Text
        Target Element     xpath//*[@id="loginPage.userNameInput"]
        Input             ${USER}

    Click Element
        Target Element     xpath//*[@id="loginPage.passwordInput"]

    Input Text
        Target Element     xpath//*[@id="loginPage.passwordInput"]
        Input             ${PASS}

    Click Element
        Target Element     xpath//*[@id="loginPage.loginFormSubmit"]

    Sleep            2s

    Click Element
        Target Element     xpath//*[@id="tea.menu.listOfAllTeachers"]
        Offset X           137.5
        Offset Y           17

    Sleep            2s

    ${teachers_list}     Get Elements    xpath//*[@id="tea.listOfAllTeachers.table"]//tr

    *** For *** ${teacher}    **In**    ${teachers_list}
        *** Variables ***
        ${teacher_name}   Get Text      xpath=(//td[2])[${index}]
        ${teacher_subject} Get Text      xpath=(//td[3])[${index}]

        *** Test ***
        [Documentation]         Test to check if the teacher name is present in the list
        Should Contain      ${teacher_name}        [Regex]      (Julia Easyrider|Olivia Keen|John Lazy|Alice Pedant|Thomas Scatterbrained|Peter Strict)

        [Documentation]         Test to check if the teacher subject matches the expected value
        Should Contain      ${teacher_subject}      Numerical Methods
        Or Should Contain      ${teacher_subject}      Database Systems, Fundamentals of Computer Networks, Introduction to Algorithms, Mobile Applications, Web Programming
        Or Should Contain      ${teacher_subject}      Computer System Engineering, Database Systems, Operating Systems, Programming Techniques
        Or Should Contain      ${teacher_subject}      Computation Structures
        Or Should Contain      ${teacher_subject}      Operating Systems, Programming in Java, Software Engineering, Software Quality Assurance

        Should Not Contain      ${teacher_subject}      ''
        Sleep            1s

        ${next_teacher}      Get Element      xpath=(//td[1])[${index}+1]/following-sibling::td[1]/following-sibling::td[1]/following-sibling::td[1]/a
        ${next_teacher_name} Get Text        xpath=(//td[2])[${index}+1]

        *** Wait Until *** Element Is Visible
        ${next_teacher}

        *** Log ***      Checking next teacher: ${next_teacher_name}

    *** End For ***

    *** Teardown ***
    Close Browser