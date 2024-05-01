*** Settings ***
Library        SeleniumLibrary
Browser        Chrome

*** Variables ***
URL            http://localhost:4680/tbuis/index.jsp

*** Test Case ***
Spec 11
    [Documentation]        Open the specified URL and perform the actions in the JSON recording

    Set Viewport            width=1501    height=1104    deviceScaleFactor=1    isMobile=False    hasTouch=False    isLandscape=False
    Go To URL              ${URL}

    ${wait}            Set Variable            ${wait}=    Create SeleniumWebElement    xpath=//*[@id="header.link.login"]
    Click Element            ${wait}

    ${loginInput}            Set Variable            ${loginInput}=    Create SeleniumWebElement    xpath=//*[@id="loginPage.userNameInput"]
    Input Text            ${loginInput}            pedant

    ${passwordInput}            Set Variable            ${passwordInput}=    Create SeleniumWebElement    xpath=//*[@id="loginPage.passwordInput"]
    Input Text            ${passwordInput}            pass

    ${loginButton}            Set Variable            ${loginButton}=    Create SeleniumWebElement    xpath=//*[@id="loginPage.loginFormSubmit"]
    Click Element            ${loginButton}

    ${mySubjectsButton}            Set Variable            ${mySubjectsButton}=    Create SeleniumWebElement    xpath=//*[@id="tea.menu.mySubjects"]
    Click Element            ${mySubjectsButton}

    ${studentsButton}            Set Variable            ${studentsButton}=    Create SeleniumWebElement    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    Click Element            ${studentsButton}

    ${modalButton}            Set Variable            ${modalButton}=    Create SeleniumWebElement    xpath=//*[@id="closeModalButtonCross"]
    Click Element            ${modalButton}

    ${studentsButton2}            Set Variable            ${studentsButton2}=    Create SeleniumWebElement    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
    Click Element            ${studentsButton2}

    ${noStudents}            Set Variable            ${noStudents}=    Create SeleniumWebElement    xpath=//*[contains(text(), "No students")]
    [Documentation]        Check if the page contains the text "No students"
    Assert Text Present        ${noStudents}

    ${closeBrowser}            Set Variable            ${closeBrowser}=    Create SeleniumWebElement    xpath=//*[@id="closeBrowser"]
    Click Element            ${closeBrowser}

    Sleep            2