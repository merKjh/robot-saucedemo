*** Settings ***
Library     SeleniumLibrary
Resource    ../../robot-saucedemo/DATA/variables.robot
Resource    ../../robot-saucedemo/TEST_CASE/loginPage.robot
Resource    ../../robot-saucedemo/TEST_CASE/productPage.robot

Variables   ../../robot-saucedemo/DATA/commonxpath.py

*** Test Cases ***
Login Merchant Dashboard
        Open dashboard (Chrome)
        Dashboard Login Page

Buy Spesific Product
        Verified Spesific Product - Sauce Labs Fleece Jacket
        Go to Spesific Product Detail - Sauce Labs Fleece Jacket

Verified the Product in Cart
         Verified Product in Your cart page - Sauce Labs Fleece Jacket
        User be able to Fill out the user's information

User successfully order the spesific product 
        Verified Product in Overview page - Sauce Labs Fleece Jacket
        Validate User successfully order