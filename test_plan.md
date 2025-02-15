
Milestone 1: End-to-End Functional Test Plan

Test Scenarios
1. Campaign Creation & Scheduling
Verify that a user can create a campaign by specifying a name, recipient list, email template, and scheduling time.
Ensure that the user is able to set the scheduled time in UTC.
Validate that campaigns are saved successfully in the system.
Check that an error is displayed when attempting to schedule a campaign in the past.
Ensure that duplicate campaign names are handled properly.

2. Recipient List Selection
Verify that the user can select a recipient list from the available options.
Validate that the selected recipient list is correctly associated with the campaign.
Ensure that the system allows filtering and searching for recipient lists.
Check how the system handles large recipient lists.

3. Email Template Selection
Verify that a user can select an email template from predefined templates.
Ensure that the email template content is displayed correctly before selection.
Validate that an error is displayed if no template is selected.

4. Editing Campaign Name
Verify that users can modify the campaign name before scheduling.
Ensure that renaming a campaign updates it correctly in the database.
Validate that duplicate campaign names are not allowed.

5. Canceling a Scheduled Campaign
Verify that a user can cancel a scheduled campaign before its scheduled time.
Ensure that the campaign is removed from the sending queue upon cancellation.
Validate that users receive a confirmation message before cancellation.

6. Campaign Execution & Email Sending
Verify that the campaign is sent at the exact scheduled time.
Validate that emails are sent to all recipients in the selected list.
Check that email content is correctly rendered as per the chosen template

Milestone 2: Integration Test Plan

Test Scenarios
1. Integration with Recipient Management Service
Verify that the campaign scheduling service correctly fetches recipient lists.
Ensure that any updates to recipient lists reflect in scheduled campaigns.
Validate error handling when the recipient management service is down.

2. Integration with Email Template Service
Validate that the email template service fetches available templates.
Ensure that the correct template is used when sending emails.
Verify error handling for missing or deleted templates.

3. Integration with Email Dispatch Service
Verify that campaigns trigger email dispatch at the correct scheduled time.
Validate that email status updates (sent, failed, bounced) are logged correctly.
Ensure that retry mechanisms are triggered for failed email deliveries.
Verify logging and reporting for dispatched emails.

4. Logging & Monitoring Integration
Verify that campaign scheduling and execution logs are correctly recorded.
Ensure that monitoring tools provide real-time updates on campaign status.
Validate that error alerts are triggered for failed campaigns.


