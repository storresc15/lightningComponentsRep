({

    
    returnStringForCSV : function(component,TableData){
         
        if (TableData == null || !TableData.length) {
            console.log('r');
             return null;
          }
          
             
         var ColumnHeadings,
             ColumnHeadings = ['Name','ProductCode','isActive'];
        
         var comma,
              comma = ',';
        
         var seperateLine,
             seperateLine =  '\n';
        
         var csvStringResult,
             csvStringResult = '';
        
          var columnNumber;
        
         
      
         csvStringResult += ColumnHeadings.join(comma);
        
         csvStringResult += seperateLine;
       
  
         for(var rowNumber=0; rowNumber < TableData.length; rowNumber++){   
             columnNumber = 0;
            
              for(var columnData in ColumnHeadings) {
                 var columnData = ColumnHeadings[columnData] ;  
                  console.log(columnData);
                   if(columnNumber > 0){ 
                       csvStringResult += comma; 
                    }   
                  
                  if(TableData[rowNumber][columnData] != undefined){
                         csvStringResult += '"'+ TableData[rowNumber][columnData]+'"';
                 }else{
                         csvStringResult += '"'+ '' +'"';
                 }
 
                
                             
                columnNumber++;
  
             } 
              csvStringResult += seperateLine;
           }
        
        
        return csvStringResult;        
     },
 })