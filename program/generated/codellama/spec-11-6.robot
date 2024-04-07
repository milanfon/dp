*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://localhost:4680/tbuis/index.jsp
${BROWSER}    Chrome

*** Test Cases ***
Spec 11
    Open Browser    ${URL}    ${BROWSER}
    # Step 1
    Set Viewport Size    1501    1104
    # Step 2
    Click Element    xpath://*[@id="header.link.login"]
    # Step 3
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    pedant
    # Step 4
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    # Step 5
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    # Step 6
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    # Step 7
    Click Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    # Step 8
    Click Element    xpath://*[@id="closeModalButtonCross"]
    # Step 9
    Click Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
    # Step 10
    Page Should Contain    No students
    # Step 11
    Page Should Contain Element    xpath://*[contains(text(), "Benjamin Green")]
    Page Should Contain Element    xpath://*[contains(text(), "Mia Orange")]
    Page Should Contain Element    xpath://*[contains(text(), "Charlotte Purple")]
    Page Should Contain Element    xpath://*[contains(text(), "Isabella Yellow")]
    # Step 12
    Close Browser

Note: The test will fail if the elements with the specified XPaths are not found on the page. Adjust the XPaths if necessary.