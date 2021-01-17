*** Settings ***
Documentation       Search Page
...
...                 Keywords and variables for search page.

*** Variables ***
${hospitalLabel}	xpath=//android.widget.TextView[@index='0']
${searchBar}	id=search_bar
${searchButton}	accessibility_id=Search
${searchInputField}	id=search_src_text
${clearSearchButton}	accessibility_id=Clear query
${searchResultsContainer}	id=list
${navigateBack}	accessibility_id=Navigate up

*** Keywords ***

Select A Hospital and Navigate Back to Search Page to Validate Search Text
	Select A Hospital
	Navigate Back To Search Page
	Validate Search Input Text

Hospital App Launched
	Page Should Contain Element	${hospitalLabel}	${TIMEOUT_MID}
	Element Text Should Be	${hospitalLabel}	Hospitals
	Page Should Contain Element	${searchBar}	${TIMEOUT_MID}
	Page Should Contain Element	${searchResultsContainer}	${TIMEOUT_MID}

Search For Given Input
	[Arguments]	${inputValue}
	Set Test Variable	${searchInputText}	${inputValue}
	Wait Until Element Is Visible	${searchButton}	${TIMEOUT_MID}
	Click Element	${searchButton}
	Wait Until Element Is Visible	${searchInputField}	${TIMEOUT_MID}
	Input Text	${searchInputField}	${inputValue}

Validate Search Results
	[Arguments]	${value}
	Element Should Be Visible	${searchResultsContainer}	${TIMEOUT_MID}
	${count}=	Get Matching Xpath Count	xpath=//android.widget.TextView[@resource-id='com.sensynehealth.hospitals:id/hospitalName']
	Log	${count}
	Should Be Equal	${count}	${value}

No Results should Be Displayed
	Wait Until Page Does Not Contain	${searchResultsContainer}	${TIMEOUT_MID}

Select A Hospital
	Wait Until Element Is Visible	//android.widget.TextView[@text='${searchInputText}']	${TIMEOUT_MID}
	Click Element	//android.widget.TextView[@text='${searchInputText}']
	Wait Until Element Is Visible	//android.widget.TextView[@text='Name: ${searchInputText}']	${TIMEOUT_MID}

Navigate Back To Search Page
	Wait Until Element Is Visible	${navigateBack}	${TIMEOUT_MID}
	Click Element	${navigateBack}
	Wait Until Element Is Visible	${searchResultsContainer}	${TIMEOUT_MID}

Validate Search Input Text
	Wait Until Element Is Visible	${searchInputField}	${TIMEOUT_MID}
	${tempValue}=	Get Text	${searchInputField}
	Should Be Equal	${searchInputText}	${tempValue}