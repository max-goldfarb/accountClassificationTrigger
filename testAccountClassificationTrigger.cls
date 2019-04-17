@isTest
private class testAccountClassificationTrigger {
    @isTest static void testAccountClassChange() {
        
        Account acct = new Account(Name='Test Account', Account_Classification__c='Territory');
        insert acct;
        
        List<Account> accts = [SELECT Id, Account_Classification__c FROM Account WHERE Name = 'Test Account'];
        for (Account acctToUpdate : accts) {
            Test.startTest();
            acctToUpdate.Account_Classification__c = 'House';
            update acctToUpdate;
            Test.stopTest();
            System.assertEquals('House', acctToUpdate.Account_Classification__c);   
        }
    }
}