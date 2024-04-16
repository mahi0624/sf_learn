trigger ConObj on Contact (after insert, after update) {
    if(trigger.isAfter && trigger.isInsert){
    Set<Id> accids=new Set<Id>();
    for(Contact con:trigger.new){
        if (String.isNotBlank(con.AccountId)){
        accids.add(con.Id);
        }
    }
    List<Account> acctoUpdate=new List<Account>();
    List<AggregateResult> result=[Select AccountId,Count(Id) toatalactive from Contact where Active__c=TRUE AND AccountId IN:accids GROUP BY AccountId];
    
    for(AggregateResult results:result){
        String accis=String.Valueof(results.get('AccountId'));
        Integer totalContacts=Integer.Valueof(results.get('toatalactive'));
        Account acc=new Account(Id=Accis,Active_Contacts__c=totalContacts);
        //Account acc=new Account(Id=Accis,Active_Contacts__c=totalContacts);
        acctoUpdate.add(acc);
    }
    Update acctoUpdate;
}
}