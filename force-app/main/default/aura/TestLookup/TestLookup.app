<aura:application extends="force:slds">
  <!-- Create attribute to store lookup value as a sObject--> 
  <aura:attribute name="selectedLookUpRecord" type="sObject" default="{}"/>
 
<!--  <c:customLookup objectAPIName="account" IconName="standard:account" selectedRecord="{!v.selectedLookUpRecord}" label="Account Name"/>-->
    <!--<c:customLookup objectAPIName="Address__c" IconName="standard:account" selectedRecord="{!v.selectedLookUpRecord}" label="Location Name"/>
    -->
    
    <c:NewAddress />
    <!-- here c: is org. namespace prefix-->
</aura:application>