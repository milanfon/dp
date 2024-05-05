 ```python
*** Settings ***
Library           SeleniumLibrary
Browser           Chrome

*** Variables ***
URL               http://localhost:4680/tbuis/index.jsp
Teacher_Username   strict
Teacher_Password  pass

*** Test Case: Test_Teacher_My_Subjects ***
[Before All]
    Open Browser    ${URL}
    Maximize Window

[Teardown]
    Close Browser

[Test]
    Login            LoginPage
    Go To            Student_Other_Subjects
    Should Be Element Present            id=stu.otherSubjects.successAlert

    Login            LoginPage    Teacher_Username    Teacher_Password
    Go To            Teacher_My_Subjects
    Should Contain    id=tea.mySubjects.table.listOfStudentsButton-3    Students (2)
    Click Element     id=tea.mySubjects.table.listOfStudentsButton-3
    Should Contain    xpath=//td[.='William Maroon']

[Teacher_Login]
[Before]
    Login            LoginPage

[Test]
    Should Contain    id=tea.mySubjects.table.listOfStudentsButton-3    Students (2)

[Teacher_Students_Button]
[Before]
    Click Element     id=tea.mySubjects.table.listOfStudentsButton-3

[Test]
    Should Contain    xpath=//td[.='William Maroon']

*** Function Library ****

*** Function: Login ****
[Arguments]     ${Page}
[Documentation]     Function to login to the application
[Returns]     Nothing

[Code]     ${DRIVER}=    Get Webdriver
    ${DRIVER}.get    ${Page.URL}
    ${DRIVER}.find_element_by_xpath('//*[@id="header.link.login"]').click()
    ${DRIVER}.find_element_by_xpath('//*[@id="loginPage.userNameInput"]').send_keys    ${ARG1}
    ${DRIVER}.find_element_by_xpath('//*[@id="loginPage.passwordInput"]').send_keys    ${ARG2}
    ${DRIVER}.find_element_by_xpath('//*[@id="loginPage.loginFormSubmit"]').click()

[Teardown]
    ${DRIVER}.quit()

*** Function: Go To ****
[Arguments]     ${Page}
[Documentation]     Function to navigate to a page
[Returns]     Nothing

[Code]     ${DRIVER}.get    ${Page.URL}

[Teardown]
    ${DRIVER}.quit()

[Documentation]     Function to check if an element is present
[Arguments]     ${Locator}
[Returns]     Nothing

[Code]     ${DRIVER}.find_element_by_xpath(${Locator})

[Documentation]     Function to check if an element contains text
[Arguments]     ${Locator}
[Returns]     Nothing

[Code]     ${DRIVER}.find_element_by_xpath(${Locator}).text

[Documentation]     Function to check if an element contains a specific text
[Arguments]     ${Locator}    ${Text}
[Returns]     Nothing

[Code]     ${DRIVER}.find_element_by_xpath(${Locator}).text.find('William Maroon') != -1

[Documentation]     Function to click an element
[Arguments]     ${Locator}
[Returns]     Nothing

[Code]     ${DRIVER}.find_element_by_xpath(${Locator}).click()

[Documentation]     Function to set viewport
[Arguments]     ${Width}    ${Height}    ${Device_Scale_Factor}    ${Is_Mobile}    ${Has_Touch}    ${Is_Landscape}
[Returns]     Nothing

[Code]     ${DRIVER}.execute_script('''
    var width = ${Width};
    var height = ${Height};
    var deviceScaleFactor = ${Device_Scale_Factor};
    var isMobile = ${Is_Mobile};
    var hasTouch = ${Has_Touch};
    var isLandscape = ${Is_Landscape};
    window.innerWidth = width;
    window.innerHeight = height;
    if (deviceScaleFactor) {
        window.devicePixelRatio = deviceScaleFactor;
    }
    if (navigator.userAgent.match(/Mobi/)) {
        if (isMobile) {
            window.navigator.userAgent = window.navigator.userAgent.match(/Mobi/)[0] + ' ' + 'Chrome/78.0.3904.97';
            window.navigator.userAgent = window.navigator.userAgent.match(/Mobi/)[0] + ' ' + 'AppleWebKit/537.36';
            window.navigator.userAgent = window.navigator.userAgent.match(/Mobi/)[0] + ' ' + 'Mobile/1.0';
            window.navigator.userAgent = window.navigator.userAgent.match(/Mobi/)[0] + ' ' + 'Safari/537.36';
        }
        if (!navigator.userAgent.match(/Mobi/)) {
            window.navigator.userAgent = window.navigator.userAgent.replace(/Chrome/g, 'ChromeMobile');
        }
        if (!navigator.userAgent.match(/iPhone|iPad|iPod/)) {
            window.navigator.userAgent = window.navigator.userAgent.replace(/Mobile/g, '');
        }
    }
    ''')

[Documentation]     Function to set a value to an element
[Arguments]     ${Locator}    ${Value}
[Returns]     Nothing

[Code]     ${DRIVER}.find_element_by_xpath(${Locator}).send_keys(${Value})

[Documentation]     Function to press a key on an element
[Arguments]     ${Locator}    ${Key}
[Returns]     Nothing

[Code]     ${DRIVER}.find_element_by_xpath(${Locator}).send_keys(${Key})

[Documentation]     Function to press a key on an element and release it
[Arguments]     ${Locator}    ${Key}
[Returns]     Nothing

[Code]     ${DRIVER}.find_element_by_xpath(${Locator}).send_keys_keys(${Key})
    ${DRIVER}.find_element_by_xpath(${Locator}).send_keys_keys('{RELEASE_KEY}')

[Documentation]     Function to press keys on an element
[Arguments]     ${Locator}    ${Keys}
[Returns]     Nothing

[Code]     ${DRIVER}.find_element_by_xpath(${Locator}).send_keys_keys(${Keys})

[Documentation]     Function to wait for an element to be present
[Arguments]     ${Locator}
[Returns]     Nothing

[Code]     ${DRIVER}.implicitly_wait(10)

[Documentation]     Function to wait for an element to be clickable
[Arguments]     ${Locator}
[Returns]     Nothing

[Code]     ${DRIVER}.wait(10000)

[Documentation]     Function to wait for an element to be present and clickable
[Arguments]     ${Locator}
[Returns]     Nothing

[Code]     ${DRIVER}.wait(10000, EC.element_to_be_clickable(${Locator}))

[Documentation]     Function to wait for an element to be visible
[Arguments]     ${Locator}
[Returns]     Nothing

[Code]     ${DRIVER}.wait(10000, EC.visibility_of_element_located(${Locator}))

[Documentation]     Function to wait for an element to contain text
[Arguments]     ${Locator}    ${Text}
[Returns]     Nothing

[Code]     ${DRIVER}.implicitly_wait(10)
    ${DRIVER}.wait(10000)
    until(
        lambda: ${DRIVER}.find_element_by_xpath(${Locator}).text == ${Text}
    )

[Documentation]     Function to wait for an element to not contain text
[Arguments]     ${Locator}    ${Text}
[Returns]     Nothing

[Code]     ${DRIVER}.implicitly_wait(10)
    ${DRIVER}.wait(10000)
    until(
        lambda: not ${DRIVER}.find_element_by_xpath(${Locator}).text
    )

[Documentation]     Function to wait for an element to be present and not contain text
[Arguments]     ${Locator}
[Returns]     Nothing

[Code]     ${DRIVER}.wait(10000, EC.presence_of_element_located(By.XPATH, ${Locator}))
    ${DRIVER}.wait(10000, EC.not(EC.text_to_be_present_in_element(By.XPATH, ${Locator}, ${Text}))

[Documentation]     Function to wait for an element to be present and contain text
[Arguments]     ${Locator}    ${Text}
[Returns]     Nothing

[Code]     ${DRIVER}.wait(10000, EC.presence_of_element_located(By.XPATH, ${Locator}))
    ${DRIVER}.wait(10000, EC.text_to_be_present_in_element(By.XPATH, ${Locator}, ${Text}))

[Documentation]     Function to wait for an element to be present, visible, and contain text
[Arguments]     ${Locator}    ${Text}
[Returns]     Nothing

[Code]     ${DRIVER}.wait(10000, EC.presence_of_element_located(By.XPATH, ${Locator}))
    ${DRIVER}.wait(10000, EC.visibility_of_element_located(By.XPATH, ${Locator}))
    ${DRIVER}.wait(10000, EC.text_to_be_present_in_element(By.XPATH, ${Locator}, ${Text}))

[Documentation]     Function to wait for an element to be present, visible, and clickable
[Arguments]     ${Locator}
[Returns]     Nothing

[Code]     ${DRIVER}.wait(10000, EC.presence_of_element_located(By.XPATH, ${Locator}))
    ${DRIVER}.wait(10000, EC.visibility_of_element_located(By.XPATH, ${Locator}))
    ${DRIVER}.wait(10000, EC.element_to_be_clickable(By.XPATH, ${Locator}))

[Documentation]     Function to wait for an element to disappear
[Arguments]     ${Locator}
[Returns]     Nothing

[Code]     ${DRIVER}.implicitly_wait(10)

[Documentation]     Function to wait for an element to disappear and be replaced by an element
[Arguments]     ${Locator_Old}    ${Locator_New}
[Returns]     Nothing

[Code]     ${DRIVER}.wait(10000)
    ${DRIVER}.until(
        lambda: ${DRIVER}.find_element_by_xpath(${Locator_Old}) is None and ${DRIVER}.find_element_by_xpath(${Locator_New})
    )

[Documentation]     Function to wait for an element to be present and disappear
[Arguments]     ${Locator}
[Returns]     Nothing

[Code]     ${DRIVER}.wait(10000, EC.presence_of_element_located(By.XPATH, ${Locator}))
    ${DRIVER}.wait(10000, EC.staleness_of(By.XPATH, ${Locator}))

[Documentation]     Function to wait for an element to be present, visible, and disappear
[Arguments]     ${Locator}
[Returns]     Nothing

[Code]     ${DRIVER}.wait(10000, EC.presence_of_element_located(By.XPATH, ${Locator}))
    ${DRIVER}.wait(10000, EC.visibility_of_element_located(By.XPATH, ${