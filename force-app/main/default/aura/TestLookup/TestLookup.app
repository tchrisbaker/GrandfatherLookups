<aura:application extends="force:slds">
  <!-- Create attribute to store lookup value as a sObject-->
  <aura:attribute name="selectedLookUpRecord" type="sObject" default="{}"/>
  <c:customLookup objectAPIName="Address__c" IconName="standard:account" selectedRecord="{!v.selectedLookUpRecord}" label="Location Name"/>
  <!-- here c: is org. namespace prefix-->
</aura:application>