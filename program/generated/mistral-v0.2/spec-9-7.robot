*** Settings ***
Library        SeleniumLibrary
Browser        Chrome

*** Variables ***
${URL}        http://localhost:4680/tbuis/index.jsp

*** Test Case ***
Test Case    Test_MyExamDates
    [Documentation]    Test case to check if elements with specified id and <td> values are present

    Set Viewport    width=1501    height=1104    deviceScaleFactor=1    isMobile=False    hasTouch=False    isLandscape=False
    Go To            ${URL}

    ${title}        Get Title
    Should Be        ${title}        University information system

    Click Element    xpath=//*[@id="header.link.login"]

    Input Text    xpath=//*[@id="loginPage.userNameInput"]        orange
    Input Text    xpath=//*[@id="loginPage.passwordInput"]        pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]

    ${new_title}        Get Title
    Should Be        ${new_title}        blank

    Click Element    xpath=//*[@id="stu.menu.myExamDates"]

    ${participants_modal_title}        Get Element    xpath=//*[@id="stu.myExamDates.participantsModal.title"]
    Should Exist    ${participants_modal_title}

    ${rows}        Element Should Contain    xpath=//*[@id="stu.myExamDates.participantsTable"]//*[@role="gridrow"]
    ${rows_count}        Length        ${rows}

    ${row_1}        Element From List    ${rows}        0
    ${cell_1_1}        Element From List    ${row_1}//*[@role="gridcell"]        0
    ${cell_1_1_text}        Text        ${cell_1_1}
    Should Be        ${cell_1_1_text}        Benjamin Green

    ${row_1}        Element From List    ${rows}        1
    ${cell_1_2}        Element From List    ${row_1}//*[@role="gridcell"]        1
    ${cell_1_2_text}        Text        ${cell_1_2}
    Should Be        ${cell_1_2_text}        Mia Orange

    ${row_2}        Element From List    ${rows}        2
    ${cell_2_1}        Element From List    ${row_2}//*[@role="gridcell"]        0
    ${cell_2_1_text}        Text        ${cell_2_1}
    Should Be        ${cell_2_1_text}        Charlotte Purple

    ${row_2}        Element From List    ${rows}        1
    ${cell_2_2}        Element From List    ${row_2}//*[@role="gridcell"]        1
    ${cell_2_2_text}        Text        ${cell_2_2}
    Should Be        ${cell_2_2_text}        Isabella Yellow

    Close Browser