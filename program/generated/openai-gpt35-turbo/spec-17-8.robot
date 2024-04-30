*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${url}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Open Page and Verify Elements as Teacher
    Open Browser    ${url}    chrome
    Set Viewport    1501    1104    1    false    false    false
    Navigate    ${url}
    Click Element    xpath///*[@id="header.link.login"]    # Clicking Login button
    Input Text    xpath///*[@id="loginPage.userNameInput"]    pedant    # Entering username
    Input Text    xpath///*[@id="loginPage.passwordInput"]    pass    # Entering password
    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]    # Clicking Login button
    Sleep    2s    # Adding delay for the page to load
    Click Element    xpath///*[@id="tea.menu.otherSubjects"]    # Clicking on Others' Subjects
    Sleep    2s    # Adding delay for the page to load
    Click Element    xpath///*[@id="tea.otherSubjects.table.participateButton-3"]    # Clicking on Participate button
    Sleep    2s    # Adding delay for the page to load
    Click Element    xpath///*[@id="tea.menu.myExamDates"]    # Clicking on My Exam Dates
    Sleep    2s    # Adding delay for the page to load
    Click Element    xpath///*[@id="tea.menu.newExamDates"]    # Clicking on New Exam Dates
    Sleep    2s    # Adding delay for the page to load
    Click Element    xpath///*[@id="tea.menu.listOfAllTeachers"]    # Clicking on List of All Teachers
    Sleep    2s    # Adding delay for the page to load
    Close Browser

Verify Elements as Student
    Open Browser    ${url}    chrome
    Set Viewport    1501    1104    1    false    false    false
    Navigate    ${url}
    Click Element    xpath///*[@id="header.link.login"]    # Clicking Login button
    Input Text    xpath///*[@id="loginPage.userNameInput"]    yellow    # Entering username
    Input Text    xpath///*[@id="loginPage.passwordInput"]    pass    # Entering password
    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]    # Clicking Login button
    Sleep    2s    # Adding delay for the page to load
    Click Element    xpath///*[@id="stu.menu.otherSubjects"]    # Clicking on Other Subjects
    Sleep    2s    # Adding delay for the page to load
    Close Browser