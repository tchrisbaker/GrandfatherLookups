 
public class CustomLookUpController {
    @AuraEnabled
    public static List < LookupItem > /*List <sObject>*/  fetchLookUpValues(String searchKeyWord, String ObjectName, String parentField, String parentId, String [] fieldList) {
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
            sQuery += fieldList[0] + ' LIKE :searchKey ' ;
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
            i.Id = obj.Id;
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
        //return returnList;
        return itemsToReturn;
    }

    @AuraEnabled public static void SaveRecord (string objName, string recordId, string lookupField, string lookupId ) {
        system.debug('recordId ' + recordId);
        system.debug('lookupField ' + lookupField);
        system.debug('lookupId ' + lookupId);
        sObject record = Schema.getGlobalDescribe().get(objName).newSObject() ;
        record.put('Id', (Id) recordId);
        record.put(lookupField, (Id) lookupId);
        system.debug('record = ' + record);
        update record;
    }
     
    public class LookupItem {
        @AuraEnabled public string Id;
        @AuraEnabled public string objname;
        @AuraEnabled public string NameStr;
        LookupItem() {
            NameStr = '';
        }
    }
}