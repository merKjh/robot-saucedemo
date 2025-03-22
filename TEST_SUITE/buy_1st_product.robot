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
        Verified Spesific Product - Sauce Labs Backpack 
        Go to Spesific Product Detail - Sauce Labs Backpack 

Verified the Product in Cart
        Verified Product in Your cart page - Sauce Labs Backpack 
        User be able to Fill out the user's information

User successfully order the spesific product 
        Verified Product in Overview page - Sauce Labs Backpack
        Validate User successfully order




        