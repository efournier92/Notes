# New Relic Futurestack - Dashboarding Workshop - 2019-09-18

## Introduction to `Insights`

### New Relic Products that Feed Data
- APM
- Insights
- Infrastructure
- Mobile
- __All New Relic products feature some mechanism to feed data into `Insights`__

### Metrics vs Events

#### Metrics 
- Data is harvested over 1 minute cycles
- _Example:_ Transactions

#### Events
- Metadata about an events that occurred in you application
- _Examples:_ Transaction Type, Response Code, Request UIID, App ID
- All event data is sent to `Insights`

## `NRQL` Syntax and Event Types

### Simple `NRQL` Syntax Example
```NRQL
SELECT function(attribute_) FROM Event_Type WHERE condition FACET grouping
```

### Main Event Types
- Browser
  - _Example:_ PageView
- APM
  - _Example:_ Transaction
- Synthetics
  - _Example:_ SyntheticCheck
- Mobile
  - _Example:_ MobileRequest
- Infrastructure
  - _Example:_ SystemSample

### How Events Are Fired
- User comes to website
  - A `PageView` event is fired
- User clicks a button
  - A `PageAction` event is fired
- Back-end code executes
  - Transaction events are generated
  - A single click may generate many back-end events
    - NR collects every event, in real-time
- Visualize event types as a table
  - Pick event type, then evaluated by column

### Exploring Data
- The data explorer is aptly named
  - It does exactly what it sounds like
- Go to `Insights`, select `Data Explorer` from the left side-nav
- Allows for easy grouping of data
  - As well as visualization
  - Really just helps spin up a `NRQL` query, without actually having to write one
  - Simply by playing with this tool, we can start to build our charts

### Create Dashboard
- Select the green `+` icon next to `All Dashboards`, in the left menu
- Select data via `Data Explorere`
- Add new widget to dashboard

### Training Account
- __Domain:__ rpm.newrelic.com
- __Domain:__ learn@newrelicuniversity.com
- __Domain:__ 833collins

## Writing Queries

### Four Main Features to Use
1. Query
  - Write `NRQL` queries from scratch
2. Data Explorer
  - Create `NRQL` queries via UI tools
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
- Query tool's auto-populate functionality is time sensitive
  - If we're querying by a certain time frame, only data points available in that time frame will be available in autocomplete
  - It's important to always be mindful of our selected time frame

### Geolocation Methodology
- NR does _not_ store IP address info
  - However, it uses IP address to determine location, then dumps the actual address data

### `APM`
- Can report as a raw app, or as each instance individual
- Select All JVMs` from top menu
  - This allows us to count microservices individually
- If you select `Overview` 

## New Relic `ONE`

### General Information
- This is their newest product
  - Updated UI, wrapping many old features
  - Also includes some features not available in `Insights`
- Allows us to query accross accounts
- Allows us to query multiple microservices at once
- Requires an account to query data by

### Chart Builder
- Is available via New Relic `ONE`
- Is a great starting place for general usage
- Provides similar ability to query data, and create relevant graphical chart
  - Uses same NRQL queries as `Insights`
- Browse between different products via the bottom navigation menu

### Timezone Considerations
- All New Relic timestamps are log according to UTC timzone
- In reality, the following other timezones may apply to a transaction
  - App sever location
  - Machine location
  - Physcial location

### Events vs Attributes
- Custom events are different from custom attributes
- If we want to add a piece of custom data to that transaction, that's called setting and attribute
- If we wanted load time for every image on a page
  - We'd need a custom event table
    - Only way to view it would be in `Insights`
- We can either change an event, or the attributes of an event we're already capturing
- We could add custome attributes to existing events to capture sprecific data on a user experience
  - Use `Set Attribute` to accomplish this
  - This could be used to capture which features each customer is using
    - To identify which are popular, and which are not

### Advanced `NRQL`
- NR ONE supports advanced `NRQL` queries, in much the same way as Insights

### React-Native
- This cross-platform framework poses certain challenges for NR
- NR ONE supports use-cases for JavaScript frameworks, such as this one
  - Capture JS crashes
  - Use bridging queries to accomplish this
    - Pass data from one dashboard, to another
- Can create linkages inside the dashboard, while not exposing it to users such as managers
  - This way, they'll be able to poke around without breaking anything

### Sharing Graphs
- Clicking `Embed` allows us to post an NR graph on our own website
  - This will be dynamic, updating in real-time
  - Works by `iframe`
  - Available to embed in any HTML page

### Adding Notes
- We can add notes to that section of a dashboard
  - This creates a snapshot of a current graph
  - These can be shared with specific users
  - Useful for sharing snapshots between teams

# New Relic Futurestack - Main Event - 2019-09-19

## Keynote 
### __Speaker:__ _Lew Cirne, CEO & Founder of New Relic_

### New Product Announcements

#### 1. Metrics
- Collect metrics data
- Convert divergent sources to a consistent format
- Ingest all metrics into the New Relic `ONE` platform

#### 2. Traces
- Offers a more complete view of distributed systems
- Enables injection of trace data from services without New Relic agents

#### 3. Logs
- Combines log data with application an system performance data
- Correlate data with `APM Infrastructure` events
- Integrates with Kubernetes, and numerous of other such services

#### 4. AI
- Enhances incident response times for busy DevOps & SRE teams
- Early customers have reduced alert noise by more than 80%

#### 5. Platform Programmability
- New Relic `ONE` platform is now fully programmable
- "Imagine it, build it"
  - Full business visibility
  - Cost efficiency
  - Customer experience
  - Technical Optimization

#### 6. Cloud Optimize
- Searches across all New Relic accounts
- Marries data with the Amazon price-list
- Allows us to visualize and pinpoint over-provisioned hosts
- Potential for million dollar savings opportunities, if this data is leveraged correctly

### Other New Apps & Initiatives

#### FutureHack 0.1
- A hackathon session with the goal of building 6 new open source apps 
  - They built 12 instead
    - Each of which will be available for any customer to use
  - These will be available from NR ONE homepage
    - Via launcher widgets

#### Network Telemetry
- Visualization software 
  - Any app that emits `ipfix` or `sflow` data

#### Neon
- Build dashboards simply by defining 
- Powerful way to summarize high-level view of what's going on with your business

#### Container Explorer
- Displays a grid of all containers associated with our app
- Allows us to drill down into containers
  - Individual metrics available for each
  - Uses `GraphQL`

#### GitHub Integration
- Allows us to pull data directly from GitHub repo, into New Relic ONE
  - Shows README
  - Shows list of frequent contributors
- This way, when dealing with micro services, we can pull details effortlessly, without needing to dig around

- Compare performance of any variation of software version running in production

#### Site Analyzer
- Shows the business impact of a customer experience on a site
  - Identify the true cost of poor performance
- Calculates the bounce rate for frustrated customers
- Breaks experience down as
  - Satisfied
  - Tolerated
  - Frustrated

#### Tools for Programming in `ONE`
- React
- GraphQAl

#### Customer Journeys
- Aligns multiple cohorts of data into a common funnel alongside cohort (column) and step (row) metrics.

### Summary
- New Relic `ONE` is centric on open-source tools
  - We could now theoretically leverage their platform, without using a single one of their agents
- New Relic is very different now than it has been in the past
  - It's now a proper platform, which we can write software on
  - All open-source modules are available today, for free
- The overall aim is to __build more perfect software__

## Customer Session
### __Speaker:__ _Chris Dillon, Vice President, Architecture, Cox Automotive_
### __Speaker:__ _Georgina Owens, VP IT Services , DAZN_

### Cox Automotive Thoughts on NR Integration
- Believes the future is that consumers will buy cars directly from the manufacturer
  - Like Tesla
  - Studies show consumers don't like to buy cars from a dealer
    - But they're typically forced to anyway
  - Cox aims to help drive this technological transformation
- Implemented _scaled Agile software_ across all their services
- Chose AWS as their cloud provider
  - Has created commonality across their services
  - All new software from all their teams, is built around AWS
  - Are rapidly consolidating their data centers
    - want to get it down to three total centers
  - AWS provides an on-ramp to teams
    - A place to look at how to upscale their tools
    - One such tool is NR
- They aim to keep new tools very easy to adopt
  - They like NR, because they can get a new team integrated within an hour
  - They wanted to move faster, and respond to the business more quickly
- ~ 6 years ago, AutoTrader was basically the only one in their industry
  - Disruptors came along subsequently, 
    - They aimed to create a whole new stack around AutoTrader
      - Using AWS
      - They never could have strung together these resources with on-site architecture
    - Being able to spin up a new cluster rapidly totally changes the game for them,.
- Tools like NR allow them to measure performance in a way not possible before
  - Holds teams accountable for the performance of each service
  - NR alerts can be triggered to alert teams of issues, in real-time, before the ramifications get too devastating
- NR helps them link raw data, to subjects the business actually cares about
  - Visualizations allows executives to take a hands-on role in low-level tech details
    - NR really supports the case for this
- First step in their long journey towards system-wide data unification was to define a detailed roadmap
  - A path to got from 60 data centers, to only 3
  - The destination's important, but the checkpoints along the way were equally so
- One of the largest challenges has been to tailor unified tools for a diversity of team types
  - NR is diverse enough to give their teams some autonomy, to choose which tools work for them
    - Also which tools are actually relevant to their flow

## AWS Migration, Modernization, and Optimization
### __Speaker:__ _David McCann, VP, AWS Marketplace_

### Core message
- Focus on differentiating your company
- Innovate at start-up like speed
- Migrate under your terms
- Reduce risk
- Every modern company wants to behave like a startup, int wrms of innovation
  - AWS helps facilitate such innovation
- AWS has over 165 services today
  - They add ~ 2 new services each month
  - A typical customer uses between 40, and 120 services
  - They also have a marketplace, where they integrate with third-party applications and services
- Millions of apps will migrate to the cloud in the next 3 years
  - This requires decisions to be made
  - Day observation is key to managing these decisions
  - NR aids AWS  in this
- Migration is a major tech concern these days
  - Opportunity to make apps more agile
  - Allots an opportunity to redefine our operating model
- AWS recently acquired a service called TSO
   - TSO logic supports early phases of day migration
- Also acquired `CloudEnsure`
  - Facilitates efficiently moving data to the cloud
- Transforming the vendor portfolio
  - Cloud migration will usual cause a company to drop ~ 20% of its vendors
- AWS is consolidate these vendors
  - Under a single AWS bill
- New Relic has been crucial to Cox Automotive's AWS cloud migration
- The right cloud operation model can reduce risk to the company
- Monitoring enables agility and scalability
- Amazon `CloudWatch` offers complete visibility of cloud resources
 - Across the entire stack
- AWS service catalog provides broad API access
- Final outcome is an elastic, coat efficient, scalable, agile cloud environment

### Modern Software Systems Should Be
- Scalable
- Server-less
- Containers

### A Successful Migration Should Include
- Governance
- Deployment
- Management

## Moving to Entity-Centric Observability with New Relic `ONE`
### __Speaker:__ _Nadya Duke Boone, VP & Product GM , New Relic_
### __Speaker:__ _Glenn Nethercutt, Chief Architect & Technical Fellow, Genesys/PureCloud_

### Car Metaphor for Architecture
- An expensive sports car cs Grand Cherokee
  - Is fun to drive and powerful
  - Not very practical
- A Jeep Grand Cherokee
  - Is slower
  - More utilitarian
- Data collection and observability tools can have similar divergent attributes

### F1 Pit Crew Metaphor
- Each member of a pit crew team has a specific role to play
  - They all work together towards to common goal of winning ht race
    - Regardless of their individual role
  - The same is true of teams working for companies
    - Everyone woks towards the goal, while performing their own specific duty

### New Relic `ONE`

#### Entity Observability Platform
- Observability principles include __Monitoring__ and __Answerability__
- Entities sit at the top layer of an observability diagram
- Feeding the entity, is the following
  - Metrics
  - Events
  - Logs
  - Traces

#### Common Questions It Can Help With
- What's making my customer unhappy?
- How did my deployment go?
  - This is easiest to visualize when we can see a data-point on a chart
    - Rather than with a raw aggregate of all numbers available

#### Workloads
- There might be a set of systems that support each different sector of your business
  - Different ones might apply to different teams
- The new New Relic `Workloads` feature can help solve this issue
  - Provides real-time metrics, all in one centralized location 

#### Genesys `PureCloud` Representative
- Genesis is a customer experience platform
  - Employs ~ 5000 people
  - ~ 11,000 customers
- Works by embedding an ever-expanding variety of new cloud technologies
- Driven by micro services, and events
  - Made that transition fairly early in the trend
- They see observability as one of their most important assets
  - Use NR to accomplish this
- It's general impossible to properly improve anything, without first having data on what needs improving
  - It's best to start with a question, then work towards the answer in pieces
    - Great questions are a powerful tool

Defining the Principles, Habits, and Practices of Site Reliability Engineering

## Generating Context From Your Log Data
### __Speaker:__ _Julian Giuca, Product GM & Principal Software Engineer, New Relic_
### __Speaker:__ _Jené Scott, Software Engineer, New Relic_

### Why Logs?
- Logging is a powerful tool for engineers, and Ops professionals
  - Logs can be painful, and NR wants to provide something better
  - Sometimes we pay for the best logging tools available, but even the company's engineers can't use them effectively
    - Often, this requires dedicated teams to manage such logging

### Design Principles of NR Logging
- Scalable
- `NRDB` powered
  - Powerful injection pipeline
- No Indexes
  - Eliminates the need to set up indexes ahead of time
  - Makes searching lightning fast
    - Query terabytes in seconds
  - Approachable
    - Fast search is more forgiving
    - All your data in one place
    - Built on open source tools we already use
    - 5/TB free `Logging` trial available now
- Connected
  - Same log data, new way to use it
  - NR is inside your applications, we can connect it all together in a consumable way

### Demo
- Go to `Logs` module in NR ONE
  - Search simple terms
    - "warn"
    - "nomethoderror"
  - Allows us to quickly search, and view associated graphs in real-time
  - Their system will help us automatically zero in on one type of data
    - taking the hard work out of querying and viewing logs
- Cloud and log forwarders
- The following cloud services can feed into `Logging` directly
  - Kubernetes
  - AWS `CloudWatch`
  - Lambda

### Long Term Vision for `Logging`
- They want to take the pain out of logging
  - So it's easier than ever before to find exactly what you're looking for
  - Sop it's simpler to fee log data into their system

### Current Selling Points
- Anyone can send up to 5TB/day, for free
- Data retention of 8, 15, or 30 days available
  - Since this was built specifically for developers, it's focused on shorter-term retention periods
  - As time goes on, if the demand's there, they may increase retention rate
- Support for many languages
  - They intend to have include support for all major web languages within the next six months
  - They already have support for most modern languages
- Very specific alert triggers can be configured
  - To alert in the case of any event of interest
- Their beta customers didn't change their overall logging behavior much
  - They continue to log everything
    - Following the typical premise of "covering your ass"
  - Time spent querying and reading logs was greatly reduced for customers testing the Beta

## Defining the Principles, Habits, and Practices of Site Reliability Engineering (_SRE_)
### __Speaker:__ _Tori Wieldt, Senior Solution Strategy Manager, New Relic_
### __Speaker:__ _Boris Grinberg, Director, GE Monitoring Product & Engineering Leader, GE Digital_
### __Speaker:__ _Anjeneya Dubey, Senior Director of Engineering Site Reliability, Performance and Capacity_

### Panel included reps From:
- McGraw-Hill
  - Which is no longer a publication house
  - Is now focused on all aspects of digital education solutions
- GE Digital
  - Now managing software across multiple industries, including:
    - Aviation
    - Electrical systems

### Benefits of SRE
- SRE is applying software principles to operations
  - Everything in operations is becoming code-oriented
    - Automation opportunities are everywhere
- Embedded SREs are becoming more common
  - Someone on the team who's focused on reliability

#### SRE vs DevOps
- DevOps is more of a philosophy, focused on delivering things quickly
  - SRE is more focused on reliability
- Both should be interested in how efficiently they're using resources, as a general rule
- They encourage SRE professionals to involved in sprint planning meetings, as well as daily Scrum
- SRE equates to usability
  - If the outcome is useless to customers, we've gone too far and done too much
  - It's important to be able to easily show them the value

## After Lift & Shift - What Does Successful Modernization Take?
### __Speaker:__ _Kevin Downs, Principal Solutions Strategy Manager, New Relic_
### __Speaker:__ _Josh Biggley, Senior Engineer, Enterprise Monitoring, Cardinal Health_
### __Speaker:__ _Javier Miguez, Director, Technology Operations, Fleet Complete_

### Deprecation Steps
- Retire
- Retain
- Repurpose

### Modernization Steps
_these account of ~ 75% of work and improvements_
- Re-host
- Re-platform
- Refactor

### Benefits
- Lower costs
- Improve infrastructure
- Speed up development

### Thoughts from a New Relic Customer at Cardinal Health
- Provides necessary support to help navigate complex healthcare landscape
- Is presently involved with cloud migration
- They deliver medical supplied and solutions to over 80% of US hospitals
  - Conducted lift & shift in some situations
    - In others, they use cloud migration as an opportunity to refactor and optimize
- Their main objective is to have one consistent platform, across all their disparate systems
- Their teams have rebranded SRE to mean _Service Reliablility Engineers_
  - Rather than _Site Reliabilty Engineers_

### Thoughts from a New Relic Customer at Fleet Complete
- Their system incorporates a whole bunch of data centers throughout the world
- They use New Relic, as well as a multitude of other tools
- Have been consolidating their platforms, by shifting to the cloud in recent years

### Next Steps
- Improvements
  - Some companies can reduce up to 97% of their costs, for just one application
- Ideas
  - Access to data insights should lead to great new ideas
- Optimization
  - We should never stop improving our systems

### Risks
- Dependencies
- Automation
- Customer Experience
- Unexpected Errors
- Incompatibility
- Extensive Changes
- Expected Outcomes

### Steps to Continuous Application Modernization
1. Set goals
2. Understand problems
3. Design approach
4. Leverage observability
5. Repeat

### Thoughts of Modernization
- Modernization & DevOps tend to feed each other, and be almost interchangeable
- Shifting to smaller teams can hep with this
  - Focus on what the customers need delivered
  - Expose the team to the data they need to make informed decisions

### Examples of Defining Goals
- We want to increase revenue
  - Approach: Respond faster to business
  - Outcome: Drive revenue
- We want to improve profitability
  - Approach: Optimize IT  coses
  - Outcome: Reduce service costs
Improve customer experience
  - Approach: Improve quality & performance
  - Outcome: Improve satisfaction
Grow market share
  - Approach: Outpace competitors
  - Outcome: Increase customer base

### Corporate KPIs
- Perceived load time
- Error percentage
- Crash rate on mobile crash Rate

### Approaching Modernization
- Understand the risks
  - and how to mitigate them
- Use an informed approach
- Conduct compatibility analysis
- Gain a deep understanding of all system components
- Use data before, during, and after the process is complete

### Reasons for Re-Platforming
- Increase scalability
- Increase reliability
- Enhance performance
- Reduced costs

### What to Consider when Re-Platforming
- End-user experience
- Application performance
- Application dependencies

### Reasons to Refactor
- Improve code quality
- Integrate new features
- Enhance Customer experience

### Considerations for Informed Refactoring
- What changes need to be made?
- What issue are we addressing?
- How will our infrastructure change?
- What will be our speed of deployment?
- Any relevant business KPIs
- Identify any system bottlenecks
  - and to speed them up via refactoring

### Types of Refactoring
- Code improvement
- Deployment model
- Technology refactoring

### Observability
- Before
  - Evaluate
  - Plan
- During
  - Modernize
- After
  - Optimize

### Repeat
- The above processes should be repeated in perpetuity
  - Even if you think performance is good enough already
    - Don't let the end of the project mean the end of all modernization/optimisation efforts
  - We should redefine our definition of _done_
    - Even when it comes to aspects like a feature story

## Multidimensional Kubernetes Monitoring with New Relic
### __Speaker:__ _Stijn Polfliet, Principal Technical Evangelist, New Relic_
### __Speaker:__ _Kyle Weaver, Senior Platform Developer, SRE, Gannett_

### Kubernetes Basic Functionality
- Allows us to easily schedule our workloads across our cluster
  - Also to move workloads to a different cluster, or part of cluster
- Scalability
  - helps us to scale our environment, if we get more users, or something else changes
- Using Kubernetes can be scary
  - But it requires the right tools and knowledge to do so comfortably

### Identifying Parts of the Environment
- Components of a Kubernetes cluster
  - Node
  - Pod/Deployments
  - Applications
  - Containers
  - End-User Experience
  - Supporting Infrastructure
- We want visibility into each layer of our stack

### Three Steps to Observability
1. Kub-stat-metrics
  - Service that generates metrics for objects
2. New Relic Integration
  - Deploy a `DaemonSet` with New Relic `Infrastructure` Kubernetes integration
3. New Relic `Logging`
  - Configure log forwarding to New Relic

### _USA Today_ Testimonial

#### Scaling Efforts
- They're a customer of Kubernetes
- Some of the most intense days for them revolve around planned events, such as on election day
  - Load test accordingly ahead of time
  - Scale up before the date
  - Keep a war room active to monitor system performance while the event takes place
- The scariest times for them revolve around unplanned, breaking news events
  - New Relic & Kubernetes engine is most useful during these times
  - In events, like the Notre Dame fire, they actually ran out of pods
    - They didn't yet have any alerting on such maximized load events
  - New Relic dashboards are their first line of defense against maxing out usage, and facing a possible outage
  - Such Dashboards can help keep track of:
    - Counting origin pods
    - Latency
    - Missing pods
    - Origin transactions
    - External transaction load time

#### Lessons Learned
- Diligently customize, understand, and monitor Kubernetes limits
  - Be mindful of how many resources you have available at any given time
- Configurations are not static
  - Changing expectations result rapid code delivery
- Set SLOs at a cluster, namespace, and service level
  - Review quarterly

## Getting to Faster Incident Response with Applied Intelligence
### __Speaker:__ _Guy Fighel, VP & Product GM , New Relic_

### General Info
- Interestingly, we miss tend to miss details in content we study the most
  - Anything that doesn't match the patterns we expect tends to be completely overlooked
    - A study on x-ray technicians showed that experienced technicians usually missed a picture of a gorilla superimposed somewhere on the brain

### Human-Driven Detection
- Set thresholds to find patterns
  - Simulate based on known metrics
- Use percentiles and other basic stats
- Tends to involve too much data, with too few resources
  - Too many systems and dashboards
    - Too little time for mundane tasks
    - Constant shortage in resources
- Response Fatigue
  - As we aggregate data, all of us tend to be handling massive amounts of information
    - These eventually lead to an increase in time needed to respond to those incidents

### Human vs Automated Incident Management
- The unknown unknowns, those that aren't even on our radar, are the one's we're almost sure to miss
- To help identify unknowns, machines can apply the following;
  - Natural language understanding
  - Statistical analysis
  - Unsupervised / supervised learning
  - Reasoning , inference
  - Recommendation modelling
  - Knowledge representation
- It's now possible to enable a high-functioning system that replicates, augments, or assists in human intelligence for a dedicated purpose
- New Relic `AI` is a suite of solutions, which runs on top of New Relic `ONE` platform
- Easily connects any data source
  - Pull information from anywhere you need
  - Allows NR alerts to be set, based on what you're interested in
- This system flips the pyramid in terms of how we hand Ops processes
- Provide a single API key to AI platform
  - State is automatically synced from all services, to the centralized NR platform
    - In addition to the New Relic data itself
- The world of SRE and DevOps teams is all about fast responses
  - We want to test how we can reduce the time to resolve, detect, understand, and resolve

### SRE Steps
- Configure
- Detect
- Refine & Assign
- Respond
- Retrospect

### Actionable Detection
- Meaningful information can be derived from Machine Learning
  - ML models replace manual guessing and faceting
- Finding unknowns delivered in your workflows
  - New Relic is working towards proactive detection
    - Including notifications on the same
  - Engines run on all the different metrics
  - AI monitors for all anomalies
  - Slack integrations are available, to message anomalies to Slack channels,
    - Presently in private beta
  - Can also setup specific alerts to be delivered to a Slack channel

### Alert Classification
- Apply ML models to automatically classify the golden signal and the component of new alerts, in real-time
- The sum of these parts is a lovely UI in NR `ONE`, detailing all the anomalies their system detected
  - Allows admins to react much faster than they would with manual data analysis
- Continuous improvement
  - Throughout the entire journey, they provide a beautiful experience to engage the user
    - The system also learns from your team's expertise
    - Issue recommendations are automatically suggested, to eliminate the root cause of the issues
      - It will learn to perfom better as time goes on

### New Relic AI
- Solve problems faster with automatised detection, analysis, and noise reductions
- Reduces noise faster than any other software option
- Continuously improves correlations
- Leverages augmented intelligence
- Supports automatic transformation of data types
- Supports browser observability
- Platform agnostic
- Helps us solve problems faster, with more confidence
  - Response from Beta customers thus far has been very positive
    - System has benefited their company performance tremendously

