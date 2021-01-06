trigger AccountTrigger on Account (before insert, before update , after insert , after update ) {
    if(Trigger.isExecuting){
        if(Trigger.isBefore && Trigger.isUpdate){
            new TriggerHandler_Account()
                    .populateAccountIsValid((Map<Id,Account>) Trigger.newMap, (Map<Id,Account>) Trigger.oldMap);
        }
    }

}