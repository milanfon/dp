*** Settings ***
Library         SeleniumLibrary
Browser         Chrome

*** Test Cases ***

Test Case        Test student exam dates
    [Document]    ${json}=    ${json_from_json}    ${json_recording_1}
    [Document]    ${recording_1}=    extract    ${json}    steps

    [Document]    ${url_student_view}=    Run Keywords    Set Up    student_view_url

    [Document]    ${status}=    Run Keywords    Login    ${recording_1[0]['value']['url']}    ${recording_1[0]['value']['arguments'][0]['value']}    ${recording_1[0]['value']['arguments'][1]['value']}
    ${status_assert}    ${status}    Equal    Success

    [Document]    ${url_other_exam_dates}=    Run Keywords    Click Element    ${recording_1[1]['value']['arguments'][0]['value']}
    [Document]    ${status}=    Run Keywords    Wait Until Element Is Visible    id=stu.otherExamDates.successAlert
    ${status_assert}    ${status}    Equal    Success

    [Document]    ${url_my_exam_dates}=    Run Keywords    Click Element    xpath=//td[.='Programming in Java']
    ${status_assert}    ${status}    Equal    Success

    [Document]    ${url_student_view}=    Run Keywords    Go To    ${url_student_view}

Test Case        Test teacher exam dates
    [Document]    ${json}=    ${json_from_json}    ${json_recording_2}
    [Document]    ${recording_2}=    extract    ${json}    steps

    [Document]    ${url_student_view}=    Run Keywords    Set Up    student_view_url

    [Document]    ${status}=    Run Keywords    Login    ${recording_2[0]['value']['url']}    ${recording_2[0]['value']['arguments'][0]['value']}    ${recording_2[0]['value']['arguments'][1]['value']}
    ${status_assert}    ${status}    Equal    Success

    [Document]    ${url_my_exam_dates}=    Run Keywords    Click Element    ${recording_2[1]['value']['arguments'][0]['value']}

    [Document]    ${status}=    Run Keywords    Wait Until Element Is Visible    xpath=//td[.='Mia Orange']
    ${status_assert}    ${status}    Equal    Success

*** Keywords ***

Keyword         Set Up
    [Document]    ${url_student_view_url}=    ${Get Environment Variable}    STUDENT_VIEW_URL

*** Teardown ***
    [Document]    Run Keywords    Teardown
    [Document]    Run Keywords    Close Browser