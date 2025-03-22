*** Settings ***
Library     SeleniumLibrary
Resource    ../../robot-saucedemo/DATA/variables.robot
Resource    ../../robot-saucedemo/TEST_CASE/loginPage.robot
Resource    ../../robot-saucedemo/TEST_CASE/productPage.robot
Resource    ../../robot-saucedemo/TEST_CASE/aboutPage.robot

Variables   ../../robot-saucedemo/DATA/commonxpath.py

*** Test Cases ***
Login Merchant Dashboard
        Open dashboard (Chrome)
        Dashboard Login Page

Ensure user could go to About Page
        Select About Page from the Menu

Ensure user go to about page succesfully
        Verify the About Page