public class baseList1 {
	@AuraEnabled
    public static List<Base_currency__c> fetchData() {
        //Query and return list of Contacts
        List<Base_currency__c> objRecords = [SELECT id, name, retrieve_time__c from Base_currency__c LIMIT 10];
        return objRecords;
    }
}