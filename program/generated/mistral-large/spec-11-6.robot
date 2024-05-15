*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROWSER}  Chrome
${URL}  http://localhost:4680/tbuis/index.jsp
${DELAY}  2s
${NAMES}  Benjamin Green  Mia Orange  Charlotte Purple  Isabella Yellow

*** Test Cases ***
Check Names Presence
    Open Browser  ${URL}  ${BROWSER}
    Set Selenium Speed  2

    # Set viewport
    Set Window Size  1501  1104

    # Navigate to page
    Go To  ${URL}

    # Click Login
    Click Element  xpath:///*[@id="header.link.login"]

    # Input Username
    Input Text  xpath:///*[@id="loginPage.userNameInput"]  pedant

    # Input Password
    Input Text  xpath:///*[@id="loginPage.passwordInput"]  pass

    # Click Login Button
    Click Element  xpath:///*[@id="loginPage.loginFormSubmit"]

    # Click My Subjects
    Click Element  xpath:///*[@id="tea.menu.mySubjects"]

    # Click Students (4) button
    Click Element  xpath:///*[@id="tea.mySubjects.table.listOfStudentsButton-0"]

    # Check if names are present on the page
    FOR  ${NAME}  IN  @{NAMES}
        Page Should Contain  ${NAME}
    END

    # Click at the button with id "closeModalButtonCross"
    Click Element  id=closeModalButtonCross

    # Click on button with id "tea.mySubjects.table.listOfStudentsButton-2"
    Click Element  id=tea.mySubjects.table.listOfStudentsButton-2

    # Check if page contains the text "No students"
    Page Should Contain  No students

    # Close Browser
    Close All Browsers