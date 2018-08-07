({
    selectRecord : function(component, event, helper){      
     // get the selected record from list  
       var getSelectRecord = component.get("v.oRecord");
     // call the event   
       var compEvent = component.getEvent("oSelectedRecordEvent");
       isLookupOne
      var isLookupOne = component.get("v.isLookupOne") ;
      console.log("$$isLookupOne " + isLookupOne);
      //setParams({"addDate" : dateStr, "addTime" : addTimeStr}); 
          compEvent.setParams(
            {"recordByEvent" : getSelectRecord, "isLookupOne" : isLookupOne }
          ); 

     // fire the event  
          console.log("fire event oSelectedRecordEvent");
          compEvent.fire();
     },
     doInit: function(component){
     
    }
 })