*** Settings ***
Library		SeleniumLibrary	timeout=60 s

*** Variables ***
${ENVIRONMENT}		Pixyle Cloud

${BROWSER}				chrome
${email-verifier}		https://toolset.sopro.io/email-verifier
${DELAY}				0
${SoProIOCSV}			D:\\workspace\\SoProIO\\QA\\SoProBulk.csv

*** Keywords ***
Begin Web Test
    SeleniumLibrary.Open Browser  about:blank  ${BROWSER}
    SeleniumLibrary.Maximize Browser Window
    SeleniumLibrary.Set Selenium Speed  0
    
Close all open browsers and clear cookies
	SeleniumLibrary.Delete All Cookies
	SeleniumLibrary.Close All Browsers

End Web Test
	Close all open browsers and clear cookies