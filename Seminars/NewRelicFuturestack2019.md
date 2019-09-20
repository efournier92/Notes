# New Relic Dashboarding

## Introduction to Insights
## Mettrics vs Events
metrics = Data harvested over 1 minute cycle
  - eg - Transaction
events - Metadata about an eventa that occurred in you application
  - eg - Transaction Type - Response Code- Request UII - App ID
All event data is sen tto insights

### NR Products that feed data
APM
Insights
Infrastructure
Mobile
_All products have mechanisms to get dat ainto Insights_

## NRWL: Syntacx and Event Types

### Simple NRQL Syntax Example
```NRQL
SELECT function(attribute_) FROM Event_Type WHERE condition FACET grouping
```

### Main Event Types
Browser => PageView
APM => Transaction
Synthetics => SyntheticCkeck
Mobile => MobileRequest
Infrastructure => SystemSample

### How Events Are Fired
User comes to website, PaveView event fired
User clicks some => PageAction event fired
Back-End code => Generated Transaction events

A single click may generate many back-end events
  - NR collects every event, in real-time

Visualize event types as a table
  - Pick event type, then evaluated by column


## Exploring Data
Data explorer is aplty named: it does exactly what it sounds like
Go to `Insights`, select `Data Explorer` from the left sidenav
Allows for easy grouping of data
  - As well as visualization
  - Really just helps spin up a NRQL query, without actually having to write one
  - Simply by playing with this tool, we can start to build our charts

### Create Dashboard
Select the green `+` icond next to `All Dashboards`, in the left menu
Select data via `Data Explorere`
Add new widget to dashboard

### Training Account
rpm.newrelic.com
learn@newrelicuniversity.com
833collins

## Writing Queries

### Four main features
1. Query
  - Write NRQL queries from scratch
2. Data Explorer
  - Create NRQL queries via UI tools
3. Data Apps
  - Share data
4. Dashboards
  - View graphs in dashboard forms

### Basic Functionality
- Select `Query` from left menu in `Insights`
- Example
  - `SELECT count(*) FROM PageView SINCE 1 day ago`
- We can format graph output via the icons in the top left menu, after clicking `Run` on query editor
- Filter data with the `WHERE` clause
  - `SELECT count(*) FROM PageView SINCE 1 day ago FACET appName WHERE appName != 'New Relic Pet Clinic'`

### Autocomplete Caveat
- Query tool's autopopulate functionality is time sensitive
  - If we're querying by a certain timeframe, only data points available in that timeframe will be available in autocomplete
  - It's important to always be mindful of oue selected timeframe

### Geolocation Methodology
- NR does _not_ store IP address info
  - However, it uses IP address to determine location, then dumps the actual address data

### APM
- Can report as a raw app, or as each instance individual
- Select All JVMs` from top menu
  - This allows us to count microservices individually
- If you select `Overview` 

## New Relic ONE
- Is their newest product
- Allows us to query accross accounts
- Allows us to queryt multiple microservices at once
- Requires an account to query data by

### Chart Builder
- Is available via New Relic ONE
- Is a great starting place for general usage
- Provides similar ability to query data, and create relevant graphical chart
  - Uses same NRQL queries as `Insights`
- Browse between different products via the bottom navigation menu

### Timezones
- All NR timestamps are log according to UTC timzone
- In reality, the following other timezones may apply to a transaction
  - App
  - Machine
  - Physcial

### Events vs Attrinbutes
- Custome events are different from custom attributes
- If we want to add a piece of custom data to that transaction, that's called setting and attribute
- If we wanted load time for every image on a page
  - We'd need a custom event table
    - Only way to view it would be in `Insights`
- We can either change an event, or the attributes of an event we're already capturing
- We could add custome attributes to existing events to capture sprecific data on a user experience
  - Use `Set Attribute` to accomplish this
  - This could be used to capture which features each customer is using
    - To identify which are popular, and which are not

### Advanced NRQL
- NR ONE supports advanced NRQL queries, in much the same way as Insights

### React-Native
- This cross-platform framework poses certain challenges for NR
- NR ONE supports use-cases for JS frameworks, such as this one
  - Capture JS crashes
  - Use bridging queries to accomplish this
    - Pass data from one dashboard, to another
- Can create linkages inside the dashboard, while not exposing it to users such as managers
  - This way, they'll be able to poke around without breaking anything

### Sharing Graphs
- Clicking `Embed` allows us to post an NR graph on our own website
  - This will be dynamic, updating in real-time
  - Works by `iframe`
  - Available to embed in any HTML paga

### Notes
- We can add notes to that section of a dashboard
  - This creates a snapshot of a current graph
  - These can be shared with specific users
  - Useful for sharing snapshots between teams

