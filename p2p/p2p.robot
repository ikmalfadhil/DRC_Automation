*** Settings ***
Documentation      Testing for login, create and delete api token


Library            SeleniumLibrary




*** Variables ***
${logo}                //*[@id="dark"]/header/div/div/a/h6
${login}               //*[@class="nav-end"]/button
${login_popup}         //*[@class="wrapper"]/div
${login_email}         //*[@class="wrapper"]/div/div/div[2]/form/div/div/div/input
${login_password}      //*[@class="wrapper"]/div/div/div[2]/form/div[2]/div/div/input
${login_button}        //*[@class="wrapper"]/div/div/div[2]/form/button
${profile_icon}        //*[@class="nav-end"]/button
${logout_button}       /html/body/div[3]/div[3]/ul/li[2]


${p2p_link}            //*[@id="dark"]/header/div/div/div[1]/a[2]
${btc_filter}          //*[@id="dark"]/div[1]/div[1]/div/div/label[2]/span[1]/input
${contract_card}       //*[@id="dark"]/div[1]/div[2]/div[2]/div[1]/div
${buy_btn}             //*[@id="dark"]/div[1]/div[2]/div[2]/div[1]/div/div[2]
${alert_box}           //*[@class="MuiCardContent-root css-1qw96cp"]
${yes_btn}             //*[@class="MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedSuccess MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-root MuiButton-contained MuiButton-containedSuccess MuiButton-sizeMedium MuiButton-containedSizeMedium css-1wb4k3q"]
${buy_success}         //*[@class="Toastify__toast Toastify__toast-theme--dark Toastify__toast--success"] 
${profile_tab}         (//*[@class="MuiButtonBase-root MuiMenuItem-root MuiMenuItem-gutters MuiMenuItem-root MuiMenuItem-gutters css-q7hcu6"])[4]
${trans_table}         //*[@class="tab-box MuiBox-root css-19kzrtu"]
${p2p_hist}            (//*[@class="MuiButtonBase-root MuiTab-root MuiTab-textColorPrimary css-a0ytsc"])[2]




*** Test Cases ***


Navigate To Website
   Open Browser    https://crypthub-app.vercel.app/   chrome
   Set Window Size    1280    1024


Login
   Wait Until Page Contains Element    ${logo}
   Wait Until Element Is Visible    ${logo}
   Click Element    ${login}
   Wait Until Element Is Visible    ${login_popup}   
   Input Text    ${login_email}    farhana@besquare.com.my
   Input Password    ${login_password}    Test1234@
   Click Element    ${login_button}


Navigate to P2P Page
   Page Should Contain    P2P Trader
   Click Element    ${p2p_link}
  
Filter and buy an ETH contract
   Click Element    ${btc_filter}
   Wait Until Page Contains Element    ${contract_card}    5
   Click Element   ${buy_btn}
   Wait Until Page Contains Element    ${alert_box}       10
   Click Element  ${yes_btn}
   Wait Until Page Contains Element    ${buy_success}      5


Navigate to P2P Transaction History
   Wait Until Page Contains Element   ${profile_icon}    5
   Click Element    ${profile_icon}
   Wait Until Page Contains Element    ${profile_tab}    5
   Click Element    ${profile_tab}
   Wait Until Page Contains Element    ${trans_table}    5
   Click Element   ${p2p_hist} 




Navigate to P2P Page
   Page Should Contain    P2P Trader
   Click Element    ${p2p_link}

