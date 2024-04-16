trigger accbillship on Account (before insert,before update,after update) {
    if(trigger.isafter && trigger.isupdate){
        AccountTriggerHandler.updateOpportunitiesOnAccountUpdate(trigger.new);
       
    }
    if(trigger.isbefore && trigger.isinsert){
         
            AccountTriggerHandler.updateShippingAddress(trigger.new);
            AccountTriggerHandler.updateRating(trigger.new);
        }
        
    else if(trigger.isbefore && trigger.isupdate){
         
            AccountTriggerHandler.updateShippingAddress(trigger.new);
            AccountTriggerHandler.updateRating(trigger.new);
        
    }  
    else if(trigger.isAfter && trigger.isInsert){
        AccountTriggerHandler.oppCreate(Trigger.New);
        }
        }