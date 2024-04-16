trigger Opptrigger on Opportunity (before insert) {
    if(trigger.isBefore && trigger.isInsert){
        //Set<Id> OPPids=new Set<Id>();
        for(Opportunity opp:trigger.new){
            if(opp.Amount!=null && opp.Amount>=100000){
                opp.Description='Hot Opportunity';
            }
        }
    }
}