*** Settings ***
Documentation  Bulk Email Verifier Tool
Resource	../Keywords/Settings.robot
Resource	../Keywords/Navigation.robot
Resource	../Keywords/Generic_Commands.robot
Resource	../Keywords/Validations.robot
Test Setup  Begin Web Test
Test Teardown  End Web Test

# robot -d results Tests/Bulk_email_verifier.robot

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
	Click Bulk Email Verifier buton
	Upload SoProIOCSV file
