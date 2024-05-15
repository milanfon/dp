*** Settings ***
Library        SeleniumLibrary
Browser        Chrome

*** Test Cases ***

Test My Student View
    [Document]    ${json}
    [Variables]    json=${json}

    *** Setup ***
    Open Browser
    ${delay}    Set Timeout   30s

    ${login}    Set Variable    ${json}
    ${login_steps}    Extract    steps    ${login}

    *** Teardown ***
    Close Browser

    *** Tasks ***
    [Step]    ${steps}    Run Keywords    ${login_steps}

    ${check_elements}    Set Variable    ${check_elements_steps}    [Document]    ${check_elements_json}
    ${check_elements_json}    Extract    title    ${check_elements}
    ${check_elements_steps}    Extract    steps    ${check_elements}

    [Step]    Go To    My Subjects
    ${delay}    Run Keyword    Sleep   3s

    [Step]    ${check_elements_steps[11].text}    Should Be    Students (0)
    ${delay}    Run Keyword    Sleep   3s

    [Step]    ${check_elements_steps[13].text}    Should Be    Participants (0/10)

    ${select_subject}    Set Variable    ${select_subject_steps}    [Document]    ${select_subject_json}
    ${select_subject_json}    Extract    title    ${select_subject}
    ${select_subject_steps}    Extract    steps    ${select_subject}

    [Step]    Go To    Set Evaluation
    ${delay}    Run Keyword    Sleep   3s

    [Step]    ${select_subject_steps[11].text}    Should Not Be    NoOneStudent

    ${filter_students}    Set Variable    ${filter_students_steps}    [Document]    ${filter_students_json}
    ${filter_students_json}    Extract    title    ${filter_students}
    ${filter_students_steps}    Extract    steps    ${filter_students}

    [Step]    ${filter_students_steps[11].text}    Should Contain    No students on this exam date

    *** Teardown ***
    Close Browser

Test My Teacher View
    [Document]    ${json}
    [Variables]    json=${json}
    ${login}    Set Variable    ${json}
    ${login_steps}    Extract    steps    ${login}

    *** Setup ***
    Open Browser
    ${delay}    Set Timeout   30s

    *** Teardown ***
    Close Browser

    *** Tasks ***
    [Step]    ${login_steps}    Run Keywords    ${login_steps}

    ${check_elements}    Set Variable    ${check_elements_steps}    [Document]    ${check_elements_json}
    ${check_elements_json}    Extract    title    ${check_elements}
    ${check_elements_steps}    Extract    steps    ${check_elements}

    [Step]    Go To    My Subjects
    ${delay}    Run Keyword    Sleep   3s

    [Step]    ${check_elements_steps[9].text}    Should Be    Students (0)

    [Step]    Go To    My Exam Dates
    ${delay}    Run Keyword    Sleep   3s

    [Step]    ${check_elements_steps[11].text}    Should Be    Participants (0/10)

    ${select_subject}    Set Variable    ${select_subject_steps}    [Document]    ${select_subject_json}
    ${select_subject_json}    Extract    title    ${select_subject}
    ${select_subject_steps}    Extract    steps    ${select_subject}

    [Step]    Go To    Set Evaluation
    ${select_subject_steps[5].text}    Should Not Be    ${select_subject_steps[5].text_from_json}

    ${filter_students}    Set Variable    ${filter_students_steps}    [Document]    ${filter_students_json}
    ${filter_students_json}    Extract    title    ${filter_students}
    ${filter_students_steps}    Extract    steps    ${filter_students}

    [Step]    ${filter_students_steps[9].text}    Should Contain    No students on this exam date

*** Keywords ***

Delay
    [Arguments]    ${delay_in_seconds}
    [Document]    Delay for ${delay_in_seconds} seconds
    ${delay}    Run Keyword    Sleep    ${delay_in_seconds}s

*** Variables ***

delay    0s