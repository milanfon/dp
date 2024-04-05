*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${DELAY}     0
${URL}    http://localhost:4680

*** Test Cases ***
Test Teacher
    [Setup]    Open Browser    ${URL}/index.jsp    ${BROWSER}
    # Teacher steps
    [Teardown]    Close Browser

Test Student
    [Setup]    Open Browser    ${URL}/index.jsp    ${BROWSER}
    # Student steps
    [Teardown]    Close Browser

*** Keywords ***
Open Browser
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    ${browser}
    Set Selenium Speed    ${DELAY}

Click Element
    [Arguments]    ${locator}
    Click Element    ${locator}

Input Text
    [Arguments]    ${locator}    ${text}
    Input Text    ${locator}    ${text}

Verify Element Not Present
    [Arguments]    ${locator}
    Page Should Not Contain Element    ${locator}

Verify Element Present
    [Arguments]    ${locator}
    Page Should Contain Element    ${locator}

Verify Element Enabled
    [Arguments]    ${locator}
    Element Should Be Enabled    ${locator}

Verify Element Disabled
    [Arguments]    ${locator}
    Element Should Be Disabled    ${locator}

Verify Element Appear
    [Arguments]    ${locator}
    Element Should Be Visible    ${locator}

Verify Element Text
    [Arguments]    ${locator}    ${text}
    Element Text Should Be    ${locator}    ${text}

Verify Element Contains Text
    [Arguments]    ${locator}    ${text}
    Element Should Contain    ${locator}    ${text}

Verify Elements Enabled
    [Arguments]    ${locator}    ${text}
    @{elements}=    Get Webelements    ${locator}
    :FOR    ${element}    IN    @{elements}
    \    Element Attribute Value Should Be    ${element}    value    ${text}
    \    Element Should Be Disabled    ${element}

Teacher Steps
    Click Element    aria/Login
    Click Element    aria/Username
    Input Text    aria/Username    strict
    Click Element    aria/Password
    Input Text    aria/Password    pass
    Click Element    aria/Login[role="button"]
    Click Element    aria/My Subjects
    Click Element    #tea\\.mySubjects\\.table\\.unregisterSubjectButton-0
    Click Element    aria/My Exam Dates
    Click Element    aria/New Exam Dates
    Click Element    aria/Set Evaluation
    Click Element    aria/Evaluation Table
    Click Element    aria/Others' Subjects
    Click Element    aria/List of All Teachers
    Element Should Be Visible    id=tea.mySubjects.successAlert
    Verify Elements Enabled    #tea.mySubjects.table.unregisterSubjectButton    Remove
    Verify Element Not Present    xpath=//th[.='Operating Systems']
    Verify Element Not Present    xpath=//option[.='Operating Systems']
    Verify Element Not Present    xpath=//option[contains(.,'Operating Systems')]
    Verify Element Present    xpath=//td[.='Operating Systems']
    Verify Element Not Present    xpath=//tr[@id='tea.listOfAllTeachers.table.teacherRow-5']//td[contains(.,'Operating Systems')]

Student Steps
    Click Element    aria/Login
    Click Element    aria/Username
    Input Text    aria/Username    orange
    Click Element    aria/Password
    Input Text    aria/Password    pass
    Click Element    aria/Login[role="button"]
    Click Element    aria/Other Subjects
    Verify Element Not Present    xpath=//tr[contains(.,'Operating Systems')]//td[contains(.,'Peter Strict')]