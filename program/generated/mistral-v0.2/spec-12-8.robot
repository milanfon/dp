*** Settings ***
Library         SeleniumLibrary
Browser         Chrome

*** Test Case ***
My Exam Dates - Teacher
    [Document]                         # Open URL
    *** Set Viewport ***
    width                            1501
    height                          1104
    deviceScaleFactor                1
    isMobile                         false
    hasTouch                         false
    isLandscape                      false

    *** Navigate ***
    URL                             http://localhost:4680/tbuis/index.jsp

    *** Click ***
    Target                         xpath//*[@id="header.link.login"]

    *** Click ***
    Target                         xpath//*[@id="loginPage.userNameInput"]

    *** Input Text ***
    #{value}                      scatterbrained

    *** Click ***
    Target                         xpath//*[@id="loginPage.passwordInput"]

    *** Input Text ***
    #{value}                      pass

    *** Click ***
    Target                         xpath//*[@id="loginPage.loginFormSubmit"]

    *** Click ***
    Target                         xpath//*[@id="tea.menu.myExamDates"]

    *** Click ***
    Target                         xpath//*[@id="tea.menu.myExamDates"]

    *** Click ***
    Target                         xpath//*[@id="tea.myExamDates.table.cancelButton-0-0"]
    *** Alert Text ***

    *** Click ***
    Target                         xpath//*[@id="tea.menu.setEvaluation"]

    *** Click ***
    Target                         xpath//*[@id="tea.menu.evaluationTable"]

    *** Click ***
    Target                         xpath//*[@id="tea.evalTable.filter.subjectSelect"]

    *** Input Text ***
    #{value}                      1202

    *** Click ***
    Target                         xpath//*[@id="tea.evalTable.filter.submitButton"]

    *** Alert Text ***
    Text                         Does not contain                        Computation Structures

    *** Close Browser ***

My Exam Dates - Student
    [Document]                         # Open URL
    *** Set Viewport ***
    width                            1501
    height                          1104
    deviceScaleFactor                1
    isMobile                         false
    hasTouch                         false
    isLandscape                      false

    *** Navigate ***
    URL                             http://localhost:4680/tbuis/index.jsp

    *** Click ***
    Target                         xpath//*[@id="header.link.login"]

    *** Click ***
    Target                         xpath//*[@id="loginPage.userNameInput"]

    *** Input Text ***
    #{value}                      orange

    *** Click ***
    Target                         xpath//*[@id="loginPage.passwordInput"]

    *** Input Text ***
    #{value}                      pass

    *** Click ***
    Target                         xpath//*[@id="loginPage.loginFormSubmit"]

    *** Click ***
    Target                         xpath//*[@id="stu.menu.myExamDates"]

    *** Text Present ***
    Text                         Does not contain                        Computation Structures

    *** Close Browser ***

*** Keyword ***
AcceptAlert
    *** Keyword ***
    Alert Text
    *** Alert Accept

*** Keyword ***
IsElementVisible
    *** Arguments ***
    {locator}
    *** Keyword ***
    Element Should Be Visible

*** Keyword ***
TextPresent
    *** Arguments ***
    {text}
    *** Keyword ***
    Should Contain
    *** Text ***
    #{text}
    *** Element ***
    ${locator}

*** Keyword ***
Delay
    *** Arguments ***
    {seconds}
    *** Keyword ***
    Sleep
    #{seconds}