*** Settings ***
Library           SeleniumLibrary
Test Teardown     Close Browser

*** Variables ***
${URL}            http://localhost:4680/tbuis/index.jsp
${LOGIN_URL}      http://localhost:4680/tbuis/login
${DELAY}          2s

*** Test Cases ***
University System Navigation and Verification
    [Setup]    Open Browser    ${URL}    Chrome
    Set Window Size    1501    1104
    Go To    ${URL}
    Login As Teacher
    Navigate And Verify Teacher Pages
    Close Browser
    Login As Student
    Navigate And Verify Student Page

*** Keywords ***
Open Browser And Login
    [Arguments]    ${username}    ${password}
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    ${DELAY}
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${username}
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${password}
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}

Login As Teacher
    Open Browser    ${LOGIN_URL}    Chrome
    Set Window Size    1501    1104
    Open Browser And Login    strict    pass

Navigate And Verify Teacher Pages
    # My Subjects - Before Click
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Sleep    ${DELAY}
    ${is_disabled}=    Run Keyword And Return Status    Element Should Be Disabled    xpath=//button[@value="Remove"]
    Should Be True    ${is_disabled}
    # Click Remove and Verify Success Alert
    Click Element    xpath=//*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Sleep    ${DELAY}
    Element Should Be Visible    xpath=//*[@id="tea.mySubjects.successAlert"]
    # My Exam Dates - Check Absence
    Page Should Not Contain Element    xpath=//th[contains(text(), "Operating Systems")]
    # New Exam Dates - Check Absence
    Page Should Not Contain Element    xpath=//option[contains(text(), "Operating Systems")]
    # Set Evaluation - Check Absence
    Page Should Not Contain Element    xpath=//option[contains(text(), "Operating Systems")]
    # Evaluation Table - Check Absence
    Page Should Not Contain Element    xpath=//option[contains(text(), "Operating Systems")]
    # Other's Subjects - Check Presence
    Page Should Contain Element    xpath=//td[contains(text(), "Operating Systems")]
    # List of All Teachers - Check Absence in Specific Row
    Element Should Not Contain    xpath=//tr[@id="tea.listOfAllTeachers.table.teacherRow-5"]    Operating Systems

Login As Student
    Open Browser    ${LOGIN_URL}    Chrome
    Set Window Size    1501    1104
    Open Browser And Login    orange    pass

Navigate And Verify Student Page
    # Other Subjects - Check Absence of "Peter Strict" alongside "Operating Systems"
    Page Should Not Contain Element    xpath=//tr[contains(., 'Operating Systems') and contains(., 'Peter Strict')]
