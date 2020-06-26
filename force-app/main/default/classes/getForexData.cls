public class getForexData {
	@auraenabled
   public static void getexchanges()
    {
        Http http = new Http();
		HttpRequest request = new HttpRequest();
		request.setEndpoint('http://data.fixer.io/api/latest?access_key=b24bee4c196c261a31ac318c4cca52e1');
		request.setMethod('GET');
		HttpResponse response = http.send(request);
        system.debug(response.getStatusCode());
        if (response.getStatusCode() == 200) {
        //system.debug(response.getBody());
        
           system.debug( response.getBody());
            
            string body = response.getBody();
            //one of the fields in the JSON response is called date, which is a reserved keyword in apex. replace it with getdate, and my parser will then work. 
            body = body.replace('date', 'getdate');
              
            system.debug(body);
            
            JSON2forex js2fx = JSON2forex.parse(body);
            
            
        }//end if 
        
    }//end get exchanges
     
     
    
     public static JSON2forex getjs2fxobject()
    {
        Http http = new Http();
		HttpRequest request = new HttpRequest();
		request.setEndpoint('http://data.fixer.io/api/latest?access_key=b24bee4c196c261a31ac318c4cca52e1');
		request.setMethod('GET');
		HttpResponse response = http.send(request);
        system.debug(response.getStatusCode());
        JSON2forex js2fx;// = new JSON2forex();
        if (response.getStatusCode() == 200) {
        //system.debug(response.getBody());
        
           system.debug( response.getBody());
            
            string body = response.getBody();
            //one of the fields in the JSON response is called date, which is a reserved keyword in apex. replace it with getdate, and my parser will then work. 
            body = body.replace('date', 'getdate');
              
            system.debug(body);
            
             js2fx = JSON2forex.parse(body);
            
           
        }//end if 
         return js2fx;
    }//end getjs2forex
   
     
     @auraenabled
     public static void convertToDBobject(Json2forex js2fx)
    {
        Base_Currency__c bs = new Base_Currency__c();
        
        insert bs;
        list<Conversion_factor__c> convlist = new   list<Conversion_factor__c>{};
       	
      
        //begin the nightmare
		if(js2fx.rates.USD!=0)
        {
            Conversion_Factor__c temp = new Conversion_factor__c();
            temp.name = 'USD';
            temp.Parent_Currency__c=bs.Id;
        	temp.Conversion_Rate__c = js2fx.rates.USD;
            convlist.add(temp);
    	}
        if(js2fx.rates.JPY!=0)
        {
            Conversion_Factor__c temp = new Conversion_factor__c();
            temp.name = 'JPY';
            temp.Parent_Currency__c=bs.Id;
        	temp.Conversion_Rate__c = js2fx.rates.JPY;
            convlist.add(temp);
    	}
        if(js2fx.rates.CNY!=0)
        {
            Conversion_Factor__c temp = new Conversion_factor__c();
            temp.name = 'CNY';
            temp.Parent_Currency__c=bs.Id;
        	temp.Conversion_Rate__c = js2fx.rates.CNY;
            convlist.add(temp);
    	}
        if(js2fx.rates.CAD!=0)
        {
            Conversion_Factor__c temp = new Conversion_factor__c();
            temp.name = 'CAD';
            temp.Parent_Currency__c=bs.Id;
        	temp.Conversion_Rate__c = js2fx.rates.CAD;
            convlist.add(temp);
    	}
        if(js2fx.rates.CHF!=0)
        {
            Conversion_Factor__c temp = new Conversion_factor__c();
            temp.name = 'CHF';
            temp.Parent_Currency__c=bs.Id;
        	temp.Conversion_Rate__c = js2fx.rates.CHF;
            convlist.add(temp);
    	}
        if(js2fx.rates.USD!=0)
        {
            Conversion_Factor__c temp = new Conversion_factor__c();
            temp.name = 'USD';
            temp.Parent_Currency__c=bs.Id;
        	temp.Conversion_Rate__c = js2fx.rates.USD;
            convlist.add(temp);
    	}
        
        insert convlist;
        
        
    }
    
    
    
}