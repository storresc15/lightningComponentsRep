({
       

    showStep1 : function(component,event,helper){
         component.set("v.questionNumber", "One");
     },
     
     showStep2 : function(component,event,helper){
         component.set("v.questionNumber", "Two");
     },
     
     showStep3 : function(component,event,helper){
         component.set("v.questionNumber", "Three");
     },
     
     onclickNext : function(component,event,helper){
       
      var currentQN = component.get("v.questionNumber");
         if(currentQN == "One"){
             component.set("v.questionNumber", "Two");
         }
         else if(currentQN == "Two"){
             component.set("v.questionNumber", "Three");
         }
         else if(currentQN == "Three"){
             component.set("v.questionNumber", "Complete");
             alert("Thanks for your feedback");
         }
     },
     
       onclickPrevious : function(component,event,helper){
           
        var currentQN = component.get("v.questionNumber");
         if(currentQN == "Two"){
             component.set("v.questionNumber", "One");
         }
         else if(currentQN == "Three"){
             component.set("v.questionNumber", "Two");
         }
     },
      
 
 })