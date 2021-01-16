*** Settings ***
Documentation   Example Feature Tests
Resource        ../base.robot
Resource        ../../src/pages/search_page.robot

Test Setup      Start Test
Test Teardown   Finish Test

*** Test Cases ***
Search for Hospital
	Page Should Contain Element	${hospitalLabel}	10s