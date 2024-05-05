*** Settings ***
Library        SeleniumLibrary
Browser        Chrome

*** Test Cases ***

Scenario1
    [Document]                            #{JSON here}
    Set Up
        Set Viewport                        width=1501    height=1104    deviceScaleFactor=1    isMobile=False    hasTouch=False    isLandscape=False
    Navigate To                            url=http://localhost:4680/tbuis/index.jsp
    Click Element                          locator=(xpath//*[@id="header.link.login"])
    Input Text                            locator=(xpath//*[@id="loginPage.userNameInput"])    value=orange
    Click Element                          locator=(xpath//*[@id="loginPage.passwordInput"])
    Input Text                            locator=(xpath//*[@id="loginPage.passwordInput"])    value=pass
    Click Element                          locator=(xpath//*[@id="loginPage.loginFormSubmit"])
    Click Element                          locator=(xpath//*[@id="stu.menu.myExamDates"])
    Click Element                          locator=(xpath//*[@id="stu.myExamDates.table.ParticipantsButton-1"])

    Wait Until Element Is Visible
        Element Should Be Visible
        [Name]                              stu.myExamDates.participantsModal.title

    Participants Check
        Element Should Contain
        [Find]                              TD
        [Text]                              Benjamin Green
        Element Should Contain
        [Find]                              TD
        [Text]                              Mia Orange
        Element Should Contain
        [Find]                              TD
        [Text]                              Charlotte Purple
        Element Should Contain
        [Find]                              TD
        [Text]                              Isabella Yellow

    Tear Down
        Close Browser