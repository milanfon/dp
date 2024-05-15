*** Settings ***
Library            SeleniumLibrary
Browser            Chrome

*** Test Case ***
My Subjects Checks
    [Document]    ${recording_1} =    ${json}    ${json}
    ${json} =    ${json_from_string}    ${recording_1}
    [Document]    ${steps} =    ${json_extract}    ${json}    '$.steps'

    [Document]    ${scenario_1} =    ${Run Keyword If}    ${len}    ${steps}    ${Run Keywords}    \
        Open Browser    ${browser}    ${url_open}    \
        ${Set Viewport}    ${width}    ${height}    ${device_scale_factor}    ${is_mobile}    ${has_touch}    ${is_landscape}
        ${Click Element}    id=stu.mySubjects.successAlert
        ${Click Element}    id=stu.mySubjects.enrolledTable.Title
        ${Click Element}    xpath=//td[contains(.,'Database Systems')]/parent::tr[1]
        ${Close Browser}

    ${scenario_1}

    ${scenario_2} =    ${Run Keyword If}    ${len}    ${steps}    ${Run Keywords}    \
        Open Browser    ${browser}    ${url_open}    \
        ${Set Viewport}    ${width}    ${height}    ${device_scale_factor}    ${is_mobile}    ${has_touch}    ${is_landscape}
        ${Login}    ${username}    ${password}    \
        ${Click Element}    id=tea.mySubjects.table.listOfStudentsButton-1
        ${Click Element}    id=tea.myExamDates.table.participantsButton-1-0
        ${Click Element}    id=tea.setEvaluation.form.noOneStudent
        ${Click Element}    xpath=//td[contains(.,'No students on this exam date')]
        ${Close Browser}

    ${scenario_2}

    ${Delay}    1s

*** Keywords ***
Login
    ${username} =    ${Get Variable}    ${username_variable}
    ${password} =    ${Get Variable}    ${password_variable}
    ${Click Element}    id=loginPage.usernameInput
    ${Input Text}    id=loginPage.usernameInput    ${username}
    ${Click Element}    id=loginPage.passwordInput
    ${Input Text}    id=loginPage.passwordInput    ${password}
    ${Click Element}    id=loginPage.loginButton

    ${Delay}    2s

Set Viewport
    ${width} =    ${Argument}    1501
    ${height} =    ${Argument}    1104
    ${device_scale_factor} =    ${Argument}    1
    ${is_mobile} =    ${Argument}    false
    ${has_touch} =    ${Argument}    false
    ${is_landscape} =    ${Argument}    false
    ${Execute JavaScript}    \
        var width = ${width}; \
        var height = ${height}; \
        var deviceScaleFactor = ${device_scale_factor}; \
        var isMobile = ${is_mobile}; \
        var hasTouch = ${has_touch}; \
        var isLandscape = ${is_landscape}; \
        window.innerWidth = width; \
        window.innerHeight = height; \
        window.devicePixelRatio = deviceScaleFactor; \
        window.navigator.userAgent = window.navigator.userAgent.replace(/Mobi/g, ''); \
        window.matchMedia = window.matchMedia || function(mq) { window.matchMedia = function(mq) { return {matches: function() { return true; }, media: mq.media, onchange: function() {}};}; return window.matchMedia(mq);}; \
        window.matchMedia('(orientation: landscape)').matches = ${is_landscape}; \
        window.matchMedia('(device-width: ${width}px)').matches = ${is_landscape}; \
        window.matchMedia('(device-height: ${height}px)').matches = ${is_landscape}; \
        window.matchMedia('(device-width: ${width}px)').matches = ${is_mobile}; \
        window.matchMedia('(device-height: ${height}px)').matches = ${is_mobile}; \
        window.matchMedia('(pointer: fine)').matches = !${has_touch}; \
        window.matchMedia('(pointer: coarse)').matches = ${has_touch};

Open Browser
    ${url_open} =    ${Argument}
    ${browser} =    ${Get Global Variable}    ${BROWSER}
    ${Run Keyword}    Open Browser    ${browser}    ${url_open}

Click Element
    ${selector} =    ${Argument}
    ${Run Keyword}    Element Should Be Visible    ${selector}
    ${Run Keyword}    Click Element    ${selector}

Close Browser
    ${Run Keyword}    Close Browser

Input Text
    ${selector} =    ${Argument}
    ${value} =    ${Argument}
    ${Run Keyword}    Input Text    ${selector}    ${value}

Delay
    ${time} =    ${Argument}
    ${Run Keyword}    Sleep    ${time}

json_from_string
    ${json_string} =    ${Argument}
    ${json} =    ${Run Keyword}    JSON From String    ${json_string}
    ${json}

json_extract
    ${json} =    ${Argument}
    ${json_path} =    ${Argument}
    ${result} =    ${Run Keyword}    JSON Extract From String    ${json}    ${json_path}
    ${result}

Log To Console
    ${message} =    ${Argument}
    ${Run Keyword}    Log To Console    ${message}

Run Keyword If
    ${condition} =    ${Argument}
    ${true_keywords} =    ${Argument}
    ${false_keywords} =    ${Argument}
    ${Run Keyword If}    ${condition}    ${true_keywords}    ${false_keywords}

Run Keywords
    ${keywords} =    ${Argument}
    ${Run Keyword}    Run Keywords    ${keywords}

Log To Console    Recording 1
    ${json}

Log To Console    Steps 1
    ${steps}

Log To Console    Steps 1 length
    ${len}    ${steps}

Log To Console    Running scenario 1
    ${scenario_1}

Log To Console    Running scenario 2
    ${scenario_2}

Log To Console    Delay
    ${Delay}    1s

Log To Console    Test Complete
    ${Run Keyword}    Test Complete