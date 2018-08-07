({
    myAction : function(component, event, helper) {

    },
    handleApplicationEvent : function(cmp, event) {
        var recordByEvent = event.getParam("recordByEvent");
        console.log("recordByEvent " + recordByEvent.Id);
        // set the handler attributes based on event data
        cmp.set("v.parentId", recordByEvent.Id);
        //component.find("lookup2").set("v.parentId", recordByEvent.Id);
        //component.set("v.buttonLabel", parentId);    
    }
})
