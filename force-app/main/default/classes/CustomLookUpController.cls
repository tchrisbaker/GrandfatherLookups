 
public class CustomLookUpController {
    @AuraEnabled
    public static List < sObject > fetchLookUpValues(String searchKeyWord, String ObjectName, String parentField, String parentId) {
        system.debug('ObjectName-->' + ObjectName);
        system.debug('parentField-->' + parentField);
          system.debug('parentId-->' + parentId);
        String searchKey =  '%' + searchKeyWord + '%';
        
        List < sObject > returnList = new List < sObject > ();
      
        // Create a Dynamic SOQL Query For Fetch Record List with LIMIT 5   
        String sQuery =  'select id, Name from ' +ObjectName + ' ';
        if (string.isNotBlank(parentId) || string.IsNotBlank(searchKeyword)) {
            sQuery += 'WHERE';
        }
        if (string.isNotBlank(searchKeyword) ) {
            sQuery += 'Name LIKE :searchKey ' ;
        }
        if (string.isNotBlank(parentId)) {
            sQuery += ':parentField = :parentId ' ;
        }
        sQuery += 'order by createdDate DESC limit 10';
        system.debug('query ' + sQuery);
        List < sObject > lstOfRecords = Database.query(sQuery);
        
        for (sObject obj: lstOfRecords) {
            returnList.add(obj);
        }
        return returnList;
    }
}