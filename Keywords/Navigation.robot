*** Settings ***

Resource	../Keywords/Settings.robot
Resource	../Keywords/Generic_Commands.robot
Resource	../Keywords/Validations.robot
Resource	../PO/PO.robot

*** Keywords ***

Navigate to email-verifier landing page
	SeleniumLibrary.Go To  ${email-verifier}
	Wait for Ajax
	
Navigate to email-verifier Login page
	SeleniumLibrary.Click Element  //nav[@role='navigation']//a[.='Login']
	Wait for Ajax

Accept Automation Alert
	SeleniumLibrary.Handle Alert
	#${message} =	Handle Alert

Navigate to [${LEFTMENUITEM}]
	SeleniumLibrary.Click Element  xpath
	Wait for Ajax