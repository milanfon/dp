*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BASE_URL}  http://localhost:4680/tbuis
${STUDENT_USERNAME}  brown
${STUDENT_PASSWORD}  pass
${TEACHER_USERNAME}  lazy
${TEACHER_PASSWORD}  pass
${INVALID_USERNAME}  bla
${INVALID_PASSWORD}  bla

*** Test Cases ***
Student Login
    Open Browser  ${BASE_URL}/index.jsp  chrome
    Set Window Size  1501  1104
    Click Element  id:header.link.login
    Input Text  id:loginPage.userNameInput  ${STUDENT_USERNAME}
    Input Password  id:loginPage.passwordInput  ${STUDENT_PASSWORD}
    Click Button  id:loginPage.loginFormSubmit
    Wait Until Page Contains  Student's View
    Element Should Not Be Visible  id:header.link.login
    Element Should Contain  id:header.title.userHome  Noah Brown
    Element Should Be Visible  id:header.link.logout
    Element Should Exist  css:#header.student-view-nav
    Element Should Contain  id:stu.view.title  Student's View
    Element Should Be Visible  id:overview.personalInfoForm

Teacher Login
    Go To  ${BASE_URL}/index.jsp
    Set Window Size  1501  1104
    Click Element  id:header.link.login
    Input Text  id:loginPage.userNameInput  ${TEACHER_USERNAME}
    Input Password  id:loginPage.passwordInput  ${TEACHER_PASSWORD}
    Click Button  id:loginPage.loginFormSubmit
    Wait Until Page Contains  Teacher's View
    Element Should Not Be Visible  id:header.link.login
    Element Should Contain  id:header.title.userHome  John Lazy
    Element Should Be Visible  id:header.link.logout
    Element Should Exist  css:#header.teacher-view-nav
    Element Should Contain  id:tea.view.title  Teacher's View
    Element Should Be Visible  id:overview.personalInfoForm

Invalid Logins
    Go To  ${BASE_URL}/index.jsp
    Set Window Size  1501  1104
    Click Element  id:header.link.login
    
    # Invalid username and password
    Input Text  id:loginPage.userNameInput  ${INVALID_USERNAME}
    Input Password  id:loginPage.passwordInput  ${INVALID_PASSWORD}
    Click Button  id:loginPage.loginFormSubmit
    Element Should Be Visible  id:loginPage.errorAlert
    
    # Invalid username only
    Input Text  id:loginPage.userNameInput  ${INVALID_USERNAME}
    Input Password  id:loginPage.passwordInput  ${TEACHER_PASSWORD}
    Click Button  id:loginPage.loginFormSubmit
    Element Should Be Visible  id:loginPage.errorAlert
    
    # Invalid password only
    Input Text  id:loginPage.userNameInput  ${TEACHER_USERNAME}
    Input Password  id:loginPage.passwordInput  ${INVALID_PASSWORD}
    Click Button  id:loginPage.loginFormSubmit
    Element Should Be Visible  id:loginPage.errorAlert

*** Keywords ***
Open Browser
    [Arguments]   ${url}   ${browser}
    Open Browser   ${url}   ${browser}

Click Button
     [Arguments]   ${button_id}
     Click Button   ${button_id}

Element Should Not Be Visible 
     [Arguments]   ${element_id}
     Element Should Not Be Visible   ${element_id}

Element Should Contain 
     [Arguments]   ${element_id}   ${expected_text}
     Element Should Contain   ${element_id}   ${expected_text}

Element Should Exist 
     [Arguments]   ${css_selector}
     Element Should Exist   ${css_selector}

Element Should Be Visible 
     [Arguments]   ${element_id}
     Element Should Be Visible   ${element_id}

Wait Until Page Contains 
     [Arguments]   ${expected_text}
     Wait Until Page Contains   ${expected_text}