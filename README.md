### Blocmetrics

Blocmetrics is an analytics service to track events on websites.

### Key features:
- A server-side API that captures and saves events to a database built with Rails 5.1.5
- A client-side JavaScript snippet that allows users to track events on their website
- A web accessible rails application that displays the captured event data for a user
- Graphs of event data displayed using Chartkick and Groupdate

### Installation
- Visit live (web-application)[https://stark-forest-69447.herokuapp.com/api/events] to sign-up for an account

### Setup and configuration
To configure your application for tracking with Blocmetrics, add the following JavaScript Snippet to
your application, e.g. to app/assets/javascripts/application.js for a Rails application:

```
var blocmetrics = {};

blocmetrics.report = function(eventName){

  var event = { event: { name: eventName }};
  var request = new XMLHttpRequest();
  request.open("POST", "https://stark-forest-69447.herokuapp.com/api/events", true);
  request.setRequestHeader('Content-Type', 'application/json');
  request.send(JSON.stringify(event));
};
```

Usage:
Add this snippet ```blocmetrics.report('eventName')``` to the relevant views, customizing for the event you wish to track.

```
window.onload = function() {
  blocmetrics.report('eventName');
}
```

- Push your changes to GitHub
- Push your changes to your production environment (if relevant)

Languages and frameworks
- Ruby 2.5.0p0
- Ruby-on-Rails 5.1.5

Databases
- SQLite (Test, Development)
- PostgreSQL(production)
