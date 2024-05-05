 ```ruby
*** Settings ***
Library            SeleniumLibrary
Browser            Chrome

*** Variables ***
${RECORDING_TITLE}        spec 10 teacher
${RECORDING_STEPS}        [${recording_steps_teacher}]

*** Variables ***
${OTHER_RECORDING_TITLE}  spec 10 student
${OTHER_RECORDING_STEPS}  [${recording_steps_student}]

*** Test Cases ***

Test Case Teacher
    [Documentation]
    Test case for teacher scenario

    ${teacher_steps}    ${RECORDING_STEPS}

    [Teardown]
    Close Browser

    [Documentation]
    Check for elements on "Other Subjects" page

    ${teacher_steps_index}    Run Keywords From List    ${teacher_steps}    index

    [Conditional]
    ${teacher_steps_index}    ${eq}    5
    [Documentation]
    On page "Other Subjects" there is not text value containing string "Peter Strict" in the same <tr> as text string "Operating Systems"

    ${tr_operating_systems}    Element Should Exist    //tr[contains(., 'Operating Systems')]
    ${tr_peter_strict}        Element Should Exist    //tr[contains(., 'Peter Strict')]
    ${tr_operating_systems_peter_strict}    Element Should Not Exist    ${tr_operating_systems}    //following::tr[./td[contains(., 'Peter Strict')]]

Test Case Student
    [Documentation]
    Test case for student scenario

    ${student_steps}    ${OTHER_RECORDING_STEPS}

    [Teardown]
    Close Browser

    [Documentation]
    Run student scenario

    ${student_steps_index}    Run Keywords From List    ${student_steps}    index

    [Conditional]
    ${student_steps_index}    ${eq}    11
    [Documentation]
    On page "Other Subjects" there is not text value containing string "Peter Strict" in the same <tr> as text string "Operating Systems"

    ${tr_operating_systems}    Element Should Exist    //tr[contains(., 'Operating Systems')]
    ${tr_peter_strict}        Element Should Exist    //tr[contains(., 'Peter Strict')]
    ${tr_operating_systems_peter_strict}    Element Should Not Exist    ${tr_operating_systems}    //following::tr[./td[contains(., 'Peter Strict')]]

*** Keywords ***

# Keywords for teacher scenario

# This keyword sets up the viewport for the test
# Set Viewport
# [Arguments]    ${width}    ${height}    ${device_scale_factor}    ${is_mobile}    ${has_touch}    ${is_landscape}
#
# This keyword navigates to the given URL
# Navigate
# [Arguments]    ${url}
# [KeywordArguments]    ${asserted_events}
#
# This keyword clicks the given target
# Click
# [Arguments]    ${target}
# [KeywordArguments]    ${offset_y}    ${offset_x}    ${asserted_events}
#
# This keyword sets the value of the given target
# Change
# [Arguments]    ${value}    ${target}
#
# This keyword sets the value of the given target using selectors
# Set Text
# [Arguments]    ${text}    ${target}
# [KeywordArguments]    ${selectors}
#
# This keyword sets the value of the given target using selectors
# Set Value
# [Arguments]    ${value}    ${target}
# [KeywordArguments]    ${selectors}
#
# This keyword sets the value of the given target using selectors and waits for the page to reload
# Set Value And Reload
# [Arguments]    ${value}    ${target}
# [KeywordArguments]    ${selectors}
#
# This keyword sets the value of the given target using selectors and waits for the element to become visible
# Set Value And Wait Visible
# [Arguments]    ${value}    ${target}
# [KeywordArguments]    ${selectors}
#
# This keyword sets the value of the given target using selectors and waits for the element to become clickable
# Set Value And Wait Clickable
# [Arguments]    ${value}    ${target}
# [KeywordArguments]    ${selectors}
#
# This keyword sets the value of the given target using selectors and waits for the element to become enabled
# Set Value And Wait Enabled
# [Arguments]    ${value}    ${target}
# [KeywordArguments]    ${selectors}
#
# This keyword sets the value of the given target using selectors and waits for the element to be selected
# Set Value And Wait Selected
# [Arguments]    ${value}    ${target}
# [KeywordArguments]    ${selectors}
#
# This keyword sets the value of the given target using selectors and waits for the element to be checked
# Set Value And Wait Checked
# [Arguments]    ${value}    ${target}
# [KeywordArguments]    ${selectors}
#
# This keyword sets the value of the given target using selectors and waits for the element to be unchecked
# Set Value And Wait Unchecked
# [Arguments]    ${value}    ${target}
# [KeywordArguments]    ${selectors}
#
# This keyword sets the value of the given target using selectors and waits for the element to be present
# Set Value And Wait Present
# [Arguments]    ${value}    ${target}
# [KeywordArguments]    ${selectors}
#
# This keyword sets the value of the given target using selectors and waits for the element to be enabled and present
# Set Value And Wait Enabled And Present
# [Arguments]    ${value}    ${target}
# [KeywordArguments]    ${selectors}
#
# This keyword sets the value of the given target using selectors and waits for the element to be enabled and visible
# Set Value And Wait Enabled And Visible
# [Arguments]    ${value}    ${target}
# [KeywordArguments]    ${selectors}
#
# This keyword sets the value of the given target using selectors and waits for the element to be enabled and visible and clickable
# Set Value And Wait Enabled And Visible And Clickable
# [Arguments]    ${value}    ${target}
# [KeywordArguments]    ${selectors}
#
# This keyword sets the value of the given target using selectors and waits for the element to be enabled and visible and clickable and selected
# Set Value And Wait Enabled And Visible And Clickable And Selected
# [Arguments]    ${value}    ${target}
# [KeywordArguments]    ${selectors}
#
# This keyword sets the value of the given target using selectors and waits for the element to be enabled and visible and clickable and selected and checked
# Set Value And Wait Enabled And Visible And Clickable And Selected And Checked
# [Arguments]    ${value}    ${target}
# [KeywordArguments]    ${selectors}
#
# This keyword sets the value of the given target using selectors and waits for the element to be enabled and visible and clickable and selected and checked and enabled
# Set Value And Wait Enabled And Visible And Clickable And Selected And Checked And Enabled
# [Arguments]    ${value}    ${target}
# [KeywordArguments]    ${selectors}
#
# This keyword sets the value of the given target using selectors and waits for the element to be enabled and visible and clickable and selected and checked and enabled and present
# Set Value And Wait Enabled And Visible And Clickable And Selected And Checked And Enabled And Present
# [Arguments]    ${value}    ${target}
# [KeywordArguments]    ${selectors}
#
# This keyword sets the value of the given target using selectors and waits for the element to be enabled and visible and clickable and selected and checked and enabled and present and visible
# Set Value And Wait Enabled And Visible And Clickable And Selected And Checked And Enabled And Present And Visible
# [Arguments]    ${value}    ${target}
# [KeywordArguments]    ${selectors}
#
# This keyword sets the value of the given target using selectors and waits for the element to be enabled and visible and clickable and selected and checked and enabled and present and visible and clickable
# Set Value And Wait Enabled And Visible And Clickable And Selected And Checked And Enabled And Present And Visible And Clickable
# [Arguments]    ${value}    ${target}
# [KeywordArguments]    ${selectors}
#
# This keyword sets the value of the given target using selectors and waits for the element to be enabled and visible and clickable and selected and checked and enabled and present and visible and clickable and enabled
# Set Value And Wait Enabled And Visible And Clickable And Selected And Checked And Enabled And Present And Visible And Clickable And Enabled
# [Arguments]    ${value}    ${target}
# [KeywordArguments]    ${selectors}
#
# This keyword sets the value of the given target using selectors and waits for the element to be enabled and visible and clickable and selected and checked and enabled and present and visible and clickable and enabled and click
# Set Value And Wait Enabled And Visible And Clickable And Selected And Checked And Enabled And Present And Visible And Clickable And Enabled And Click
# [Arguments]    ${value}    ${target}
# [KeywordArguments]    ${selectors}
#
# This keyword sets the value of the given target using selectors and waits for the element to be enabled and visible and clickable and selected and checked and enabled and present and visible and clickable and enabled and click and wait for the element to be present
# Set Value And Wait Enabled And Visible And Clickable And Selected And Checked And Enabled And Present And Visible And Clickable And Enabled And Click And Wait Present
# [Arguments]    ${value}    ${target}
# [KeywordArguments]    ${selectors}
#
# This keyword sets the value of the given target using selectors and waits for the element to be enabled and visible and clickable and selected and checked and enabled and present and visible and clickable and enabled and click and wait for the element to be clickable
# Set Value And Wait Enabled And Visible And Clickable And Selected And Checked And Enabled And Present And Visible And Clickable And Enabled And Click And Wait Clickable
# [Arguments]    ${value}    ${target}
# [KeywordArguments]    ${selectors}
#
# This keyword sets the value of the given target using selectors and waits for the element to be enabled and visible and clickable and selected and checked and enabled and present and visible and clickable and enabled and click and wait for the element to be clickable and wait for the element to be present
# Set Value And Wait Enabled And Visible And Clickable And Selected And Checked And Enabled And Present And Visible And Clickable And Enabled And Click And Wait Clickable And Wait Present
# [Arguments]    ${value}    ${target}
# [KeywordArguments]    ${selectors}
#
# This keyword sets the value of the given target using selectors and waits for the element to be enabled and visible and clickable and selected and checked and enabled and present and visible and clickable and enabled and click and wait for the element to be clickable and wait for the element to be present and wait for the page to reload
# Set Value And Wait Enabled And Visible And Clickable And Selected And Checked And Enabled And Present And Visible And Clickable And Enabled And Click And Wait Clickable And Wait Present And Reload
# [Arguments]    ${value}    ${target}
# [KeywordArguments]    ${selectors}
#
# This keyword sets the value of the given target using selectors and waits for the element to be enabled and visible and clickable and selected and checked and enabled and present and visible and clickable and enabled and click and wait for the element to be clickable and wait for the element to be present and wait for the page to reload and wait for the element to be enabled and present
# Set Value And Wait Enabled And Visible And Clickable And Selected And Checked And Enabled And Present And Visible And Clickable And Enabled And Click And Wait Clickable And Wait Present And Wait Enabled And Present
# [Arguments]    ${value}    ${target}
# [KeywordArguments]    ${selectors}
#
# This keyword sets the value of the given target using selectors and waits for the element to be enabled and visible and clickable and selected and checked and enabled and present