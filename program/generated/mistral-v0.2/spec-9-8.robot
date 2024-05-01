*** Settings ***
Library        SeleniumLibrary
Browser        Chrome

*** Variables ***
${URL}         http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Test My Exam Dates
    [Documentation]         Test case for My Exam Dates

    Set Viewport
        *** Parameters ***
        width                   1501
        height                  1104
        deviceScaleFactor         1
        isMobile                 False
        hasTouch                 False
        isLandscape              False

    Navigate To
        *** Parameters ***
        URL                      ${URL}

    [Actions]
    Click Button
        *** Parameters ***
        Target                    xpath//*[@id="header.link.login"]

    Input Text
        *** Parameters ***
        Target                    xpath//*[@id="loginPage.userNameInput"]
        Text                     orange

    Input Text
        *** Parameters ***
        Target                    xpath//*[@id="loginPage.passwordInput"]
        Text                     pass

    Click Button
        *** Parameters ***
        Target                    xpath//*[@id="loginPage.loginFormSubmit"]

    [Conditions]
    Title Not Equal
        *** Parameters ***
        Title                    University information system

    [Actions]
    Click Button
        *** Parameters ***
        Target                    xpath//*[@id="stu.menu.myExamDates"]

    Click Button
        *** Parameters ***
        Target                    xpath//*[@id="stu.myExamDates.table.ParticipantsButton-1"]

    [Conditions]
    Element Should Be Visible
        *** Parameters ***
        Element                  xpath//*[@id="stu.myExamDates.participantsModal.title"]

    [Table]
    | Check Participants |
    | ------------------ |
    | Benjamin Green      |
    | Mia Orange         |
    | Charlotte Purple    |
    | Isabella Yellow    |

    [Conditions]
    Table Should Contain
        *** Parameters ***
        Table                    xpath//*[@id="stu.myExamDates.table.participants"]/tbody/tr
        Values                  | Benjamin Green | Mia Orange | Charlotte Purple | Isabella Yellow |

    [Teardown]
    Close Browser