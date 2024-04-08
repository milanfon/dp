*** Settings ***
Library    SeleniumLibrary    run_on_failure=Close All Browsers

*** Variables ***
${LOGIN_URL}    http://localhost:4680/tbuis/index.jsp
${BROWSER}    Chrome
${URL}    http://localhost:4680/tbuis/
${USER_NAME}    strict
${PASSWORD}    pass
${USER_NAME_STUDENT}    orange
${PASSWORD_STUDENT}    pass

*** Test Cases ***
Teacher View
    Open Browser    ${URL}    ${BROWSER}
    Input Text    id:loginPage.userNameInput    ${USER_NAME}
    Input Text    id:loginPage.passwordInput    ${PASSWORD}
    Click Button    id:loginPage.loginFormSubmit
    Click Link    aria:My Subjects
    Click Button    id:tea.mySubjects.table.unregisterSubjectButton-0
    Click Link    aria:My Exam Dates
    Click Link    aria:New Exam Dates
    Click Link    aria:Set Evaluation
    Click Link    aria:Evaluation Table
    Click Link    aria:Others' Subjects
    Click Link    aria:List of All Teachers
    Teacher Subjects Check
    Teacher Exam Dates Check
    Teacher New Exam Dates Check
    Teacher Set Evaluation Check
    Teacher Evaluation Table Check
    Teacher Others Subjects Check
    Teacher Others Teachers Check
    Close All Browsers

Student View
    Open Browser    ${URL}    ${BROWSER}
    Input Text    id:loginPage.userNameInput    ${USER_NAME_STUDENT}
    Input Text    id:loginPage.passwordInput    ${PASSWORD_STUDENT}
    Click Button    id:loginPage.loginFormSubmit
    Click Link    aria:Other Subjects
    Student Subjects Check
    Close All Browsers

*** Keywords ***
Teacher Subjects Check
    Click Button    aria:Remove
    ${elements} =    Get Webelements    xpath://button[@value='Remove']
    ${disabled} =    Get Webelements    xpath://button[@value='Remove' and @disabled='disabled']
    ${length} =    Get Length    ${elements}
    ${disabled_length} =    Get Length    ${disabled}
    Should Be Equal    ${length}    ${disabled_length}
    Wait Until Element Is Visible    id:tea.mySubjects.successAlert
    Element Should Be Visible    id:tea.mySubjects.successAlert

Teacher Exam Dates Check
    Element Should Not Be Visible    xpath://th[.='Operating Systems']

Teacher New Exam Dates Check
    Element Should Not Be Visible    xpath://option[.='Operating Systems']

Teacher Set Evaluation Check
    Element Should Not Be Visible    xpath://option[.='Operating Systems']

Teacher Evaluation Table Check
    Element Should Not Be Visible    xpath://option[.='Operating Systems']

Teacher Others Subjects Check
    Element Should Be Visible    xpath://td[.='Operating Systems']

Teacher Others Teachers Check
    Element Should Not Be Visible    xpath://td[.='Operating Systems']    xpath://tr[@id='tea.listOfAllTeachers.table.teacherRow-5']

Student Subjects Check
    Element Should Not Be Visible    xpath://td[.='Operating Systems']
    Element Should Be Visible    xpath://td[.='Peter Strict']    xpath://td[.='Operating Systems']
    Element Should Not Be Visible    xpath://td[.='Peter Strict']    xpath://td[.='Operating Systems']