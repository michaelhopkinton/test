console.log("Hello");
var fs=require("fs");

fs.readFile("log.js", "utf8", function(err,data) {
	console.log(data)});

console.log("other data");
