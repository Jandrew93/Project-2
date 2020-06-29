public class fetchforexDetails {   

    @AuraEnabled

    public static list<Base_currency__c> fetchContactList(){

        return [select Id, name, retrieve_time__c from Base_currency__c limit 10];             

    }

}