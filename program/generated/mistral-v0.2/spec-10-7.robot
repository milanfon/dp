*** Settings ***
Library           SeleniumLibrary
Browser           Chrome

*** Variables ***
URL               http://localhost:4680/tbuis/index.jsp

*** Test Cases ***

Test Case My Subjects Removal
    [Documentation]      Test case for My Subjects removal

    [Preparation]
    Set Viewport         width=1501    height=1104    deviceScaleFactor=1    isMobile=False    hasTouch=False    isLandscape=False
    Navigate To          ${URL}
    Login               user=strict    password=pass

    [Steps]
    ${isRemoveButtonsDisabled} =    Get Element      id=tea.mySubjects.table.unregisterSubjectButton-0      xpath=id(tea.mySubjects.table.unregisterSubjectButton-0)
    Should Be True      ${isRemoveButtonsDisabled.enabled}

    Click Element      id=tea.mySubjects.table.unregisterSubjectButton-0

    Should Contain      id=tea.mySubjects.successAlert      text=Successfully removed

    Go To Page         My Exam Dates
    Should Not Contain Page Source      th=Operating Systems

    Go To Page         New Exam Dates
    Should Not Contain Page Source      option=Operating Systems

    Go To Page         Set Evaluation
    Should Not Contain Page Source      option=*Operating Systems*

    Go To Page         Evaluation Table
    Should Not Contain Page Source      option=Operating Systems

    Go To Page         Other's Subjects
    Should Contain Page Source      td=Operating Systems

    Go To Page         List of All Teachers
    Should Not Contain Page Source      tr=id:tea.listOfAllTeachers.table.teacherRow-5:contains=Operating Systems

    Log Out

Test Case Student View
    [Documentation]      Test case for Student View

    [Preparation]
    Set Viewport         width=1501    height=1104    deviceScaleFactor=1    isMobile=False    hasTouch=False    isLandscape=False
    Navigate To          ${URL}
    Login               user=orange    password=pass

    [Steps]
    Go To Page         Other Subjects
    Should Not Contain Page Source      tr=text=Operating Systems and text=Peter Strict

    Log Out

*** Keywords ***
Login
    [Arguments]    user    password
    [Documentation]      Logs user in to the application

    [Scripts]
    Open Browser    ${BROWSER}    ${URL}
    Input Text      id=loginPage.userNameInput    ${user}
    Input Text      id=loginPage.passwordInput    ${password}
    Click Button    id=loginPage.loginFormSubmit
    Sleep            2s

    [Return]

Log Out
    [Documentation]      Logs user out of the application

    [Scripts]
    Click Button    id=header.link.logout
    Sleep            2s
    Close Browser

[Remember to replace BROWSER with the desired browser name.]