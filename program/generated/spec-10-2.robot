*** Settings ***
Documentation     Verifications and Interactions Across Various Pages for a Teacher
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${DELAY}          2s

*** Test Cases ***
Verify Interactions and Elements on Teacher's Pages
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Set Window Size    1501    1104
    Sleep    ${DELAY}
    
    # Login
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    ${DELAY}
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    strict
    Sleep    ${DELAY}
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}
    
    # My Subjects - Before clicking "Remove"
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Sleep    ${DELAY}
    ${buttons}=    Get Webelements    xpath=//button[contains(text(),'Remove') and not(@disabled)]
    Should Be Equal As Integers    ${buttons.length}    1
    Click Element    xpath=//*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Sleep    ${DELAY}
    Element Should Be Visible    xpath=//*[@id="tea.mySubjects.successAlert"]
    
    # My Exam Dates - Operating Systems not present
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Sleep    ${DELAY}
    Page Should Not Contain Element    xpath=//th[contains(text(),'Operating Systems')]
    
    # New Exam Dates - Operating Systems not present in options
    Click Element    xpath=//*[@id="tea.menu.newExamDates"]
    Sleep    ${DELAY}
    Page Should Not Contain Element    xpath=//option[contains(text(),'Operating Systems')]
    
    # Set Evaluation - Operating Systems not present in options
    Click Element    xpath=//*[@id="tea.menu.setEvaluation"]
    Sleep    ${DELAY}
    Page Should Not Contain Element    xpath=//option[contains(.,'Operating Systems')]
    
    # Evaluation Table - Operating Systems not present in options
    Click Element    xpath=//*[@id="tea.menu.evaluationTable"]
    Sleep    ${DELAY}
    Page Should Not Contain Element    xpath=//option[contains(text(),'Operating Systems')]
    
    # Other's Subjects - Operating Systems present in td
    Click Element    xpath=//*[@id="tea.menu.otherSubjects"]
    Sleep    ${DELAY}
    Page Should Contain Element    xpath=//td[contains(text(),'Operating Systems')]
    
    # List of All Teachers - Operating Systems not present under specific teacher row
    Click Element    xpath=//*[@id="tea.menu.listOfAllTeachers"]
    Sleep    ${DELAY}
    Page Should Not Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-5"]//td[contains(text(),'Operating Systems')]
    
    Close Browser
