*** Settings ***
Library    SeleniumLibrary


*** Keywords ***
Wait Until Element Is Visible
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}

*** Test Cases ***
Check Exam Dates
    ${chromeOptions}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    ${prefs}    Create Dictionary    profile.default_content_setting_values.notifications    ${2}
    Call Method    ${chromeOptions}    add_experimental_option    prefs    ${prefs}
    ${service_args}    Create List    --disable-notifications
    Call Method    ${chromeOptions}    add_argument    ${service_args}
    Create WebDriver    Chrome    executable_path=chromedriver    options=${chromeOptions}
    Go To    http://localhost:4680/tbuis/index.jsp
    Wait Until Element Is Visible    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="header.link.login"]
    Wait Until Element Is Visible    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    orange
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Wait Until Element Is Visible    xpath://*[@id="stu.menu.myExamDates"]
    Click Element    xpath://*[@id="stu.menu.myExamDates"]
    Wait Until Element Is Visible    xpath://*[@id="stu.myExamDates.table.ParticipantsButton-1"]
    Click Element    xpath://*[@id="stu.myExamDates.table.ParticipantsButton-1"]
    Wait Until Element Is Visible    xpath://*[@id="stu.myExamDates.participantsModal.title"]
    Wait Until Element Is Visible    xpath://*[contains(text(), "Benjamin Green")]
    Wait Until Element Is Visible    xpath://*[contains(text(), "Mia Orange")]
    Wait Until Element Is Visible    xpath://*[contains(text(), "Charlotte Purple")]
    Wait Until Element Is Visible    xpath://*[contains(text(), "Isabella Yellow")]
    Close Browser