*** Settings ***
Library    SeleniumLibrary
Test Setup    Open Browser    ${url}    Chrome
Test Teardown    Close Browser
Resource    ../resources/common_functions.robot


*** Variables ***
${url}    http://localhost:4680/tbuis/index.jsp
${teacher_username}    strict
${teacher_password}    pass
${student_username}    orange
${student_password}    pass


*** Test Cases ***
Test Teacher View
    Login as teacher
    Go to My Subjects page
    Wait Until Element Is Visible    xpath=//*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    ${button_list}=    Get WebElements    xpath=//input[@value="Remove"]
    FOR    ${button}    IN    @{button_list}
        Run Keyword If    '${button}' != '${button_list}[0]'    Element Should Be Disabled    ${button}
    END
    Click Element    xpath=//*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Wait Until Element Is Visible    xpath=//*[@id="tea.mySubjects.successAlert"]
    Go to My Exam Dates page
    Page Should Not Contain Element    xpath=//th[text()="Operating Systems"]
    Go to New Exam Dates page
    Page Should Not Contain Element    xpath=//option[text()="Operating Systems"]
    Go to Set Evaluation page
    Page Should Not Contain Element    xpath=//option[contains(text(), "Operating Systems")]
    Go to Evaluation Table page
    Page Should Not Contain Element    xpath=//option[text()="Operating Systems"]
    Go to Other's Subjects page
    Page Should Contain Element    xpath=//td[text()="Operating Systems"]
    Go to List of All Teachers page
    Page Should Not Contain Element    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-5"]//td[contains(text(),"Operating Systems")]
    
Test Student View
    Login as student
    Go to Other Subjects page
    Page Should Not Contain Element    xpath=//tr[./td[contains(text(),"Operating Systems")] and ./td[contains(text(),"Peter Strict")]]


*** Keywords ***
Login as teacher
    Sleep    1s
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${teacher_username}
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${teacher_password}
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    1s
    
Login as student
    Sleep    1s
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${student_username}
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${student_password}
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    1s
    
Go to My Subjects page
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Sleep    1s
    
Go to My Exam Dates page
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Sleep    1s
    
Go to New Exam Dates page
    Click Element    xpath=//*[@id="tea.menu.newExamDates"]
    Sleep    1s
    
Go to Set Evaluation page
    Click Element    xpath=//*[@id="tea.menu.setEvaluation"]
    Sleep    1s
    
Go to Evaluation Table page
    Click Element    xpath=//*[@id="tea.menu.evaluationTable"]
    Sleep    1s
    
Go to Other's Subjects page
    Click Element    xpath=//*[@id="tea.menu.otherSubjects"]
    Sleep    1s
    
Go to List of All Teachers page
    Click Element    xpath=//*[@id="tea.menu.listOfAllTeachers"]
    Sleep    1s 
    
Go to Other Subjects page
    Click Element    xpath=//*[@id="stu.menu.otherSubjects"]
    Sleep    1s 
