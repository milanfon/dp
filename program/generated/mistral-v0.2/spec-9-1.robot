*** Settings ***
Library        SeleniumLibrary
Browser        Chrome

*** Test Cases ***

Scenario1
    [Document]                    ${json}
    Set Variable        json_steps    ${json["steps"]}

    Set Up
        Open Browser        ${json["steps"][0]["url"]}

    ${Create List}        i    ${json_steps}

    ${Iterate}        ${i}        In List        ${json_steps}
        |Set Up
        ${Run Keyword}    ${steps[*][0]}        ${steps[*][1]}

        |Wait        ${delay}
        ${Set Global Variable}        delay        1

        ${Run Keyword}    Click Element        id=stu.myExamDates.participantsModal.title
        ${Wait Until Element Is Visible}        id=stu.myExamDates.participantsModal.title

        ${Run Keyword}    Get Element Count        xpath=//tr[td[contains(.,"Benjamin Green")]]
        ${Assert}        ${last_result}    Is Equal        ${#{"Benjamin Green": 1, "Mia Orange": 1, "Charlotte Purple": 1, "Isabella Yellow": 1}.size()}

        ${Run Keyword}    Get Element Count        xpath=//tr[td[.="Benjamin Green"]]
        ${Run Keyword}    Get Element Count        xpath=//tr[td[.="Mia Orange"]]
        ${Run Keyword}    Get Element Count        xpath=//tr[td[.="Charlotte Purple"]]
        ${Run Keyword}    Get Element Count        xpath=//tr[td[.="Isabella Yellow"]]

        ${Run Keyword}    ${steps[*][1]["assertedEvents"][0]["type"]}        ${steps[*][1]["assertedEvents"][0]["url"]}

        ${End}

    ${End}

    Tear Down
    Close Browser

Scenario1