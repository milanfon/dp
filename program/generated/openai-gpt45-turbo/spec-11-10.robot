*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome
${DELAY}    2 seconds

*** Test Cases ***
Open Page and Perform Actions
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Set Selenium Speed    2
    Set Window Size    1501    1104
    ${login_button}=    Set Variable    xpath=//*[@id="header.link.login"]
    Click Element    ${login_button}
    Sleep    ${DELAY}
    ${username_input}=    Set Variable    xpath=//*[@id="loginPage.userNameInput"]
    Click Element    ${username_input}
    Sleep    ${DELAY}
    Input Text    ${username_input}    pedant
    Sleep    ${DELAY}
    ${password_input}=    Set Variable    xpath=//*[@id="loginPage.passwordInput"]
    Click Element    ${password_input}
    Sleep    ${DELAY}
    Input Text    ${password_input}    pass
    Sleep    ${DELAY}
    ${submit_button}=    Set Variable    xpath=//*[@id="loginPage.loginFormSubmit"]
    Click Element    ${submit_button}
    Sleep    ${DELAY}
    ${my_subjects_button}=    Set Variable    xpath=//*[@id="tea.menu.mySubjects"]
    Click Element    ${my_subjects_button}
    Sleep    ${DELAY}
    ${students_button}=    Set Variable    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    Click Element    ${students_button}
    Sleep    ${DELAY}
    Page Should Contain    Benjamin Green
    Page Should Contain    Mia Orange
    Page Should Contain    Charlotte Purple
    Page Should Contain    Isabella Yellow
    ${close_modal_button}=    Set Variable    xpath=//*[@id="closeModalButtonCross"]
    Click Element    ${close_modal_button}
    Sleep    ${DELAY}
    ${second_students_button}=    Set Variable    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
    Click Element    ${second_students_button}
    Sleep    ${DELAY}
    Page Should Contain    No students
    Close Browser