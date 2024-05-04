*** Settings ***
Library  Selenium2Library


*** Variables ***
${BROWSER}  Chrome
${DELAY}  2s
${URL}  http://localhost:4680/tbuis/index.jsp
${BEN_NAME}  Benjamin Green
${MIA_NAME}  Mia Orange
${CHAR_NAME}  Charlotte Purple
${ISA_NAME}  Isabella Yellow

*** Test Cases ***
Test
    Open Browser  ${URL}  ${BROWSER}
    Sleep  ${DELAY}
    Click Element  xpath=//*[@id="header.link.login"]
    Sleep  ${DELAY}
    Input Text  xpath=//*[@id="loginPage.userNameInput"]  pedant
    Sleep  ${DELAY}
    Input Text  xpath=//*[@id="loginPage.passwordInput"]  pass
    Sleep  ${DELAY}
    Click Element  xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep  ${DELAY}
    Click Element  xpath=//*[@id="tea.menu.mySubjects"]
    Sleep  ${DELAY}
    Click Element  xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    Sleep  ${DELAY}
    Click Element  xpath=//*[@id="closeModalButtonCross"]
    Sleep  ${DELAY}
    Click Element  xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
    Sleep  ${DELAY}
    ${ben_name_present}  Run Keyword And Return Status  Element Should Contain  xpath=//*[@id="tea.mySubjects.table"]  ${BEN_NAME}
    ${mia_name_present}  Run Keyword And Return Status  Element Should Contain  xpath=//*[@id="tea.mySubjects.table"]  ${MIA_NAME}
    ${char_name_present}  Run Keyword And Return Status  Element Should Contain  xpath=//*[@id="tea.mySubjects.table"]  ${CHAR_NAME}
    ${isa_name_present}  Run Keyword And Return Status  Element Should Contain  xpath=//*[@id="tea.mySubjects.table"]  ${ISA_NAME}
    Run Keyword If  ${ben_name_present}  Log  ${BEN_NAME} is present
    Run Keyword If  ${mia_name_present}  Log  ${MIA_NAME} is present
    Run Keyword If  ${char_name_present}  Log  ${CHAR_NAME} is present
    Run Keyword If  ${isa_name_present}  Log  ${ISA_NAME} is present
    Close Browser