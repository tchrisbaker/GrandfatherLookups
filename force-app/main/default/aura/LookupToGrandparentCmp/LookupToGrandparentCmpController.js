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
        }
    },
    handleSaveClick : function(component, event) {
        var action = component.get("c.SaveRecord");
             // set param to method  
             action.setParams({
            'objName' : component.get('v.recordToUpdateAPIName'),
            'recordId': component.get("v.recordId"),
            'lookupField' : component.get("v.childLookup"),
            'lookupId' : component.get("v.childId")
        });
        // set a callBack    
        action.setCallback(this, function(response) {
            //$A.util.removeClass(component.find("mySpinner"), "slds-show");
            var state = response.getState();
            console.log("state " + state);
            if (state === "SUCCESS") {
                $A.util.addClass(component.find("saveBtn"), "slds-hide");
                $A.util.removeClass(component.find("saveBtn"), "slds-show");
        
                $A.util.addClass(component.find("editBtn"), "slds-show");
                $A.util.removeClass(component.find("editBtn"), "slds-hide");
                
                $A.util.addClass(component.find("lookups"), "slds-hide");
                $A.util.removeClass(component.find("lookups"), "slds-show");
        
                $A.util.addClass(component.find("outputFIelds"), "slds-show");
                $A.util.removeClass(component.find("outputFIelds"), "slds-hide");
            }

        });
            // enqueue the Action  
        $A.enqueueAction(action);
    },

    handleEditClick : function(component, event) {

        $A.util.removeClass(component.find("saveBtn"), "slds-hide");
        $A.util.addClass(component.find("saveBtn"), "slds-show");

        $A.util.removeClass(component.find("editBtn"), "slds-show");
        $A.util.addClass(component.find("editBtn"), "slds-hide");
        
        $A.util.removeClass(component.find("lookups"), "slds-hide");
        $A.util.addClass(component.find("lookups"), "slds-show");

        $A.util.removeClass(component.find("outputFIelds"), "slds-show");
        $A.util.addClass(component.find("outputFIelds"), "slds-hide");
        
        
    }    
})
