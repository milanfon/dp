*** Settings ***
Library            SeleniumLibrary
Browser            Chrome

*** Test Cases ***

Test My Exam Dates
    [Documentation]        Test case to check if "Benjamin Green", "Mia Orange", "Charlotte Purple" and "Isabella Yellow" are present in the table

    [Setup]
    Set Viewport                 width=1501    height=1104    deviceScaleFactor=1
    Set Browser Implicit Wait    10

    [Actions]
    Navigate To                  http://localhost:4680/tbuis/index.jsp
    Login                       username=orange    password=pass

    [Step]
    Wait Until Element Is Visible  id=stu.myExamDates.participantsModal.title

    [Step]
    Element Should Contain       //tr/td                                    \
                                 [Text]                                      Benjamin Green \
                                 [Text]                                      Mia Orange \
                                 [Text]                                      Charlotte Purple \
                                 [Text]                                      Isabella Yellow

    [TearDown]
    Close Browser