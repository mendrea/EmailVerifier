*** Settings ***
Documentation  Classic Email Verifier Tool
Resource	../Keywords/Settings.robot
Resource	../Keywords/Navigation.robot
Resource	../Keywords/Generic_Commands.robot
Resource	../Keywords/Validations.robot
Test Setup  Begin Web Test
Test Teardown  End Web Test

# robot -d results Tests/SoProSafe.robot

*** Test Cases ***

Safe to send
	[Tags]  smoke
	Navigate to email-verifier landing page
	Ensure that the User has landed on SoPro Email Verifier page
	Navigate to email-verifier Login page
	Ensure that the User has landed on SoPro Email Verifier Login page
	Login as [demo@sopro.io] with password [Demo123!]
	Ensure that the User [demo@sopro.io] has loggedin successfully
	Verify the current number of credits	
	Type [andreja.misevski@gmail.com] in the contactDomain input box
	Click Verify 1 Credit buton
	OK Adivce - Safe To Send message in green appears
	Ensure Low Risk Toolset score value is [7.25] with message [High]
	Ensure Low Risk Mail Send advice value is [9.25] with message [Safe To Send]
	Ensure Low Risk Overall risk score value is [0.8] with message [High]
	Move mouse over the results section and verify the successful verification
	Ensure that correct number of credits is shown
	
Do not send
	[Tags]  smoke
	Navigate to email-verifier landing page
	Ensure that the User has landed on SoPro Email Verifier page
	Navigate to email-verifier Login page
	Ensure that the User has landed on SoPro Email Verifier Login page
	Login as [demo@sopro.io] with password [Demo123!]
	Ensure that the User [demo@sopro.io] has loggedin successfully
	Verify the current number of credits	
	Type [test@test.com] in the contactDomain input box
	Click Verify 1 Credit buton
	Bad Advice - do not send message in red appears
	Ensure High Risk Toolset score value is [0.1] with message [Low]
	Ensure High Risk Mail Send advice value is [0.1] with message [Do Not Send]
	Ensure High Risk Overall risk score value is [0] with message [Low]
	Move mouse over the results section and verify that there are no mail servers defined for this domain
	Ensure that correct number of credits is shown
	