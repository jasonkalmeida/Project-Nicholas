var express = require('express');
var app = express();
var bodyParser = require('body-parser');
app.use( bodyParser.json() );       // to support JSON-encoded bodies
app.use(bodyParser.urlencoded({     // to support URL-encoded bodies
  extended: true
})); 


app.use(function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  next();
});




app.get('/', function (req, res) {
  console.log('Got request!');	
	
  res.send('Hello World!');
});

app.get('/test', function (req, res) {
  console.log('Got request test!');	
	
  res.send('Hello World test!');
});

app.post('/', function(req, res) {
	console.log('Got post test!');	
    var name = req.body;
	console.log(name.foo);
	/*req.on('data', function(chunk) {
	      console.log("Received body data:");
	      console.log(chunk.toString());
	    });*/
	res.send('I got ur '+ name.foo);
});


var server = app.listen(3000, function () {
  var host = server.address().address;
  var port = server.address().port;

  console.log('Example app listening at http://%s:%s', host, port);
});