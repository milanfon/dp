*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}    http://localhost:4680/tbuis/index.jsp
${BROWSER}    Chrome
${DELAY}    ${5}
${BROWSER_DELAY}    ${0}
${EXAM_DATE_TITLE}    xpath://*[@id="stu.myExamDates.participantsModal.title"]
${STUDENT_NAME_1}    xpath://td[.="Benjamin Green"]
${STUDENT_NAME_2}    xpath://td[.="Mia Orange"]
${STUDENT_NAME_3}    xpath://td[.="Charlotte Purple"]
${STUDENT_NAME_4}    xpath://td[.="Isabella Yellow"]


*** Test Cases ***
Check Exam Dates Page
    Open Browser    ${URL}    ${BROWSER}
    Set Selenium Speed    ${BROWSER_DELAY}
    Sleep    ${DELAY}
    Input Text    id:loginPage.userNameInput    orange
    Sleep    ${DELAY}
    Input Text    id:loginPage.passwordInput    pass
    Sleep    ${DELAY}
    Click Element    id:loginPage.loginFormSubmit
    Sleep    ${DELAY}
    Click Element    id:stu.menu.myExamDates
    Sleep    ${DELAY}
    Click Element    id:stu.myExamDates.table.ParticipantsButton-1
    Sleep    ${DELAY}
    Wait Until Element Is Visible    ${EXAM_DATE_TITLE}    ${DELAY}
    Element Should Be Visible    ${EXAM_DATE_TITLE}
    Sleep    ${DELAY}
    Element Should Be Visible    ${STUDENT_NAME_1}
    Sleep    ${DELAY}
    Element Should Be Visible    ${STUDENT_NAME_2}
    Sleep    ${DELAY}
    Element Should Be Visible    ${STUDENT_NAME_3}
    Sleep    ${DELAY}
    Element Should Be Visible    ${STUDENT_NAME_4}
    Sleep    ${DELAY}
    Close Browser