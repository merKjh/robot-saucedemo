*** Settings ***
Library    SeleniumLibrary
Library    String
Library    Collections

Resource    ../../saucedemo/DATA/variables.robot
Resource    productPage.robot
Variables   ../../saucedemo/DATA/commonxpath.py

*** Keywords ***
    
Select About Page from the Menu
            Wait until page contains element        ${menubtn}
            Click Element                           ${menubtn}
            Sleep    3s
            Wait until page contains element        ${aboutPageMenu}
            Click Element                            ${aboutPageMenu}

Verify the About Page
            Set Selenium Timeout    10s  # Stop loading after 10 seconds
            Sleep    5s
            ${state}    Execute JavaScript    return document.readyState
            Log    Page state: ${state}
            Element Text Should Be                  ${wordingAboutPage}                    ${wordingEng} 

Verify the About Page - 2
            ${driver}    Evaluate    sys.modules['SeleniumLibrary'].driver    sys
            ${driver}.execute_script("window.stop()")
            Wait until page contains element        ${requestDemobtn}         
            Element Text Should Be                  ${wordingAboutPage}                    ${wordingEng} 

Verify the About Page - 3
            Press Keys    None    ESC
            Wait until page contains element        ${requestDemobtn}         
            Element Text Should Be                  ${wordingAboutPage}                    ${wordingEng} 