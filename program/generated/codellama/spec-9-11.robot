*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Check Elements In Test
    [Setup]    Open Browser    http://localhost:4680/tbuis/    Chrome
    Click Element    xpath://*[@aria-label='Login' or @id='header.link.login']
    Input Text    xpath://*[@aria-label='Username' or @id='loginPage.userNameInput']    orange
    Input Text    xpath://*[@aria-label='Password' or @id='loginPage.passwordInput']    pass
    Click Element    xpath://*[@aria-label='Login' or @id='loginPage.loginFormSubmit']
    Click Element    xpath://*[@aria-label='My Exam Dates' or @id='stu.menu.myExamDates']
    Click Element    xpath://*[@id='stu.myExamDates.table.ParticipantsButton-1']
    Sleep    2s
    Element Should Be Visible    xpath://*[@id='stu.myExamDates.participantsModal.title']
    Element Should Be Visible    xpath://*[text()='Benjamin Green']
    Element Should Be Visible    xpath://*[text()='Mia Orange']
    Element Should Be Visible    xpath://*[text()='Charlotte Purple']
    Element Should Be Visible    xpath://*[text()='Isabella Yellow']
    [Teardown]    Close Browser