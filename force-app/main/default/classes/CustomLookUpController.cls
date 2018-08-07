 
public class CustomLookUpController {
    @AuraEnabled
    public static /*List < LookupItem >*/ List <sObject> fetchLookUpValues(String searchKeyWord, String ObjectName, String parentField, String parentId, String [] fieldList) {
        system.debug('ObjectName-->' + ObjectName);
        system.debug('parentField-->' + parentField);
        system.debug('parentId-->' + parentId);
        system.debug('searchKeyWord ' + searchKeyWord);
        String searchKey =  '%' + searchKeyWord + '%';
        
        List < sObject > returnList = new List < sObject > ();
        system.debug('fieldList ' + fieldList);
        // Create a Dynamic SOQL Query For Fetch Record List with LIMIT 5   
        String sQuery =  'select id, ' ;
        if (fieldList.size() >0) {
            string fields = string.join(fieldList, ',');
            sQuery += fields + ' ';
        }
        sQuery += 'from ' +ObjectName + ' ';
        if (string.isNotBlank(parentId) || string.IsNotBlank(searchKeyword)) {
            sQuery += 'WHERE ';
        }
        if (string.isNotBlank(searchKeyword) ) {
            sQuery += 'Name LIKE :searchKey ' ;
        }
        if (string.isNotBlank(parentId) && string.IsNotBlank(searchKeyword)) {
            sQuery += 'AND ';
        }
        if (string.isNotBlank(parentId)) {
            sQuery += parentField + ' = :parentId ' ;
        }
        sQuery += 'order by createdDate DESC limit 10';
        system.debug('query ' + sQuery);
        List < sObject > lstOfRecords = Database.query(sQuery);
        List <LookupItem> itemsToReturn = new List <LookupItem>();
        for (sObject obj: lstOfRecords) {
            //returnList.add(obj);
            LookupItem i = new LookupItem();
            i.objId = obj.Id;
            //i.objname = obj.get('Name');
            for (string s : fieldList) {
                i.NameStr += obj.get(s);
            }
            itemsToReturn.add(i);
        }

        for (sObject obj: lstOfRecords) {
            returnList.add(obj);
        }
        system.debug('itemsToReturn ' + itemsToReturn);
        return returnList;
       //return itemsToReturn;
    }
     
    public class LookupItem {
        @AuraEnabled public string objId;
        @AuraEnabled public string objname;
        @AuraEnabled public string NameStr;
        LookupItem() {
            NameStr = '';
        }
    }
}