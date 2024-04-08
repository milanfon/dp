*** Settings ***
Library         SeleniumLibrary


*** Variables ***
${BROWSER}         Chrome
${DELAY}         ${0}
${URL}         http://localhost:4680/tbuis/index.jsp
${BUTTON_CLOSE}         id:closeModalButtonCross
${BUTTON_4}         id:tea.mySubjects.table.listOfStudentsButton-2
${NAME_GREEN}         xpath://*[@id="tea.mySubjects.table.listOfStudents-0-0-0"]
${NAME_ORANGE}         xpath://*[@id="tea.mySubjects.table.listOfStudents-0-1-0"]
${NAME_PURPLE}         xpath://*[@id="tea.mySubjects.table.listOfStudents-0-2-0"]
${NAME_YELLOW}         xpath://*[@id="tea.mySubjects.table.listOfStudents-0-3-0"]


*** Keywords ***
Delay
    [Arguments]         ${seconds}
    Sleep             ${seconds}

*** Test Cases ***
Login and check students
    [Teardown]         Close Browser
    Open Browser    ${URL}    ${BROWSER}
    Delay    ${DELAY}
    Input Text    id:loginPage.userNameInput    pedant
    Delay    ${DELAY}
    Input Text    id:loginPage.passwordInput    pass
    Delay    ${DELAY}
    Click Button    id:loginPage.loginFormSubmit
    Delay    ${DELAY}
    Click Link    aria:My Subjects
    Delay    ${DELAY}
    Click Button    id:tea.mySubjects.table.listOfStudentsButton-0
    Delay    ${DELAY}
    Click Button    ${BUTTON_CLOSE}
    Delay    ${DELAY}
    Click Button    ${BUTTON_4}
    Delay    ${DELAY}
    Page Should Contain Element    ${NAME_GREEN}
    Page Should Contain Element    ${NAME_ORANGE}
    Page Should Contain Element    ${NAME_PURPLE}
    Page Should Contain Element    ${NAME_YELLOW}

    Page Should Contain    No students

*** Keywords ***