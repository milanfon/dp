*** Variables ***
${browser}                      Chrome
${url}                          http://localhost:4680/tbuis/
${xpath_cancel_button}          //*[@id="tea.myExamDates.table.cancelButton-0-0"]
${xpath_success_alert}          //*[@id="tea.myExamDates.successAlert"]
${xpath_no_records}             //*[@id="tea.setEvaluation.form.noRecords"]
${xpath_subject_select}         //*[@id="tea.evalTable.filter.subjectSelect"]
${xpath_filter_button}          //*[@id="tea.evalTable.filter.submitButton"]
${xpath_computation_structures} //*[text()="Computation Structures"]

*** Test Cases ***
Teacher View
    [Setup]    Open Browser    ${url}    ${browser}
    # Insert the rest of the steps from the JSON recording
    # ...
    # Check if the "My Exam Dates" page is displayed
    # ...
    # Check if the "Set Evaluation" page is displayed
    # ...
    # Check if the "Evaluation Table" page is displayed
    # ...
    # Check if the "No exam dates for this subject" text is displayed
    # ...
    # Check if the "Computation Structures" text is NOT displayed
    # ...
    Close Browser

Student View
    [Setup]    Open Browser    ${url}    ${browser}
    # Insert the rest of the steps from the JSON recording
    # ...
    # Check if the "My Exam Dates" page is displayed
    # ...
    Close Browser