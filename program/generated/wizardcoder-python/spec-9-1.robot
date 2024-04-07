## Robot Framework Scenario

*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}    http://localhost:4680/tbuis/index.jsp
${USERNAME}    orange
${PASSWORD}    pass
${BUTTON}    //*[@id="stu.myExamDates.table.ParticipantsButton-1"]
${TITLE}    //*[@id="stu.myExamDates.participantsModal.title"]
${NAME1}    //*[@id="stu.myExamDates.participantsModal.table"]//td[contains(text(), "Benjamin Green")]
${NAME2}    //*[@id="stu.myExamDates.participantsModal.table"]//td[contains(text(), "Mia Orange")]
${NAME3}    //*[@id="stu.myExamDates.participantsModal.table"]//td[contains(text(), "Charlotte Purple")]
${NAME4}    //*[@id="stu.myExamDates.participantsModal.table"]//td[contains(text(), "Isabella Yellow")]

*** Test Cases ***
Login and Open Page
    Open Browser    ${URL}    ${BROWSER}
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${USERNAME}
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${PASSWORD}
    Click Button    xpath=//*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    Click Element    ${BUTTON}
    Wait Until Element Is Visible    ${TITLE}
    Element Should Contain    ${TITLE}    Exam Participants
    Element Should Contain    ${NAME1}    Benjamin Green
    Element Should Contain    ${NAME2}    Mia Orange
    Element Should Contain    ${NAME3}    Charlotte Purple
    Element Should Contain    ${NAME4}    Isabella Yellow
    Close Browser

*** Keywords ***
    Sleep    ${delay}
    ${delay}    Evaluate    random.uniform(1.0, 3.0)    random
    Sleep    ${delay}
    ${delay}    Evaluate    random.uniform(1.0, 3.0)    random 