public with sharing class TriggerHandler_Account {
    private final static String COLD = 'Cold';
    public final static String PHONE_DEFAULT = '99999999';

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

    public Account setDefaultPhone(Account acc){
        acc.Phone = PHONE_DEFAULT;
        return acc;
    }

}