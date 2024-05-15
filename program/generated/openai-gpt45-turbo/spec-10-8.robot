*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
University Information System Teacher Workflow
    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
    Set Window Size    1501    1104
    Sleep    2s
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    strict
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.passwordInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    3s
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Sleep    3s
    ${is_disabled}    Evaluate    len($driver.find_elements(By.XPATH, "//input[@value='Remove'][@disabled='disabled']")) > 0
    Run Keyword If    '${is_disabled}' == 'False'    Click Element    xpath=//*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Sleep    2s
    Element Should Be Visible    xpath=//*[@id="tea.mySubjects.successAlert"]
    Sleep    2s
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Sleep    2s
    Page Should Not Contain Element    xpath=//th[text()='Operating Systems']
    Sleep    2s
    Click Element    xpath=//*[@id="tea.menu.newExamDates"]
    Sleep    2s
    Page Should Not Contain Element    xpath=//option[text()='Operating Systems']
    Sleep    2s
    Click Element    xpath=//*[@id="tea.menu.setEvaluation"]
    Sleep    2s
    Page Should Not Contain Element    xpath=//option[contains(text(),'Operating Systems')]
    Sleep    2s
    Click Element    xpath=//*[@id="tea.menu.evaluationTable"]
    Sleep    2s
    Page Should Not Contain Element    xpath=//option[text()='Operating Systems']
    Sleep    2s
    Click Element    xpath=//*[@id="tea.menu.otherSubjects"]
    Sleep    2s
    Page Should Contain Element    xpath=//td[text()='Operating Systems']
    Sleep    2s
    Click Element    xpath=//*[@id="tea.menu.listOfAllTeachers"]
    Sleep    2s
    Page Should Not Contain Element    xpath=//tr[@id='tea.listOfAllTeachers.table.teacherRow-5']//td[contains(text(),'Operating Systems')]
    Sleep    2s
    Close Browser

University Information System Student Workflow
    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
    Set Window Size    1501    1104
    Sleep    2s
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    orange
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.passwordInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    3s
    Click Element    xpath=//*[@id="stu.menu.otherSubjects"]
    Sleep    3s
    ${row}    Get Webelement    xpath=//td[text()='Operating Systems']/ancestor::tr
    Element Should Not Contain    ${row}    Peter Strict
    Sleep    2s
    Close Browser