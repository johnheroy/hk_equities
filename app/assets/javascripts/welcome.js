// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var companies = [["AIA Group", "1299.HK"], 
				         ["China Construction Bank", "939.HK"],
				         ["Springland International", "1700.HK"]];

var messages = ["takeover", "acquisition", "capital markets"];

setInterval(function() {
	// code to update every 5 seconds
	generateNewAnnouncement();
}, 5000);

var generateNewAnnouncement = function() {
	var company = companies[Math.floor(Math.random() * companies.length)];
	var ticker = company[1];
	var company_name = company[0];
	var msg = messages[Math.floor(Math.random() * messages.length)];

	var annc = "<tr> \
								<td>1</td> \
								<td>" + ticker + "</td> \
								<td>" + company_name + "</td> \
								<td>May 10, 2014</td> \
								<td>" + msg + "</td> \
								<td><span>(link)</span></td> \
							</tr>";

	alert(annc);
	//$.("#announcements-table tbody").prepend(annc);
};