public with sharing class TriggerHandler_Account {
    private final static String COLD = 'Cold';

    public void populateAccountIsValid(Map<Id, Account> newAccountMap, Map<Id, Account> oldAccountMap){
        for(Account acc : newAccountMap.values()){
            if(acc.Rating != oldAccountMap.get(acc.Id).Rating){
                if(acc.Rating == COLD){
                    acc.IsValid__c = false;
                } else{
                    acc.IsValid__c = true;
                }

            }
        }

    }

}