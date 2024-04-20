*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BASE_URL}    http://localhost:4680/tbuis

*** Test Cases ***
Student Login Scenario
    Open Browser    ${BASE_URL}/index.jsp    headlesschrome
    Set Window Size    1501    1104
    Click Element    id:header.link.login
    Input Text    id:loginPage.userNameInput    brown
    Input Password    id:loginPage.passwordInput    pass
    Click Element    id:loginPage.loginFormSubmit
    Wait Until Page Contains    Student's View
    Element Should Not Be Visible    id:header.link.login
    Element Should Contain    id:header.title.userHome    Noah Brown
    Element Should Be Visible    id:header.link.logout
    Element Should Exist    css:#header.student-view-nav
    Element Should Contain    id:stu.view.title    Student's View
    Element Should Be Visible    id:overview.personalInfoForm

Teacher Login Scenario
    Open Browser    ${BASE_URL}/index.jsp    headlesschrome
    Set Window Size    1501    1104
    Click Element    id:header.link.login
    Input Text    id:loginPage.userNameInput    lazy
    Input Password    id:loginPage.passwordInput    pass
    Click Element    id:loginPage.loginFormSubmit
    Wait Until Page Contains    Teacher's View
    Element Should Not Be Visible    id:header.link.login
    Element Should Contain    id:header.title.userHome    John Lazy
    Element Should Be Visible    id:header.link.logout
    Element Should Exist    css:#header.teacher-view-nav
    Element Should Contain    id:tea.view.title    Teacher's View
    Element Should Be Visible    id:overview.personalInfoForm

Invalid Login Scenarios
    Invalid Login With Username "bla" And Password "pass"
        Open Browser    ${BASE_URL}/index.jsp    headlesschrome
        Set Window Size    1501    1104
        Click Element    id:header.link.login
        Input Text    id:loginPage.userNameInput    bla
        Input Password    id:loginPage.passwordInput    pass
        Click Element    id:loginPage.loginFormSubmit
        Element Should Be Visible Or Present   id:loginPage.errorAlert

        Invalid Login With Username "lazy" And Password "bla"
        Open Browser   ${BASE_URL}/index.jsp   headlesschrome
        Set Window Size   1501   1104
        Click Element   id:header.link.login
        Input Text   id:loginPage.userNameInput   lazy
        Input Password   id:loginPage.passwordInput   bla
        Click Element   id:loginPage.loginFormSubmit
        Element Should Be Visible Or Present  id:loginPage.errorAlert

*** Keywords ***
Element Should Not Be Visible Or Present 
       [Arguments]     ${element_id}
       Run Keyword And Continue On Failure     Page Should Not Contain Element     ${element_id}

Element Should Exist 
       [Arguments]     ${css_selector}
       Run Keyword And Continue On Failure     Page Should Contain Css      ${css_selector}