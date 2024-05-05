Here's the Robot Framework scenario based on the provided JSON recording:

*** Settings ***
Library    SeleniumLibrary    run_on_failure=Close All Browsers

*** Variables ***
${LOGIN_URL}    http://localhost:4680/tbuis/login
${BROWSER}    Chrome

*** Test Cases ***
Spec 10 Teacher
    Teacher Test

Spec 10 Student
    Student Test

*** Keywords ***
Teacher Test
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Set Window Size    1000    100
    Input Text    id=loginPage.userNameInput    strict
    Input Text    id=loginPage.passwordInput    pass
    Click Element    id=loginPage.loginFormSubmit
    Click Element    id=tea.menu.mySubjects
    Click Element    id=tea.mySubjects.table.unregisterSubjectButton-0
    Click Element    id=tea.menu.myExamDates
    Click Element    id=tea.menu.newExamDates
    Click Element    id=tea.menu.setEvaluation
    Click Element    id=tea.menu.evaluationTable
    Click Element    id=tea.menu.otherSubjects
    Click Element    id=tea.menu.listOfAllTeachers
    [Teardown]    Close Browser

Student Test
    [Teardown]    Close Browser
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Set Window Size    100    100
    Input Text    id=loginPage.userNameInput    orange
    Input Text    id=loginPage.passwordInput    pass
    Click Element    id=loginPage.loginFormSubmit
    Click Element    id=stu.menu.otherSubjects
    [Teardown]    Close Browser

Check Elements Present
    [Arguments]    ${locator}    ${value}
    ${element}    Get Element Count    ${locator}
    Should Be True    ${element} > 0    Element not found
    ${element_value}    Get Text    ${locator}
    Should Not Be Equal    ${element_value}    ${value}    Element found with value ${value}

Check Element Not Present
    [Arguments]    ${locator}    ${value}
    ${element}    Get Element Count    ${locator}
    Should Be True    ${element} == 0    Element found

Check Element Not Present Containing
    [Arguments]    ${locator}    ${value}
    ${element}    Get Element Count    ${locator}
    Should Be True    ${element} == 0    Element found
    ${element_value}    Get Text    ${locator}
    Should Not Contain    ${element_value}    ${value}    Element found with value containing ${value}

Teacher Test
    Teacher Test
    Sleep    1s
    ${remove_buttons}    Get Element Count    xpath://*[@value="Remove"]
    ${remove_buttons_enabled}    Get Element Count    xpath://*[@value="Remove"][@disabled]
    Should Be Equal    ${remove_buttons}    ${remove_buttons_enabled}    All Remove buttons are disabled
    ${success_alert}    Get Element Count    id=tea.mySubjects.successAlert
    Should Be True    ${success_alert} > 0    Success alert not found
    Check Element Not Present    xpath=//th[.="Operating Systems"]
    Check Element Not Present    xpath=//option[.="Operating Systems"]
    Check Element Not Present    xpath=//option[contains(., "Operating Systems")]
    Check Element Not Present    xpath=//option[contains(., "Operating Systems")]
    Check Element Not Present    xpath=//td[.="Operating Systems"]
    Check Element Not Present Containing    xpath=//*[contains(., "Operating Systems")]    Other's Subjects
    Check Element Not Present Containing    xpath=//tr[@id="tea.listOfAllTeachers.table.teacherRow-5"]    Operating Systems

Student Test
    Student Test
    Check Element Not Present Containing    xpath=//tr//td[.="Peter Strict"]    Operating Systems

    ${tr_5_tds}    Get Elements    xpath=//tr[@id="tea.listOfAllTeachers.table.teacherRow-5"]//td
    ${os_td}    Get Element Count    ${tr_5_tds}[contains(., "Operating Systems")]
    Should Be True    ${os_td} == 0    Operating Systems found in Teacher's table row 5 