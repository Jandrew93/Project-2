public with sharing class RandomCNJ {
     
   
    
   
     @auraenabled public static string getRandomJoke()
    {
        Chuck_norris_joke__c cnj = new Chuck_norris_joke__c();
        integer count = [SELECT COUNT() FROM Chuck_norris_joke__C];
        
      Integer rand = Math.floor(Math.random() * count).intValue();
        
        cnj = [select id,name, content__c FROM Chuck_norris_joke__c  LIMIT 1 OFFSET :rand];
        system.debug(cnj.Content__c);
        
        return cnj.content__c;
    }
    

}