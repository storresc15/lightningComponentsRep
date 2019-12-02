<aura:application extends="force:slds" >
    
    <aura:attribute name="appContacts" type="Contact[]"/>
    <aura:attribute name="showTable" type="boolean"/>
    
    
    <aura:handler name="contactSearchComplete" event="c:contactSearchCompleteEvent" action="{!c.handlingSearchEvent}"/>
     <div class="app">
       
         
         <!-- Search Component -->
         <c:Example_ContactSearch/>
         
         <!-- Table Component -->
         <aura:if isTrue="{!v.showTable}"> 
            <div>
               <c:Example_ContactTable aura:id="contactList" contacts="{!v.appContacts}"/> 
            </div>
         </aura:if>
    </div>
    
</aura:application>