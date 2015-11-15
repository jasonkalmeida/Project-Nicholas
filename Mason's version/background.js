
//User Clicks the action
chrome.browserAction.onClicked.addListener(function(tab){
	
	
	chrome.tabs.executeScript(tab.id, {
	    code: 'var config = ' + JSON.stringify(tab.url)
	}, function() {
	    chrome.tabs.executeScript(tab.id, {file: 'contentscript.js'});
	});
	
	chrome.tabs.query({active: true, currentWindow: true}, function(tabs) {
		var activeTab = tabs[0];
		var url = activeTab.url;
		var opt = {
			type: "basic",
			title: "Saved!",
			message: "We'll let you know if the price drops!",
			iconUrl: "icon3.png"
		}
		chrome.notifications.create(opt);
	});
});
