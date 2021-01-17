*** Settings ***
Documentation   Example Feature Tests
Resource        ../base.robot
Resource        ../../src/pages/search_page.robot

Test Setup      Start Test
Test Teardown   Finish Test

*** Test Cases ***

Search For Exact Match
	Given Hospital App Launched
	When Search For Given Input	royal berkshire hospital
	Then Validate Search Results	1

Search For Similar Match
	Given Hospital App Launched
	When Search For Given Input	hospital
	Then Validate Search Results	3

Search With Aphanumeric Characters
	Given Hospital App Launched
	When Search For Given Input	hospital34524
	Then No Results should Be Displayed

Search With Special Characters
	Given Hospital App Launched
	When Search For Given Input	*hosp^$£!"&(it%al/
	Then No Results should Be Displayed

Search With Empty String
	Given Hospital App Launched
	When Search For Given Input	${EMPTY}
	Then Validate Search Results	6

Search With A Leading Space As Input
	Given Hospital App Launched
	When Search For Given Input	${SPACE} hospital
	Then Validate Search Results	3

Search With Misspelled Hospital Name
	Given Hospital App Launched
	When Search For Given Input	Ryoal
	Then No Results should Be Displayed

Verify Search Is Case-Insensitive
	Given Hospital App Launched
	Search For Given Input	HOSPITal
	Then Validate Search Results	3

Search For A Hospital and Navigate Back To Search Page
	Given Hospital App Launched
	When Search For Given Input	Royal Berkshire Hospital
	Then Validate Search Results	1
	And Select A Hospital and Navigate Back to Search Page to Validate Search Text