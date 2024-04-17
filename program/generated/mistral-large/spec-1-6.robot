*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}        http://localhost:4680/tbuis/index.jsp
${USER1}      brown
${PASS1}      pass
${USER2}      lazy
${PASS2}      pass
${INVALID_USER}    bla
${INVALID_PASS}    bla

*** Test Cases ***
Test Case 1 - Student View
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    # Steps from the JSON recording
    Click Element    xpath://*[@id="header.link.login"]
    Input Text       xpath://*[@id="loginPage.userNameInput"]    ${USER1}
    Input Text       xpath://*[@id="loginPage.passwordInput"]    ${PASS1}
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]

    # Checks after the steps
    Page Should Not Contain Element    id=header.link.login
    Page Should Contain Element    id=header.title.userHome    Noah Brown
    Page Should Contain Element    id=header.link.logout
    Page Should Contain Element    css:#header.student-view-nav
    Page Should Contain    Student's View    xpath://*[@id="stu.view.title"]
    Page Should Contain Element    id=overview.personalInfoForm

    Close Browser

Test Case 2 - Teacher View
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    # Steps from the JSON recording
    Click Element    xpath://*[@id="header.link.login"]
    Input Text       xpath://*[@id="loginPage.userNameInput"]    ${USER2}
    Input Text       xpath://*[@id="loginPage.passwordInput"]    ${PASS2}
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]

    # Checks after the steps
    Page Should Not Contain Element    id=header.link.login
    Page Should Contain Element    id=header.title.userHome    John Lazy
    Page Should Contain Element    id=header.link.logout
    Page Should Contain Element    css:#header.teacher-view-nav
    Page Should Contain    Teacher's View    xpath://*[@id="tea.view.title"]
    Page Should Contain Element    id=overview.personalInfoForm

    Close Browser

Test Case 3 - Invalid Login 1
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    # Steps from the JSON recording
    Click Element    xpath://*[@id="header.link.login"]
    Input Text       xpath://*[@id="loginPage.userNameInput"]    ${INVALID_USER}
    Input Text       xpath://*[@id="loginPage.passwordInput"]    ${INVALID_PASS}
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]

    # Checks after the steps
    Page Should Contain Element    id=loginPage.errorAlert

    Close Browser

Test Case 4 - Invalid Login 2
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    # Steps from the JSON recording
    Click Element    xpath://*[@id="header.link.login"]
    Input Text       xpath://*[@id="loginPage.userNameInput"]    ${USER2}
    Input Text       xpath://*[@id="loginPage.passwordInput"]    ${INVALID_PASS}
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]

    # Checks after the steps
    Page Should Contain Element    id=loginPage.errorAlert

    Close Browser