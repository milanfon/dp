*** Settings ***
Library         SeleniumLibrary
Browser         Chrome

*** Test Case ***
My Exam Dates - Teacher
    [Document]    ${json} =    ${json_parse}    ${ recording }

    [Document]    ${recording} =    ${json}

    ${Setup}
    ${Setup Chrome}

    *** Teardown ***
    ${Close Browser}

    *** Variables ***
    ${teacher_login} =    Username
    ${teacher_pass} =    Password

    *** Variables ***
    ${student_login} =    Username
    ${student_pass} =    Password

    *** Variables ***
    ${tea_my_exam_dates_page} =    ${Get Title}    ${Run Keyword And Return All}    ${Go To}    ${recording["steps"][0]["url"]}

    *** Keyword ***
    ${Go To}    ${recording["steps"][0]["url"]}
    ${Set Viewport}    ${recording["steps"][0]["width"]}    ${recording["steps"][0]["height"]}    ${recording["steps"][0]["deviceScaleFactor"]}    ${recording["steps"][0]["isMobile"]}    ${recording["steps"][0]["hasTouch"]}    ${recording["steps"][0]["isLandscape"]}

    ${Login}
    ${Click}    main    ${recording["steps"][2]["selectors"]}    ${recording["steps"][2]["offsetY"]}    ${recording["steps"][2]["offsetX"]}
    ${Input Text}    main    ${teacher_login}    ${recording["steps"][2]["selectors"]}
    ${Click}    main    ${recording["steps"][3]["selectors"]}    ${recording["steps"][3]["offsetY"]}    ${recording["steps"][3]["offsetX"]}
    ${Input Text}    main    ${teacher_pass}    ${recording["steps"][3]["selectors"]}
    ${Click}    main    ${recording["steps"][4]["selectors"]}    ${recording["steps"][4]["offsetY"]}    ${recording["steps"][4]["offsetX"]}

    ${Click}    main    ${recording["steps"][6]["selectors"]}    ${recording["steps"][6]["offsetY"]}    ${recording["steps"][6]["offsetX"]}
    ${Click Alert}

    ${Check Title}    ${tea_my_exam_dates_page}
    ${Element Should Be Visible}    main    ${recording["steps"][8]["selectors"]}

    ${Set Evaluation}
    ${Click}    main    ${recording["steps"][10]["selectors"]}    ${recording["steps"][10]["offsetY"]}    ${recording["steps"][10]["offsetX"]}

    ${Evaluation Table}
    ${Select From List}    main    ${recording["steps"][12]["selectors"][0]}    ${recording["steps"][12]["selectors"][1]}
    ${Click}    main    ${recording["steps"][12]["selectors"][2]}    ${recording["steps"][12]["offsetY"]}    ${recording["steps"][12]["offsetX"]}
    ${Text Should Be}    ${Get Text}    main    ${recording["steps"][12]["selectors"][1]}    ${recording["steps"][12]["selectors"][3]}

*** Test Case ***
My Exam Dates - Student
    [Document]    ${json} =    ${json_parse}    ${ recording }

    [Document]    ${recording} =    ${json}

    ${Setup}
    ${Setup Chrome}

    *** Teardown ***
    ${Close Browser}

    *** Variables ***
    ${student_login} =    Username
    ${student_pass} =    Password

    *** Variables ***
    ${student_my_exam_dates_page} =    ${Get Title}    ${Run Keyword And Return All}    ${Go To}    ${recording["steps"][14]["url"]}

    *** Keyword ***
    ${Go To}    ${recording["steps"][14]["url"]}
    ${Set Viewport}    ${recording["steps"][14]["width"]}    ${recording["steps"][14]["height"]}    ${recording["steps"][14]["deviceScaleFactor"]}    ${recording["steps"][14]["isMobile"]}    ${recording["steps"][14]["hasTouch"]}    ${recording["steps"][14]["isLandscape"]}

    ${Login}
    ${Click}    main    ${recording["steps"][16]["selectors"]}    ${recording["steps"][16]["offsetY"]}    ${recording["steps"][16]["offsetX"]}
    ${Input Text}    main    ${student_login}    ${recording["steps"][16]["selectors"]}
    ${Click}    main    ${recording["steps"][17]["selectors"]}    ${recording["steps"][17]["offsetY"]}    ${recording["steps"][17]["offsetX"]}
    ${Input Text}    main    ${student_pass}    ${recording["steps"][17]["selectors"]}
    ${Click}    main    ${recording["steps"][18]["selectors"]}    ${recording["steps"][18]["offsetY"]}    ${recording["steps"][18]["offsetX"]}

    ${Click}    main    ${recording["steps"][20]["selectors"]}    ${recording["steps"][20]["offsetY"]}    ${recording["steps"][20]["offsetX"]}

    ${Check Text}    ${Get Text}    main    ${recording["steps"][22]["selectors"]}    Contains    Computation Structures

    ${Exit}

My Exam Dates