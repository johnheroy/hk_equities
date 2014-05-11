// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


// just temporarily here to generate dummy announcements
var companies = [["AIA Group", "1299.HK"], 
				         ["China Construction Bank", "939.HK"],
				         ["Springland International", "1700.HK"]];
var messages = ["takeover", "acquisition", "capital markets"];

var Announcement = function(ticker, company_name, date, time, msg, url) {
	this.ticker = ticker;
	this.company_name = company_name;
	this.date = date;
	this.time = time;
	this.msg = msg;
	this.url = url;
};

Announcement.prototype = {
	renderHTML: function(index) {
		var annc_html = "<tr> \
											<td>" + index + "</td> \
											<td>" + this.ticker + "</td> \
											<td>" + this.company_name + "</td> \
											<td>" + this.date + "</td> \
											<td>" + this.time + "</td> \
											<td>" + this.msg + "</td> \
											<td><span>" + this.url + "</span></td> \
										</tr>";
		return annc_html;
	}
};

var generateDummyAnnouncement = function() {
	var company = companies[Math.floor(Math.random() * companies.length)];
	var ticker = company[1];
	var company_name = company[0];
	var msg = messages[Math.floor(Math.random() * messages.length)];
	return new Announcement(ticker, company_name, "May 10", "3:45pm", msg, "dummy url");
};

// async call to the API for latest 10 anncs, in order
// for now it just creates 10 random announcements
var getAnnouncements = function(callback) {
	var announcements = new Array();
	for (var i = 0; i < 10; i++) {
		var dummy = generateDummyAnnouncement();
		announcements.push(dummy);
	}
	callback(announcements);
};


// jQuery
$( document ).ready(function() {

	var firstRun = true;
	var refresh = function() {
		getAnnouncements( function(announcements) {
			for (var i = 0; i < announcements.length; i++) {
				$("#announcements-table tbody").append(announcements[i].renderHTML(i+1));
				if (!firstRun) {
					$("#announcements-table tbody tr:first").remove();
				}
			}
			firstRun = false;
		})
	};

	refresh();
	setInterval(refresh, 5000);

});
