/*var xhr = new XMLHttpRequest();
alert(xhr.readyState);
//xhr.open("GET", "http://162.243.197.37", true);
//xhr.open("GET", "https://httpbin.org/ip", true);
//xhr.open("GET", "http://httpbin.org/ip", true);
//xhr.open("GET", "httpbin.org/ip", true);
xhr.open("POST", "http://localhost:3000", true);
//xhr.open("GET", "http://localhost:3000", true);
//xhr.open("GET", "https://requestb.in/186w3je1", true);
alert(xhr.readyState);

var x = "testURL"

http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
http.setRequestHeader("Content-length", x.length);


xhr.onreadystatechange = function() {
	alert("test");
	alert(xhr.readyState);
  if (xhr.readyState == 4) {
    // WARNING! Might be injecting a malicious script!
    alert(xhr.responseText);

  }
};

alert(xhr.readyState);

xhr.send(x);

alert(xhr.readyState);
*/


var http = new XMLHttpRequest();
var postdata= "foo="+config; //Probably need the escape method for values here, like you did

http.open("POST", "http://localhost:3000", true);

//Send the proper header information along with the request
http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
http.setRequestHeader("Content-length", postdata.length);

http.onreadystatechange = function() {//Call a function when the state changes.
   if(http.readyState == 4 && http.status == 200) {
      console.log(http.responseText);
   }
}
http.send(postdata);