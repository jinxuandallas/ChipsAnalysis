
var TRange=null

function findString (str) {
	if (parseInt(navigator.appVersion)<4) return;
		var strFound;
	
	
	
	if (window.find) {
		// CODE FOR BROWSERS THAT SUPPORT window.find	
		

		document.f1.t1.value = '';   // Clear search box so we don't 'find' it
		
		strFound=self.find(str);
		if (strFound && self.getSelection && !self.getSelection().anchorNode) {
			strFound=self.find(str)
		}
		if (!strFound) {
			strFound=self.find(str,0,1)
		while (self.find(str,0,1)) 
				continue
		}
		
		document.f1.t1.value = str;   // Put text box back to how it was.
	}
	else if (navigator.appName.indexOf("Microsoft")!=-1) {
	// EXPLORER-SPECIFIC CODE
		/*if (TRange!=null) {
			TRange.collapse(false)
			strFound=TRange.findText(str)
			if (strFound) {	   
				TRange.select();
				window.document.f1.b1.focus();
				TRange.scrollIntoView();
			}
		}*/
		
		//Only find first instance
		//Stops weird reloading behaviour when passing end of document....

		//if (TRange==null || strFound==0) {
			TRange=self.document.body.createTextRange()
			strFound=TRange.findText(str,1,4);
			if (strFound){ 
				TRange.select();
				window.document.f1.b1.focus();
				TRange.scrollIntoView();
			}
		//}

	}
	else if (navigator.appName=="Opera") {
		alert ("Opera不支持,请用浏览器自带的搜索")
		return;
	}

	if (!strFound)
		alert ("关键词 '"+str+"' 没有找到!")
	return;
}

