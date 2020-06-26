({
    
     doInit : function(component, event, helper) {
        
       // v.recordID = c.RandomCNJ.RandomJoke();
       var action = component.get("c.getRandomJoke");
         // Create a callback that is executed after 
        // the server-side action returns
        console.log("testing testing");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                // Alert the user with the value returned 
                // from the server
               
				 console.log("success");
                console.log(response.getReturnValue());
            
                component.set("v.jokecontent", response.getReturnValue());
                
               
                // You would typically fire a event here to trigger 
                // client-side notification that the server-side 
                // action is complete
            }
            else if (state === "INCOMPLETE") {
                // do something
                 console.log("incomplete");
            }
            else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " + 
                                 errors[0].message);
                    }
                } else {
                    console.log("Unknown error");
                }
            }
        });

        // optionally set storable, abortable, background flag here

        // A client-side action could cause multiple events, 
        // which could trigger other events and 
        // other server-side action calls.
        // $A.enqueueAction adds the server-side action to the queue.
        $A.enqueueAction(action);
        
         
       
    },
    
	myAction : function(component, event, helper) {
		
	}
    
    
})