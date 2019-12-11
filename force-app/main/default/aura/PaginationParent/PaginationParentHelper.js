({
    renderPage: function(component) {
		var records = component.get("v.allAccounts"),
            pageNumber = component.get("v.pageNumber"),
            pageRecords = records.slice((pageNumber-1)*10, pageNumber*10);
        component.set("v.currentList", pageRecords);
	}
})