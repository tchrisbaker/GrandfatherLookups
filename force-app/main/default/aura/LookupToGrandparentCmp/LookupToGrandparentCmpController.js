({
    myAction : function(component, event, helper) {

    },
    handleApplicationEvent : function(component, event) {
        var recordByEvent = event.getParam("recordByEvent");
        var isLookupOne = event.getParam("isLookupOne");
        console.log("recordByEvent " + recordByEvent.Id);
        console.log("isLookupOne " + event.getParam("isLookupOne"));
        if (isLookupOne === true) { 
            console.log("parentid " + recordByEvent.Id);
            component.set("v.parentId", recordByEvent.Id);
        }
        else {
            console.log("childId " + recordByEvent.Id);
            component.set("v.childId", recordByEvent.Id);
            
            var action = component.get("c.SaveRecord");
             // set param to method  
             action.setParams({
                'recordId': component.get("v.recordId"),
                'lookupField' : 'AccountId',
                'lookupId' : recordByEvent.Id               
            });
            // set a callBack    
            action.setCallback(this, function(response) {
                //$A.util.removeClass(component.find("mySpinner"), "slds-show");
                var state = response.getState();
                console.log("state " + state);
                if (state === "SUCCESS") {
                    
                  /*  var storeResponse = response.getReturnValue();
                // if storeResponse size is equal 0 ,display No Result Found... message on screen.                }
                    if (storeResponse.length == 0) {
                        component.set("v.Message", 'No Result Found...');
                    } else {
                        component.set("v.Message", '');
                    }
                    // set searchResult list with return value from server.
                    component.set("v.listOfSearchRecords", storeResponse);*/
                }
    
            });
             // enqueue the Action  
            $A.enqueueAction(action);
        }
    },
    
    
})
