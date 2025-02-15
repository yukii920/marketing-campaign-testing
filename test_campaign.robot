*** Settings ***
Library  RequestsLibrary

*** Test Cases ***
TC01 - Create a New Campaign
    [Documentation]  Verify that a user can create a campaign with valid inputs.
    ${payload}=  Create Dictionary  name=Summer Sale Campaign  recipient_list_id=1  template_id=2  schedule_time=2025-03-10T14:00:00Z
    ${response}=  POST  https://api.campaign-scheduler.com/campaigns  json=${payload}
    Should Be Equal As Numbers  ${response.status_code}  201
    Dictionary Should Contain Key  ${response.json()}  name


TC02 - Verify Campaign Execution
    [Documentation]  Verify that the scheduled campaign executes at the correct time.
    ${campaign_id}=  Set Variable  1001
    ${response}=  GET  https://api.campaign-scheduler.com/campaigns/${campaign_id}/status
    Should Be Equal As Numbers  ${response.status_code}  200
    Dictionary Should Contain Key  ${response.json()}  status
    Should Be Equal  ${response.json()['status']}  Executed


TC03 - Cancel a Scheduled Campaign
    [Documentation]  Verify that a user can cancel a scheduled campaign.
    ${campaign_id}=  Set Variable  1002
    ${response}=  DELETE  https://api.campaign-scheduler.com/campaigns/${campaign_id}
    Should Be Equal As Numbers  ${response.status_code}  200
    Should Be Equal  ${response.json()['message']}  Campaign successfully canceled

TC04 - Verify Campaign Logs
    [Documentation]  Verify that campaign logs and reports are generated correctly.
    ${campaign_id}=  Set Variable  1003
    ${response}=  GET  https://api.campaign-scheduler.com/campaigns/${campaign_id}/logs
    Should Be Equal As Numbers  ${response.status_code}  200
    Dictionary Should Contain Key  ${response.json()}  logs
    Should Contain  ${response.json()['logs']}  Execution Log



