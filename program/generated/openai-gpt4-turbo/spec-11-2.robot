*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://localhost:4680/tbuis/index.jsp
${LOGIN_URL}    http://localhost:4680/tbuis/login
${OVERVIEW_URL}    http://localhost:4680/tbuis/teacher-view/overview
${SUBJECTS_URL}    http://localhost:4680/tbuis/teacher-view/mySubjects
${CHROME_DRIVER}    chromedriver

*** Test Cases ***
University System Check
    Open Browser    ${URL}    Chrome    executable_path=${CHROME_DRIVER}
    Set Selenium Speed    2 seconds
    Set Browser Implicit Wait    10 seconds
    Set Window Size    1501    1104
    
    # Navigate to login page
    Click Element    xpath=//*[@id="header.link.login"]
    Location Should Be    ${LOGIN_URL}
    Title Should Be    Login Page
    
    # Enter username and password and login
    Set Focus To Element    xpath=//*[@id="loginPage.userNameInput"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    pedant
    Set Focus To Element    xpath=//*[@id="loginPage.passwordInput"]
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Location Should Be    ${OVERVIEW_URL}

    # Navigate to My Subjects
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Location Should Be    ${SUBJECTS_URL}
    Title Should Be    Teacher's View
    
    # Check students in the first subject
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    
    # Check names
    Page Should Contain    Benjamin Green
    Page Should Contain    Mia Orange
    Page Should Contain    Charlotte Purple
    Page Should Contain    Isabella Yellow

    # Close modal and check another list
    Click Element    xpath=//*[@id="closeModalButtonCross"]
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
    Page Should Contain    No students
    
    [Teardown]    Close Browser