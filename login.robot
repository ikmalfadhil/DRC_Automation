*** Settings ***
Documentation  login
Library    SeleniumLibrary

*** Variables ***
${logo}    //*[@id="dark"]/header/div/div/a/h6
${login}    //*[@class="nav-end"]/button
${login_popup}    //*[@class="wrapper"]/div
${login_email}    //*[@class="wrapper"]/div/div/div[2]/form/div/div/div/input
${login_password}    //*[@class="wrapper"]/div/div/div[2]/form/div[2]/div/div/input
${login_button}    //*[@class="wrapper"]/div/div/div[2]/form/button
${profile_icon}    //*[@class="nav-end"]/button
${logout_button}    /html/body/div[3]/div[3]/ul/li[2]

*** Keywords ***

Go To Website
    Open Browser    https://crypthub-app.vercel.app/   chrome
    Set Window Size    1280    1024

login
    Wait Until Page Contains Element    ${logo}
    Wait Until Element Is Visible    ${logo}
    Click Element    ${login}
    Wait Until Element Is Visible    ${login_popup}
    Input Text    ${login_email}    ikmal@besquare.com.my
    Input Password    ${login_password}    Ikmal12!
    Click Element    ${login_button}
    Sleep    5

logout
    Wait Until Page Contains Element    ${profile_icon}
    Click Element    ${profile_icon}
    Wait Until Page Contains Element    ${logout_button}
    Click Element    ${logout_button}
    Sleep    5
    
*** Test Cases ***

Login 
    Go To Website
    login

Logout
    Go To Website
    login
    logout