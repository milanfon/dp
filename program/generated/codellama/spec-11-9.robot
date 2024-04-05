*** Settings ***
Library         SeleniumLibrary
Library         OperatingSystem

*** Variables ***
${URL}         http://localhost:4680/tbuis/index.jsp
${BROWSER}     Chrome

*** Test Cases ***
Check Names And Close Modal
    [Setup]    Set Selenium Speed    2
    [Teardown]    Close Browser
    [Tags]    smoke    regression
    Open Browser    ${URL}    ${BROWSER}
    # Step 2
    Click Element    xpath://*[@id="header.link.login"]
    # Step 3
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    pedant
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    # Step 8
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    Click Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    # Check names
    Page Should Contain Element    xpath://*[contains(text(), "Benjamin Green")]
    Page Should Contain Element    xpath://*[contains(text(), "Mia Orange")]
    Page Should Contain Element    xpath://*[contains(text(), "Charlotte Purple")]
    Page Should Contain Element    xpath://*[contains(text(), "Isabella Yellow")]
    # Close modal
    Click Element    xpath://*[@id="closeModalButtonCross"]
    # Click another button
    Click Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
    # Check for no students
    Page Should Contain    No students

*** Keywords ***