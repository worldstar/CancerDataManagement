$(window).load(function(){
	$("img").each(function(i){
		if($(this).attr("photoScale")=="true"){
			$(this).removeAttr('width');
			$(this).removeAttr('height');
 
			var imgWidth = $(this).width();
			var imgHeight = $(this).height();
 
			var percentage = 1;
			
			if(imgWidth > $(this).attr("maxWidth") || imgHeight > $(this).attr("maxHeight")){
				if(imgWidth > imgHeight){
					percentage = $(this).attr("maxWidth")/imgWidth;
				}
				else{
					percentage = $(this).attr("maxHeight")/imgHeight;
				}
				
				$(this).width(imgWidth * percentage);
				$(this).height(imgHeight * percentage);				
			}
			else{
				$(this).width(imgWidth);
				$(this).height(imgHeight);					
			}
		}
	});
});