public class GetNewChuckNorrisJoke {
    
    
    @auraenabled
    public static string getnewjoke()
    {
        Chuck_norris_joke__c cnj = new Chuck_norris_joke__c();
        Http http = new Http();
		HttpRequest request = new HttpRequest();
		request.setEndpoint('https://api.chucknorris.io/jokes/random');
		request.setMethod('GET');
		HttpResponse response = http.send(request);
        system.debug(response.getStatusCode());
        if (response.getStatusCode() == 200) {
        
            string body = response.getBody();
           
            
        JSON2chucknorris js2cn = JSON2chucknorris.parse(body);
        system.debug(js2cn.value);
        system.debug(js2cn.id);
                
      
            
        cnj.Content__c = js2cn.value;
        cnj.remote_id__c =  js2cn.id;
        
          insert  cnj;
         
         system.debug(cnj.Content__c); 
            
            
        }
        
        
        
        return cnj.Content__c;
       
    }
    
    
    
    
    

}