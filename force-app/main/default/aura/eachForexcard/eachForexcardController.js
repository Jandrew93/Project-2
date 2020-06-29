({

                doInit : function(component, event, helper) {

                                var action = component.get("c.fetchContactList");       

        action.setCallback(this, function(data){

            component.set("v.contactList",data.getReturnValue());

        });       

        $A.enqueueAction(action);

                }

})