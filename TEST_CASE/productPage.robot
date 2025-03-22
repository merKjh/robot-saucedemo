*** Settings ***
Library    SeleniumLibrary
Library    String
Library    Collections

Resource    ../../robot-saucedemo/DATA/variables.robot
Variables   ../../robot-saucedemo/DATA/commonxpath.py

*** Keywords ***

Verified Spesific Product - Sauce Labs Backpack 
            Wait Until Element Is Visible       ${productDemo}
            Sleep                                       2s
            ${products}    Get WebElements    ${productDemo}
            FOR       ${product}    IN    @{products}
                      ${text}    Get Text    ${product}
                      Log    Checking: ${text}
                    IF    '${text}' == '${backpackProduct}'
                    Log    Found: ${text}
                    Scroll Element Into View    ${product}
                    Click Element    ${product}
                    BREAK
                END
            END

Verified Spesific Product - Sauce Labs Fleece Jacket
            Wait Until Element Is Visible       ${productDemo}
            Sleep                                       2s
            ${products}    Get WebElements    ${productDemo}
            FOR       ${product}    IN    @{products}
                      ${text}    Get Text    ${product}
                      Log    Checking: ${text}
                    IF    '${text}' == '${jacketProduct}'
                    Log    Found: ${text}
                    Scroll Element Into View    ${product}
                    Click Element    ${product}
                    BREAK
                END
            END

Go to Spesific Product Detail - Sauce Labs Backpack 
            Wait until page contains element        ${addToCartbtn}
            Element Text Should Be                  ${productNameLabel}                    ${backpackProduct}
            Click Element                           ${addToCartbtn}
            Sleep    3s
            Wait until page contains element        ${removeCartbtn}

Go to Spesific Product Detail - Sauce Labs Fleece Jacket
            Wait until page contains element        ${addToCartbtn}
            Element Text Should Be                  ${productNameLabel}                    ${jacketProduct}
            Click Element                           ${addToCartbtn}
            Sleep    3s
            Wait until page contains element        ${removeCartbtn}


Verified Product in Your cart page - Sauce Labs Backpack 
            Sleep    3s
            Click Element                           ${shoppcartbtn}
            Wait until page contains element        ${checkOutbtn}
            Element Text Should Be                  ${productCartLabel}                    ${backpackProduct} 
            Element Text Should Be                  ${priceProductCart}                    ${backpackPrice}  
            Click Element                           ${checkOutbtn}

 Verified Product in Your cart page - Sauce Labs Fleece Jacket
            Sleep    3s
            Click Element                           ${shoppcartbtn}
            Wait until page contains element        ${checkOutbtn}
            Element Text Should Be                  ${productCartLabel}                    ${jacketProduct} 
            Element Text Should Be                  ${priceProductCart}                    ${jacketPrice}  
            Click Element                           ${checkOutbtn}

User be able to Fill out the user's information
            Sleep    3s
            Wait until page contains element        ${continuebtn}
            ${randomabc}  Generate Random String    5    [LETTERS]
            ${randomfirstname}=  Set Variable  ${randomabc}
            Set Global Variable  ${randomfirstname}
            Input Text                              ${firstnameInput}         ${randomfirstname} 
            Sleep    3s
            ${randomabc}  Generate Random String    5    [LETTERS]
            ${randomlastname}=  Set Variable  ${randomabc}
            Set Global Variable  ${randomlastname}
            Input Text                              ${lastNameInput}         ${randomlastname} 
            Sleep    3s           
            ${randomabc}  Generate Random String    5    0123456789
            ${randompostalcode}=  Set Variable  ${randomabc}
            Set Global Variable  ${randompostalcode}
            Input Text                              ${postalCodeInput}         ${randompostalcode} 
            Sleep    5s           
            Click Element                           ${continuebtn}

Verified Product in Overview page - Sauce Labs Backpack 
            Wait until page contains element        ${finishbtn}
            Sleep    3s                      
            Element Text Should Be                  ${productCartLabel}                    ${backpackProduct} 
            Element Text Should Be                  ${priceProductCart}                    ${backpackPrice}  
            Sleep    5s                      
            Click Element                           ${finishbtn}

Verified Product in Overview page - Sauce Labs Fleece Jacket
            Wait until page contains element        ${finishbtn}
            Sleep    3s                      
            Element Text Should Be                  ${productCartLabel}                    ${jacketProduct} 
            Element Text Should Be                  ${priceProductCart}                    ${jacketPrice}  
            Sleep    5s                      
            Click Element                           ${finishbtn}

Validate User successfully order
            Wait until page contains element        ${backToHomebtn}
            Sleep    3s                      
            Element Text Should Be                  ${successorderlabel}                    ${successOrderEng} 