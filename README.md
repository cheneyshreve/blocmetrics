### Blocmetrics

Blocmetrics is an analytics service to track events on websites.

### Key features:
- server-side API that captures and saves those events to a database
- a Rails application that displays the captured event data for a user
- client-side JavaScript snippet that allows users to track events on their website

Note: while under development, localhost is being used. This information will be updated when Blocmetrics is completed and live.

To configure your application for tracking with Blocmetrics, add the following JavaScript Snippet:
```
var blocmetrics = {};

blocmetrics.report = function(eventName){

 	var event = { event: { name: eventName }};

  var request = new XMLHttpRequest();

  request.open("POST", "http://localhost:3000/api/events", true); // while under development

  request.setRequestHeader('Content-Type', 'application/json');

  request.send(JSON.stringify(event));
};
```


### Installation
- clone and download the source code from the repository

### Setup and configuration
- More details to be added, application currently under development

Languages and frameworks
- Ruby
- Ruby-on-Rails

Databases
- SQLite (Test, Development)
- PostgreSQL(production)
