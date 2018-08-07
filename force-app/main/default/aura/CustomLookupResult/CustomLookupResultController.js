({
    selectRecord : function(component, event, helper){      
     // get the selected record from list  
       var getSelectRecord = component.get("v.oRecord");
     // call the event   
       var compEvent = component.getEvent("oSelectedRecordEvent");
     // set the Selected sObject Record to the event attribute.  
          compEvent.setParams({"recordByEvent" : getSelectRecord });  
     // fire the event  
          console.log("fire event oSelectedRecordEvent");
          compEvent.fire();
     },
     doInit: function(component){
      /*var fields = component.get("v.fieldsToDisplay");
      console.log('fields ' + fields);
      var fullname = "";
      var i;
      for (i = 0; i < fields.length; i++) { 
        fullname += fields[i] + " - ";
      }
      console.log('fullname ' + fullname);
      component.set('v.fullname');*/
    }
 })