*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${URL}          http://localhost:4680/tbuis/index.jsp
${BROWSER}      Chrome
${DELAY}        0.5s

*** Test Cases ***
Verify Names
    Open Browser    ${URL}    ${BROWSER}
    # Open login page
    Click Element    xpath=//*[@id="header.link.login"]
    # Login
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    pedant
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    # Open student list
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
    # Close modal
    Click Element    xpath=//*[@id="closeModalButtonCross"]
    # Verify names
    Element Should Contain    xpath=//*[@id="tea.mySubjects.table.listOfStudents-2"]    Benjamin Green
    Element Should Contain    xpath=//*[@id="tea.mySubjects.table.listOfStudents-2"]    Mia Orange
    Element Should Contain    xpath=//*[@id="tea.mySubjects.table.listOfStudents-2"]    Charlotte Purple
    Element Should Contain    xpath=//*[@id="tea.mySubjects.table.listOfStudents-2"]    Isabella Yellow
    Close Browser   

    # Add delay after each step
    # This is optional, but it helps to make sure that the page is loaded correctly
    # You can adjust the delay to fit the speed of the page
    Sleep    ${DELAY}
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    ${DELAY}
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    pedant
    Sleep    ${DELAY}
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    Sleep    ${DELAY}
    Click Element    xpath=//*[@id="closeModalButtonCross"]
    Sleep    ${DELAY}
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
    Sleep    ${DELAY}
    Element Should Contain    xpath=//*[@id="tea.mySubjects.table.listOfStudents-2"]    Benjamin Green
    Sleep    ${DELAY}
    Element Should Contain    xpath=//*[@id="tea.mySubjects.table.listOfStudents-2"]    Mia Orange
    Sleep    ${DELAY}
    Element Should Contain    xpath=//*[@id="tea.mySubjects.table.listOfStudents-2"]    Charlotte Purple
    Sleep    ${DELAY}
    Element Should Contain    xpath=//*[@id="tea.mySubjects.table.listOfStudents-2"]    Isabella Yellow
    Sleep    ${DELAY}
    Close Browser   

    # Close browser between scenarios
    Close Browser   