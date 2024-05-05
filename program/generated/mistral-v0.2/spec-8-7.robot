 ```python
*** Settings ***
Library         SeleniumLibrary
Browser         Chrome

*** Variables ***
URL             http://localhost:4680/tbuis/

*** Test Cases ***

Test Case        student_check
    [Documentation] Test case for student actions
    [Precondition] Open URL

    [Actions]
    Set Viewport        width=1501    height=1104    device_scale_factor=1    is_mobile=False    has_touch=False    is_landscape=False
    Navigate To         ${URL}
    Set Element         ${username}    id=loginPage.userNameInput
    Set Element         ${password}    id=loginPage.passwordInput
    Click Element       ${username}
    Input Text         ${username}    ${username}
    Click Element       ${password}
    Input Text         ${password}    ${password}
    Click Element       #loginPage.loginFormSubmit
    Wait Until Element Is Visible    id=stu.menu.otherExamDates
    Click Element       id=stu.menu.otherExamDates
    Click Element       #stu.otherExamDates.table.registerButton-2-0
    Wait Until Element Is Visible    id=stu.otherExamDates.successAlert
    Click Element       id=stu.otherExamDates.successAlert
    Wait Until Page Contains    Other registration successful!
    Click Element       id=stu.menu.myExamDates
    Wait Until Element Is Visible    xpath=//td[.='Programming in Java']

    [Teardown]
    Close Browser

    [Documentation] Test case for teacher actions
    [Precondition] Open URL

    [Actions]
    Set Viewport        width=1501    height=1104    device_scale_factor=1    is_mobile=False    has_touch=False    is_landscape=False
    Navigate To         ${URL}
    Set Element         ${teacher_username}    id=loginPage.userNameInput
    Set Element         ${teacher_password}    id=loginPage.passwordInput
    Click Element       ${teacher_username}
    Input Text         ${teacher_username}    ${teacher_username}
    Click Element       ${teacher_password}
    Input Text         ${teacher_password}    ${teacher_password}
    Click Element       #loginPage.loginFormSubmit
    Wait Until Element Is Visible    id=tea.menu.myExamDates
    Click Element       id=tea.menu.myExamDates
    Wait Until Element Is Visible    xpath=//td[.='Mia Orange']

    [Teardown]
    Close Browser

*** Keywords ***

[Documentation] Wait Until Element Is Visible
[Arguments]   element
[Return]      None
[Documentation] Waits until the given element is visible.
[Documentation] element   Element identifier.
[Documentation] This keyword is implemented using the keyword Wait Until Element Is Visible.
Wait Until Element Is Visible
[Arguments]   locator
[Return]      None
[Documentation] Waits until the given element is visible.
[Documentation] locator   Element locator.
[Documentation] This keyword is implemented using the keyword Wait Until Element Is Visible.
[Documentation] Waits for the given number of seconds.
[Arguments]   seconds
[Return]      None
[Documentation] This keyword is implemented using the keyword Wait.
[Documentation] Waits for the given number of seconds.
[Documentation] seconds   Number of seconds.
[Documentation] This keyword is implemented using the keyword Wait.
[Documentation] Sets the given viewport dimensions.
[Arguments]   width
[Arguments]   height
[Arguments]   device_scale_factor
[Arguments]   is_mobile
[Arguments]   has_touch
[Arguments]   is_landscape
[Return]      None
[Documentation] This keyword is implemented using the keyword Set Viewport.
[Documentation] Sets the given viewport dimensions.
[Documentation] width   Viewport width.
[Documentation] height   Viewport height.
[Documentation] device_scale_factor   Viewport device scale factor.
[Documentation] is_mobile   Whether the viewport is mobile.
[Documentation] has_touch   Whether the viewport has touch.
[Documentation] is_landscape   Whether the viewport is landscape.
[Documentation] Navigates the browser to the given URL.
[Arguments]   url
[Return]      None
[Documentation] This keyword is implemented using the keyword Navigate.
[Documentation] Navigates the browser to the given URL.
[Documentation] url   URL to navigate to.
[Documentation] Click the given element.
[Arguments]   element
[Return]      None
[Documentation] This keyword is implemented using the keyword Click Element.
[Documentation] Click the given element.
[Documentation] element   Element identifier.
[Documentation] Input the given text into the given element.
[Arguments]   text
[Arguments]   element
[Return]      None
[Documentation] This keyword is implemented using the keyword Input Text.
[Documentation] Input the given text into the given element.
[Documentation] text   Text to input.
[Documentation] element   Element identifier.
[Documentation] Close the current browser window.
[Return]      None
[Documentation] This keyword is implemented using the keyword Close Browser.
[Documentation] Close the current browser window.
[Documentation] Set the given value for the given element.
[Arguments]   value
[Arguments]   element
[Return]      None
[Documentation] This keyword is implemented using the keyword Set Value.
[Documentation] Set the given value for the given element.
[Documentation] value   Value to set.
[Documentation] element   Element identifier.
[Documentation] This keyword is implemented using the keyword Set Value.
[Documentation] This keyword is used to check if the given element is present on the page.
[Arguments]   element
[Return]      None
[Documentation] This keyword is implemented using the keyword Wait Until Element Is Visible.
[Documentation] Waits until the given element is present on the page.
[Documentation] element   Element identifier.
[Documentation] This keyword is implemented using the keyword Wait Until Element Is Visible.
[Documentation] Waits until the given text is present on the page.
[Arguments]   text
[Return]      None
[Documentation] This keyword is implemented using the keyword Wait Until Page Contains.
[Documentation] Waits until the given text is present on the page.
[Documentation] text   Text to search for.
[Documentation] This keyword is implemented using the keyword Wait Until Page Contains.
[Documentation] This keyword is used to search for elements using XPath.
[Arguments]   xpath
[Return]      Element
[Documentation] This keyword is implemented using the keyword Get Element From XPath.
[Documentation] This keyword is used to search for elements using XPath.
[Documentation] xpath   XPath expression.
[Documentation] This keyword is implemented using the keyword Get Element From XPath.
[Documentation] This keyword is used to search for elements using the given selector.
[Arguments]   selector
[Return]      Element
[Documentation] This keyword is implemented using the keyword Get Element.
[Documentation] This keyword is used to search for elements using the given selector.
[Documentation] selector   Element selector.
[Documentation] This keyword is implemented using the keyword Get Element.
[Documentation] This keyword is used to search for elements using the given selector and the given index.
[Arguments]   selector
[Arguments]   index
[Return]      Element
[Documentation] This keyword is implemented using the keyword Get Element From List.
[Documentation] This keyword is used to search for elements using the given selector and the given index.
[Documentation] selector   Element selector.
[Documentation] index   Index of the element to search for.
[Documentation] This keyword is implemented using the keyword Get Element From List.
[Documentation] This keyword is used to search for elements using the given selector and the given CSS property.
[Arguments]   selector
[Arguments]   property
[Return]      Element
[Documentation] This keyword is implemented using the keyword Get Element Attribute.
[Documentation] This keyword is used to search for elements using the given selector and the given CSS property.
[Documentation] selector   Element selector.
[Documentation] property   CSS property to search for.
[Documentation] This keyword is implemented using the keyword Get Element Attribute.
[Documentation] This keyword is used to search for elements using the given selector and the given CSS property and the given value.
[Arguments]   selector
[Arguments]   property
[Arguments]   value
[Return]      Element
[Documentation] This keyword is implemented using the keyword Get Elements With Attribute.
[Documentation] This keyword is used to search for elements using the given selector and the given CSS property and the given value.
[Documentation] selector   Element selector.
[Documentation] property   CSS property to search for.
[Documentation] value   Value to search for.
[Documentation] This keyword is implemented using the keyword Get Elements With Attribute.
[Documentation] This keyword is used to search for elements using the given selector and the given text.
[Arguments]   selector
[Arguments]   text
[Return]      Element
[Documentation] This keyword is implemented using the keyword Get Elements.
[Documentation] This keyword is used to search for elements using the given selector and the given text.
[Documentation] selector   Element selector.
[Documentation] text   Text to search for.
[Documentation] This keyword is implemented using the keyword Get Elements.
[Documentation] This keyword is used to search for elements using the given selector and the given tag name.
[Arguments]   selector
[Arguments]   tag
[Return]      Element
[Documentation] This keyword is implemented using the keyword Get Elements.
[Documentation] This keyword is used to search for elements using the given selector and the given tag name.
[Documentation] selector   Element selector.
[Documentation] tag   Tag name to search for.
[Documentation] This keyword is implemented using the keyword Get Elements.
[Documentation] This keyword is used to search for elements using the given selector and the given tag name and the given index.
[Arguments]   selector
[Arguments]   tag
[Arguments]   index
[Return]      Element
[Documentation] This keyword is implemented using the keyword Get Element From List.
[Documentation] This keyword is used to search for elements using the given selector and the given tag name and the given index.
[Documentation] selector   Element selector.
[Documentation] tag   Tag name to search for.
[Documentation] index   Index of the element to search for.
[Documentation] This keyword is implemented using the keyword Get Element From List.
[Documentation] This keyword is used to search for elements using the given selector and the given tag name and the given index and the given CSS property.
[Arguments]   selector
[Arguments]   tag
[Arguments]   index
[Arguments]   property
[Return]      Element
[Documentation] This keyword is implemented using the keyword Get Element From List.
[Documentation] This keyword is used to search for elements using the given selector and the given tag name and the given index and the given CSS property.
[Documentation] selector   Element selector.
[Documentation] tag   Tag name to search for.
[Documentation] index   Index of the element to search for.
[Documentation] property   CSS property to search for.
[Documentation] This keyword is implemented using the keyword Get Element From List.
[Documentation] This keyword is used to search for elements using the given selector and the given CSS property and the given value.
[Arguments]   selector
[Arguments]   property
[Arguments]   value
[Return]      List
[Documentation] This keyword is implemented using the keyword Get Elements With Attribute.
[Documentation] This keyword is used to search for elements using the given selector and the given CSS property and the given value.
[Documentation] selector   Element selector.
[Documentation] property   CSS property to search for.
[Documentation] value   Value to search for.
[Documentation] This keyword is implemented using the keyword Get Elements With Attribute.
[Documentation] This keyword is used to search for the number of elements that match the given selector.
[Arguments]   selector
[Return]      int
[Documentation] This keyword is implemented using the keyword Get Element Count.
[Documentation] This keyword is used to search for the number of elements that match the given selector.
[Documentation] selector   Element selector.
[Documentation] This keyword is used to search for the number of elements that match the given selector and the given tag name.
[Arguments]   selector
[Arguments]   tag
[Return]      int
