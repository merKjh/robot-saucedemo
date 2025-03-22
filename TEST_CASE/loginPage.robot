*** Settings ***
Library     SeleniumLibrary
Resource    ../../robot-saucedemo/DATA/variables.robot
Variables   ../../robot-saucedemo/DATA/commonxpath.py


*** Variables ***
${OPTIONS}     Create List    --headless    --disable-animations
${CHROME_OPTIONS}    add_argument("--disable-javascript")

*** Keywords ***

Open dashboard (Chrome)
            Open Browser    ${urlDashboardWeb}    ${browserChrome} 
            Maximize Browser Window
            #set window size    ${1700}    ${900}

Open dashboard (Firefox)
            Open Browser    ${urlDashboardWeb}    ${browserFirefox} 
            Maximize Browser Window
            #set window size    ${1700}    ${900}

Open dashboard (Chrome) - headless
            ${chrome options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
            Call Method    ${chrome options}    add_argument    --headless
            Call Method    ${chrome options}    add_argument    --disable-gpu
            Call Method    ${chrome options}    add_argument    --disable-animations
            ${driver}=    Create Webdriver    Chrome    options=${chrome options}
            Go To         ${urlDashboardWeb} 
            #set window size    ${1700}    ${900}

Open dashboard (Chrome) - Disable Javascript
            Open Browser    ${urlDashboardWeb}    ${browserChrome}     options=${CHROME_OPTIONS}
            Maximize Browser Window
            #set window size    ${1700}    ${900}

Dashboard Login Page
            Wait Until Element Is Visible       ${loginbtn}              3s
            Input Text                          ${usernameInput}         ${username_test}
            Input Password                      ${passwordInput}         ${password_test}
            Click Button                        ${loginbtn}
            sleep   3
            