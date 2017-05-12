package peterbookmace.example.extra;

public class pageIndex {  	
	public String traverseBar(String pageName, String parameter, int totalRecords, int showRecords, int current){
		String result = "";
		//Go back to which starting index 
		int index = current - showRecords;
		
		if(index >= 0){
			String fileAndParameter = pageName+"?"+parameter+"="+index
                                +"&totalRecords="+totalRecords;
			result += "<a href=\""+fileAndParameter+"\">Back</a>";
		}
		//result += " | ";
		
		//goToNextStartingIndex
		int nextIndex = current + showRecords; 			
		if(nextIndex <= totalRecords){				
			String fileAndParameter2 = pageName+"?"+parameter+"="+nextIndex
                                +"&totalRecords="+totalRecords;
			result += "|<a href=\""+fileAndParameter2+"\">Next</a>";	
		}			
		
		return result;
	}	
        
	public String traverseBar(String pageName, String parameter, int totalRecords, 
                int showRecords, int current, String keywords){
		String result = "";
		//Go back to which starting index 
		int index = current - showRecords;
		
		if(index >= 0){
			String fileAndParameter = pageName+"?"+parameter+"="+index
                                +"&SearchContent="+keywords+"&totalRecords="+totalRecords;
			result += "<a href=\""+fileAndParameter+"\">Back</a>";
		}
		result += " | ";
		
		//goToNextStartingIndex
		int nextIndex = current + showRecords; 			
		if(nextIndex <= totalRecords){				
			String fileAndParameter2 = pageName+"?"+parameter+"="+nextIndex
                                +"&SearchContent="+keywords+"&totalRecords="+totalRecords;
			result += "<a href=\""+fileAndParameter2+"\">Next</a>";	
		}			

		return result;
	}        
        
	public String traverseBar(String pageName, String parameter, int totalRecords, 
                int showRecords, int current, String keywords, String newParams){
		String result = "";
		//Go back to which starting index 
		int index = current - showRecords;
		
		if(index >= 0){
			String fileAndParameter = pageName+"?"+parameter+"="+index
                                +"&SearchContent="+keywords+"&totalRecords="+totalRecords+newParams;
			result += "<a href=\""+fileAndParameter+"\">Back</a>";
		}
		result += " | ";
		
		//goToNextStartingIndex
		int nextIndex = current + showRecords; 			
		if(nextIndex <= totalRecords){				
			String fileAndParameter2 = pageName+"?"+parameter+"="+nextIndex
                                +"&SearchContent="+keywords+"&totalRecords="+totalRecords;
			result += "<a href=\""+fileAndParameter2+"\">Next</a>";	
		}			
		
		return result;
	}         
} 

