*** Settings ***
Library           Selenium2Library
Library           CSVLibrary.py
Library           Collections

*** Variables ***
${Browser}        Chrome
${SiteUrl}        https://ebdt.login.us2.oraclecloud.com/oam/server/obrareq.cgi?encquery%3DqU1LyTS6b2MmlFRpx9ip0CwhpfklryRDGdnG2TG5UcdqZDIzcDqTZJZ930w3Wm7fed4%2B0gQBZXN28CAlpuzvTs7Ho8J8m8Mk6DhVSGT622sme%2F6T5nYbYNFnZpPmuRx9k8UksM50IhY4zx6DQfu7KxspGT%2FwjIPfCC74ADxpe%2BUUqdgZwZ3O5SfWoUGP%2FaU65iPMLJSaNerPQi24rtNLIbbOkBtkPnAmNKVjQlcOi9eWEYywh3RJYXAaU1yvsATs9kl9%2BB0FDEbf8sx5u4YEqsgLZdF98%2FCQV%2B8jqP4ngREicvAkQ7O%2BxvKJWKqGOV%2FzYa%2BTaOJV7YpPg4GYIOClaz7zb8bXhHfgSaAPt1FregYJQQx5L2XGCKhZ1SWgBCDz5LmPf6LDosJuPxyqujA%2FzRs3yXWMAYyz81mqvFzHaknOFz97yHkPKdjmQiFJD%2BfyENqZo9zqtmH3f1oP9DDs0JmRk5z27Ci%2FbgxTjqtAt9Rjka5L2OJgSVgXZe0vmcFK%20agentid%3DOraFusionApp_11AG%20ver%3D1%20crmethod%3D2&ECID-Context=1.005QGLBVBDsB_6W_PxO5yd0003Op0006uv%3BkXhgv0ZCLILIIV8QjTPPGHRP_V9O%5EMPGpKSQ_UOTdJPOoPRRiG
${Delay}          3s

*** Test Cases ***
LoginTest
    Open Browser to the Login Page


*** Keywords ***
Open Browser to the Login Page
    ${all_users}=    Read CSV File    userdetails.xls
    :FOR   ${users}  in  @{all_users}
        \  ${username} =    Get From Dictionary    ${users}    username
        \  ${password} =    Get From Dictionary    ${users}    password
        \  Log  ${username}
        \  open browser    ${SiteUrl}    ${Browser}
        \  Maximize Browser Window
        \  Input Text    userid    ${Username}
        \  Input Text    password    ${Password}
        \  click button    Sign In
        \  sleep    ${Delay}