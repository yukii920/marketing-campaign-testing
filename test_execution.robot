*** Settings ***
Library  RequestsLibrary

*** Test Cases ***

TC001 - Fetch Recipient List
    [Documentation]  Verify that recipient lists are correctly fetched by the campaign scheduling service.
    ${response}=  GET  https://api.campaign-scheduler.com/recipients
    Should Be Equal As Numbers  ${response.status_code}  200
    Dictionary Should Contain Key  ${response.json()}  recipient_list

TC002 - Fetch Email Templates
    [Documentation]  Verify that available email templates can be retrieved successfully.
    ${response}=  GET  https://api.campaign-scheduler.com/templates
    Should Be Equal As Numbers  ${response.status_code}  200
    Dictionary Should Contain Key  ${response.json()}  templates

TC003 - Schedule Campaign with Integration
    [Documentation]  Verify that a campaign can be scheduled with valid recipient and template services.
    ${payload}=  Create Dictionary  name=New Year Campaign  recipient_list_id=1  template_id=2  schedule_time=2025-04-01T10:00:00Z
    ${response}=  POST  https://api.campaign-scheduler.com/campaigns  json=${payload}
    Should Be Equal As Numbers  ${response.status_code}  201
 
TC004 - Execute Scheduled Campaign
    [Documentation]  Verify that a campaign executes correctly by integrating recipient and template services.
    ${campaign_id}=  Set Variable  1001
    ${response}=  GET  https://api.campaign-scheduler.com/campaigns/${campaign_id}/execute
    Should Be Equal As Numbers  ${response.status_code}  200
    Dictionary Should Contain Key  ${response.json()}  execution_status
    Should Be Equal  ${response.json()['execution_status']}  Success

TC005 - Cancel Integrated Campaign
    [Documentation]  Verify that a campaign can be canceled, ensuring the recipient and template services reflect changes.
    ${campaign_id}=  Set Variable  1002
    ${response}=  DELETE  https://api.campaign-scheduler.com/campaigns/${campaign_id}
    Should Be Equal As Numbers  ${response.status_code}  200
    Should Be Equal  ${response.json()['message']}  Campaign successfully canceled
