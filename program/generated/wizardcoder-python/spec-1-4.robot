*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Open Browser
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

*** Test Cases ***
Login as Student
    ${url}    Set Variable    http://localhost:4680/tbuis/index.jsp
    ${browser}    Set Variable    chrome
    Open Browser    ${url}    ${browser}
    ${loginPage}    Set Variable    http://localhost:4680/tbuis/login
    ${studentView}    Set Variable    http://localhost:4680/tbuis/student-view/overview
    ${studentName}    Set Variable    Noah Brown
    ${teacherView}    Set Variable    http://localhost:4680/tbuis/teacher-view/overview
    ${teacherName}    Set Variable    John Lazy
    ${password}    Set Variable    pass

    # Step 1
    Go To    ${url}
    Page Should Not Contain Element    xpath=//*[@id='header.link.login']

    # Step 2
    Go To    ${loginPage}
    Input Text    xpath=//*[@id='loginPage.userNameInput']    brown
    Input Text    xpath=//*[@id='loginPage.passwordInput']    ${password}
    Click Element    xpath=//*[@id='loginPage.loginFormSubmit']
    Wait Until Element Is Visible    xpath=//*[@id='header.title.userHome']
    Element Text Should Be    xpath=//*[@id='header.title.userHome']    ${studentName}
    Page Should Contain Element    xpath=//*[@id='header.link.logout']
    Page Should Contain Element    xpath=//*[@id='header.student-view-nav']
    Page Should Contain Element    xpath=//*[@id='stu.view.title']
    Page Should Contain Element    xpath=//*[@id='overview.personalInfoForm']
    Element Should Contain    xpath=//*[@id='stu.view.title']    Student's View
    # Close browser
    Close Browser

Login as Teacher
    # Step 1
    Go To    ${url}
    Page Should Not Contain Element    xpath=//*[@id='header.link.login']
    # Step 2
    Go To    ${loginPage}
    Input Text    xpath=//*[@id='loginPage.userNameInput']    lazy
    Input Text    xpath=//*[@id='loginPage.passwordInput']    ${password}
    Click Element    xpath=//*[@id='loginPage.loginFormSubmit']
    Wait Until Element Is Visible    xpath=//*[@id='header.title.userHome']
    Element Text Should Be    xpath=//*[@id='header.title.userHome']    ${teacherName}
    Page Should Contain Element    xpath=//*[@id='header.link.logout']
    Page Should Contain Element    xpath=//*[@id='header.teacher-view-nav']
    Page Should Contain Element    xpath=//*[@id='tea.view.title']
    Page Should Contain Element    xpath=//*[@id='overview.personalInfoForm']
    Element Should Contain    xpath=//*[@id='tea.view.title']    Teacher's View
    # Close browser
    Close Browser

Login as Invalid User
    # Step 1
    Go To    ${loginPage}
    Input Text    xpath=//*[@id='loginPage.userNameInput']    bla
    Input Text    xpath=//*[@id='loginPage.passwordInput']    ${password}
    Click Element    xpath=//*[@id='loginPage.loginFormSubmit']
    Wait Until Element Is Visible    xpath=//*[@id='loginPage.errorAlert']
    # Step 2
    Input Text    xpath=//*[@id='loginPage.userNameInput']    lazy
    Input Text    xpath=//*[@id='loginPage.passwordInput']    bla
    Click Element    xpath=//*[@id='loginPage.loginFormSubmit']
    Wait Until Element Is Visible    xpath=//*[@id='loginPage.errorAlert']
    # Close browser
    Close Browser