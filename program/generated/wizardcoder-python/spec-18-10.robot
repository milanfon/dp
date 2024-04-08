Here's the Robot Framework scenario:


*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://localhost:4680/tbuis/
${BROWSER}    Chrome
${DELAY}    ${0}

*** Test Cases ***
Scenario
    Open Browser    ${URL}    ${BROWSER}
    Input Text    id:loginPage.userNameInput    lazy
    Input Text    id:loginPage.passwordInput    pass
    Click Element    id:loginPage.loginFormSubmit
    Click Element    id:tea.menu.listOfAllTeachers

    # Check if there are these names present on the page
    Page Should Contain Element    xpath://*[contains(., 'Julia Easyrider')]
    Page Should Contain Element    xpath://*[contains(., 'Olivia Keen')]
    Page Should Contain Element    xpath://*[contains(., 'John Lazy')]
    Page Should Contain Element    xpath://*[contains(., 'Alice Pedant')]
    Page Should Contain Element    xpath://*[contains(., 'Thomas Scatterbrained')]
    Page Should Contain Element    xpath://*[contains(., 'Peter Strict')]

    # Check if element with path //*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[3] has text matching "Numerical Methods"
    Element Text Should Be    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[3]    Numerical Methods

    # Check if element with path //*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3] has text matching "Database Systems, Fundamentals of Computer Networks, Introduction to Algorithms, Mobile Applications, Web Programming"
    Element Text Should Be    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3]    Database Systems, Fundamentals of Computer Networks, Introduction to Algorithms, Mobile Applications, Web Programming

    # Check if element with path //*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[3] should not contain text
    Element Should Not Contain    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[3]    text
    # Check if element with path //*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3] has text matching "Computer System Engineering, Database Systems, Operating Systems, Programming Techniques"
    Element Text Should Be    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    Computer System Engineering, Database Systems, Operating Systems, Programming Techniques
    # Check if element with path //*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[3] has text matching "Computation Structures"
    Element Text Should Be    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[3]    Computation Structures
    # Check if element with path //*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3] has text matching "Operating Systems, Programming in Java, Software Engineering, Software Quality Assurance"
    Element Text Should Be    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3]    Operating Systems, Programming in Java, Software Engineering, Software Quality Assurance

    Sleep    ${DELAY}
    Close Browser

Explanation:
- The test case name is "Scenario"
- The "Open Browser" keyword opens the page in the ${URL} variable using the ${BROWSER} variable
- The "Input Text" and "Click Element" keywords fill in the login form and login
- The "Click Element" keyword navigates to the "List of All Teachers" page
- The "Page Should Contain Element" keywords check if the names are present on the page
- The "Element Text Should Be" and "Element Should Not Contain" keywords check if the elements have the expected texts
- The "Sleep" keyword adds a delay of ${DELAY} seconds before closing the browser
- The "Close Browser" keyword closes the browser

You can adjust the ${DELAY} variable to add a delay between the steps if needed. The default value is 0 seconds. 