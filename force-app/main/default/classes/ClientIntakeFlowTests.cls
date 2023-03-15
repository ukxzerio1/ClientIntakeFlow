@isTest
public with sharing class ClientIntakeFlowTests {

    @isTest
    public static void FlowCreatesContact() {

        Client_Intake__c clientIntake = new Client_Intake__c();
        clientIntake.Email__c = 'someclient@example.com';
        clientIntake.Name = 'Some Client';
        insert clientIntake;

        List<Contact> contacts = [SELECT Id, Email, LastName, Client_Intake__c FROM Contact];

        assert.areEqual(1, contacts.size(), 'We expected one contact record to be created');
    
        Contact contact = contacts.get(0);
        assert.areEqual(clientIntake.Email__c, contact.Email, 'The Contact record does not have the same email');
        assert.areEqual(clientIntake.Name, contact.LastName, 'The Contact record last name field was not set properly');
        assert.areEqual(clientIntake.Id, contact.Client_Intake__c, 'The Contact record does not have the Client Intake Id that created it.');
    
    }

}