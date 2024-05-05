*** Settings ***
Library        SeleniumLibrary
Browser        Chrome

*** Variables ***
${URL}        http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Check Teachers
    [Documentation]     Check if the names and subjects are present on the page

    [Preparation]       Open URL
    Open Browser        ${URL}

    [Actions]            Check if the names are present
    ${names}            Get Elements        xpath=//td[contains(text(), [Julia Easyrider, Olivia Keen, John Lazy, Alice Pedant, Thomas Scatterbrained, Peter Strict])]
    ${names_len}        Length            ${names}
    ${names_len}        Should Be           6

    [Actions]            Check if the subjects are correct
    ${subjects}         Get Elements        xpath=//tr[${RANDINT:6}]/td[3]
    ${subjects_len}     Length            ${subjects}
    ${subjects_list}    List To List        ${subjects}
    ${expected_subjects}    List        [Numerical Methods, Database Systems, Fundamentals of Computer Networks, Introduction to Algorithms, Mobile Applications, Web Programming]
    ${subjects_list}    Should Contain    ${expected_subjects}

    [Teardown]           Close Browser
    Close Browser

*** Test Cases ***
Check Specific Subject
    [Documentation]     Check if the subject of the first teacher is 'Numerical Methods'

    [Preparation]       Open URL
    Open Browser        ${URL}

    [Actions]            Login
    Input Text        #loginPage.userNameInput        lazy
    Input Text        #loginPage.passwordInput        pass
    Click Element      #loginPage.loginFormSubmit

    [Actions]            Go to Teachers page
    Click Element      #tea.menu.listOfAllTeachers

    [Actions]            Check if the subject is correct
    ${subject}         Get Text        xpath=//tr[1]/td[3]
    ${subject}         Should Be        Numerical Methods

    [Teardown]           Close Browser
    Close Browser

*** Test Cases ***
Check Specific Subject Absent
    [Documentation]     Check if the subject of the third teacher is empty

    [Preparation]       Open URL
    Open Browser        ${URL}

    [Actions]            Login
    Input Text        #loginPage.userNameInput        lazy
    Input Text        #loginPage.passwordInput        pass
    Click Element      #loginPage.loginFormSubmit

    [Actions]            Go to Teachers page
    Click Element      #tea.menu.listOfAllTeachers

    [Actions]            Check if the subject is empty
    ${subject}         Get Text        xpath=//tr[3]/td[3]
    ${subject}         Should Be        Empty

    [Teardown]           Close Browser
    Close Browser

*** Test Cases ***
Check Specific Subject Present
    [Documentation]     Check if the subject of the fourth teacher is 'Computer System Engineering, Database Systems, Operating Systems, Programming Techniques'

    [Preparation]       Open URL
    Open Browser        ${URL}

    [Actions]            Login
    Input Text        #loginPage.userNameInput        lazy
    Input Text        #loginPage.passwordInput        pass
    Click Element      #loginPage.loginFormSubmit

    [Actions]            Go to Teachers page
    Click Element      #tea.menu.listOfAllTeachers

    [Actions]            Check if the subject is correct
    ${subject}         Get Text        xpath=//tr[4]/td[3]
    ${subject}         Should Contain    Computer System Engineering
    ${subject}         Should Contain    Database Systems
    ${subject}         Should Contain    Operating Systems
    ${subject}         Should Contain    Programming Techniques

    [Teardown]           Close Browser
    Close Browser