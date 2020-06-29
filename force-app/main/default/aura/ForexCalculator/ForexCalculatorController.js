({
    doInit : function(component, event, helper) {
        //user information
        var action = component.get("c.fetchData");
       
       
        console.log("testing testing");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                // Alert the user with the value returned 
                // from the server
               
				 console.log("success");
                console.log(response.getReturnValue());
            
                component.set("v.data", response.getReturnValue());
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

        
    $A.enqueueAction(action);
    },
                           
    onCheckboxChange : function(component, event, helper) {
        //Gets the checkbox group based on the checkbox id
		var availableCheckboxes = component.find('rowSelectionCheckboxId');
        var resetCheckboxValue  = false;
        if (Array.isArray(availableCheckboxes)) {
            //If more than one checkbox available then individually resets each checkbox
            availableCheckboxes.forEach(function(checkbox) {
                checkbox.set('v.value', resetCheckboxValue);
            }); 
        } else {
            //if only one checkbox available then it will be unchecked
            availableCheckboxes.set('v.value', resetCheckboxValue);
        }
        //mark the current checkbox selection as checked
        event.getSource().set("v.value",true);
	}
})