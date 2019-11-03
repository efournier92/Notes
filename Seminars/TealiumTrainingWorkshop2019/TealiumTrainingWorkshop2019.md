## 19-10-29
# Tealium Training | Day 01

## Training Account

### Credentials

#### Email
pch19-011@tealium.net

#### Password
PCH19-011

### Ecommerce Training Platform

#### Url
http://www.tealiumecommerce.com/training

#### Account
education-craig

#### Profile
pch19-011

#### Group Key
1Bf6y6Lz2

### Educational Content

#### Url
http://education.tealium.com/

## Slides Location

### Domain
education.tealium.com

### Join Group
4EM4j1F4j

## Plugging into Tealium

### Collect
- Can be from basic desktop or mobile
- Even collect tags from a Foosball table in one instance
  - 1000+ turnkey vendor integrations in their marketplace

### Standardize

#### Data Layer
- Device type
- Client ID
- 0 Page URL

### Omnivendor Platform
- Tealium plays nicely with a lot of different vendors

## Tag Management Concepts

### Without Tag Management
- There are over 7000 marketing management platforms today
  - These can work different, and become cumbersome if hard-coding them all into client-side code
    - `TealiumIQ` eases this, by consolidating such tags

## Basics

### Universal Data Object
- `utag_data`
  - All page-specific details
  - This is _not_ necessarily the whole data layer
    - It's ~ 1/6 of the whole data layer
  - Is a plain JS object
  -  Business critical data needed at Page Load
    - Data to be passed to tags at Page Load
    - Data needed to evaluated Load Rules correctly
    - Data needed to fuel Extensions
  - Page-Type dependent
    - Not all data is needed on all pages
      - Don't include anything that doesn't need to be there

### `utag.js`
- Loaded asynchronously
- Controller file
- Collects and collates data from utag_data and other sources, into the data layer
- Contains load rules logic
- Contains most extensions
- May contain tag templates

## Design Our Data Latyer

### What is a Data Layer | Integrated Data Layer Components
- All data points available in any given web page
  - Universal data object
  - Query params
  - Cookie parameters
  - Meta Data
  - JavaScript page variables
  - DOM data

#### Grocery Store Analogy
- _Think of the six Data Layer components as aisles in a grocery store. We need some data from each aisle, in order to prepare a full meal at the end of the day._
  - Variable types are the aisles
  - Load Rules are the recipe
  - Extensions are the tools with which we cook

### Best Practices
- Avoid creating redundant variables
  - Have each data point represented only once
- Be as vendor-agnostic as possible, until we can't anymore
  - Reuse data elements if possible
    - Only create a GA-specific parameter unless absolutely necessary

## Architecture

### Basic Architecture

#### Benefits
- Simple
- Scalable
- Fault Tolerant
- Fast

#### Imporant Considerations
- __Save often, especially before leaving our desk__
  - Tealium session expires after 20 minutes
  - We may lose our work

#### Tags
- Client-side
- _JavaScript_

#### mCDN
- Tag Delivery
- Speedy

#### SAAS
- Web App
- Build & store configurations

### Save & Publish

#### Publish To
- DEV
  - Last published version
- QA
  - Last published version
- PROD
  - Changes will be public-facin

### Code Center
- Outlines all the code we may want to include on our site

## Use case: Initial Tag Conifguration

### Add a Variable
1. https://my.tealiumiq.com/
2. Sidenav > Data Layer
3. `+ Add Variable`
  - Tag names are case sensitive
  - Other fields are simply descriptions to help the rest of our team

### Bulk Import from CSV
1. https://my.tealiumiq.com/
2. Sidenav > Data Layer
3. `+ Add Variable` > `Down Arrow` next to button
4. `Bulk Import from CSV`

### Add Common Variables
1. https://my.tealiumiq.com/
2. Sidenav > Data Layer
3. `+ Add Variable` > `Down Arrow` next to buton
4. `Add Common Variables`
5. Choose a relevant bundle
6. Click `Import this Bundle`

### Fliter Variables
1. https://my.tealiumiq.com/
2. Topnav > `Filter`

### Saving
1. https://my.tealiumiq.com/
2. Topnav > `Save / Publish`

##### `Save`
- Will overwrite our current version

#### `Save As`
- Will create a new version
- Recommended whenever possible
  - Unless we're just fixing an issue

#### Publish
1. Select some or all of the environments listed in the modal

### `_c` Variable
- Is a common convention, expected for e-commerce platforms
  - Expected by GA, Adobe, etc

### Viewing Data

#### Web Companion
- Install `Tealium Web Companion` extension for Chrome
  - Data can be viewed in that modal- 

#### Console
- Open Console from Chrome Developer Tools
  - Input `utag.data`
    - Or `utag_data`
    - The two will be identical, once JS on the page is done loading

### Adding Tags
1. https://my.tealiumiq.com/
2. Sidenav > `Tags`

#### Tag Configuration
1. Select a tag version from `Tag Marketplace`
  - Click the green `+Add` button
2. Ensure all `Publish Locations` are toggled to `Yes`

#### Load Rules
- Define when the selected tag should be fired

#### Data Mappings
1. Take variables from vendor-agnostic data layer
  - Map them to vendor-specific variables
2. _Use `Variables` dropdown to enumerate available variables_
  - We can also add a variable from this modal
    - Click `+ Add Variable`
3. Use modal tools to map data layer variables to destinations
4. Add custom destinations by clicking `+ Add Custom Destination`
  - Either in topnav, or bottom of sidenav
5. Select `Done`, then `Save`
6. Click `Save As` to save a new version
7. Publish to the relevant environments

### JS Files
- Explore files in the `Chrome Developer Tools` `Network` panel
- Tealium tags will be name (utag.{Tag_Uid}.js)
- Find `GA` file by searching for "Google", or "Analytics"
  - Typically searching by the provider name will yield the best results

## Load Rules

### Load Conditions Logic
- Run tags conditionally
  - AND
  - OR
  - Dates
    - Time restrictions 

### Add Load Rule
1. https://my.tealiumiq.com/
2. Sidenav > `Load Rules`
3. `+ Add Load Rule`
4. Modal tools allot us the ability to define logic, expressing when we want the load rule to run

#### Best Practices
- Ideally, use `UDO` variables for rule logic
- DOM variables can work too, if necessary
- We can chain logic together, by applying `AND` conditions after thre rule
  - Click the blue `+` button

## Extensions

### Overview
- Help us massage and manipulate data
- Read TLC docs to see `Mater List of Extensions`

### Add Extension
1. https://my.tealiumiq.com/
2. Sidenav > `Extensions`
3. `+ Add Extension`
4. Select Extension type from tabs at top of modal
5. Click green `+ Add` button next to the extension we want to utilize

### Extension Types
- Lower-Casing
- Set data Values
- Persist Data Value
- Previous Page
- Join Data Values
- Hosted Data Layer
- Lookup Table
- Pathname Tokeniser
- Crypto Extension

### Conditions
- Work like Load Rules
  - Define conditions under which our Extension should be run

### Advanced Extension Types
- E-Commerce
- Domain-based Deployment
  - Load QA of DEV version to our Tag Deployment, based on host name
- Channels
  - View customer's journey across multiple channels
- JavaScript Code
  - Publish JS code without a deployment
- View-Through Tracking
  - Configure a cross-domain view-through tracking pixel, for use in ad creative
- Content Modification
  - Change the content of an HTML element
    - Used to show A/B content, based on a condition
- Modal Offer
  - Enables insertion of a modal overlay on any pages
  - Alert users of offers, promotions, etc
- Flatten JSON Objects
  - Flatten out nested JSON objects
- Data Validation
  - Trigger errors for incorrect data values on a specific page
- Split Segmentation
  - Randomly assign visitors into segments
  - Can be used for A/B testing

### JavaScript Extension
- Allows us to inject custom JS into any page
- Can create draft versions
  - To negate the chances of publishing a breaking change
- This feature is dangerous, and should be used respectfully
  - Permissions can be adjusted to block certain users from using this feature
- Any valid JavaScript an be add 
- Tags are recorded logging the time and user who published the changes
  - For finger-pointing purposes
- JS extensions support advanced use-cases
  - Virtually any logic that's not natively supported by Tealium, can be accommodated via this extension
- __Do not tag templates in JS extensions__
  - Such templates should be fed directly from Tealium Tag marketplace

## 19-10-30
# Tealium Training | Day 02

## Order of Operations

### Load Order
- _`utag.sync` is loaded, if applicable_
- _`utag.data` is inserted into the `<body>`_
1. Pre-Loader
2. Data Layer
3. Load Rules
4. Vendor Tags
5. DOM Ready
6. `utag.view`
- _`utag.link` fires afterwards, if applicable_
  - Tracks interaction events, as per configuration

### Extension Scope

#### Pre-Loader
- Run before the data layer is processed

#### All Tags
- Applies to all tags, runs before/after load rules and after tags fire

#### Tag-Specific Scope
- Applied to specific tags
- Runs before tag is fired

#### Dom-Ready
- Is fired when instal HTML document has been completed loaded and parsed

### Extension Load Order
1. Pre-Loader Extensions
2. Data layer
3. All Tag Extensions
  - BLR
4. Load Rules
5. All Tag Extensions
  - ALR
6. Vendor tag Extensions
7. All Tag Extensions After Tags
8. DOM Ready Extensions
9. `utag.view`

### Data Object Access
1. `Preloader`
  - `utag_data`
2. All Tags | `TagScope`
  - `b` object
    - A local copy of the data layer
    - Example: `b.product_id`
3. Load Rules
  - `d` object
    - We should seldom need to worry about the `d` object
4. DOM-Ready
  - `utag.data`

### Load Order Manager

#### Description
- Reorders our load rules for us automatically
  - Enabled at an account level
    - Cannot manually sort order after enabling
    - Disable to manually sort again
- _Useful when we have a high number of loaders_
  - _Makes it more difficult to manage one-offs_

#### Steps to Enable
- Sidenav > `Client-side experiments` 
- Turn ON `Load Order Manager`

## Consent Manager

### Configure Globally
- Topnap > Account Menu > Global Consent Customization

### Configure Per Profile
- Sidenav > Consent Management > Explicit Consent Prompt > Get Started

### Explicit Consent Prompt Configuration

#### Content
1. Select language
2. Populate inputs with content relevant to our site's privacy info
- _Takes a paint-by-numbers approach to configuration_

#### Customization
- Settings to customize the consent prompt

#### Display Rule
- Configure rules on when to display the prompt

#### Options
- Configure event logging
- Define tags to omit based on customer consent choice

### Consent Preferences Dialog
- Groups tags into categories
  - Users can opt out of any category they don't want to share analytics on

#### Content
- Configure dialog content
- Add supported languages according to our site's needs

#### Customization
- Define opt-out categories
  - Populate inputs with column labels, category descriptions, etc
- Click preview to view our changes

#### Categories
- Based on Tag Marketplace categories
- Configure which category each tag should be grouped in

#### Options
- Keep or remove Single Cookie Restriction
- Configure default opt-ins
  - How switches should appear on load of prompt

## Use Case: Custom Tags
- Tealium will add a tag to their marketplace at our request, if we have time to wait
  - We pass requirements for a new provider over to Tealium
  - Usually takes a couple weeks
- If we don't have time to wait, we can add a generic tag
  - This is a catch-all, which can be used for almost any provider

### Generic Tag Configuration

#### Tag Configuration
- Select `Generic Tag` from Tags Marketplace
  - Open the `Edit` panel for that tag
- Choose type
  - Image
  - Script
  - etc
- Configure base URL
  - Point to `gif` file, if is of type Image
- Optionally override for HTTPS
- Query String Delimiter
  - Symbol on which to split query string values
- Parameter Delimiter
- Key/Value Delimiter
- Query String
  - Hard-coded values to supply in query string
  - Example: `account=12345&segment=1`
- Cache Bust Name
  - Value to cache bust against
    - Typically defined by the vendor we're integrating

#### Load Rules
- Configured just like other load rules examples

#### Data Mappings
- Unlike in other mapping modals, this one only offers a `Custom Destination` field
  - Because we don't have visibility into that vendor's requirements

#### Managing Templates
1. Create custom template from the Tags Marketplace
2. Topnav > Account Dropdown > `Manage Templates`
3. Configure our custom template options per our specifications
- __Version Tag Template will always take presedence over the Profile Tag Template__
  - It's usually best to only make changes to version
    - If we ever intend to 
    - We can use a Profile template if we expect it to remain static
- Saving tag template changes occurs immediately on change
  - Will not lose changes on refresh
  - Does not require explicit Save/Publish like other changes do
    - However, changes won't be live on our website until we publish them

## Event Tracking

### Description
- Dynamic events can include anything that occurs _after_ the initial page load
  - Link/button clicks
  - Video interactions
  - AJAX content refresh

### Page view Events
- `utag.view()`

### Interaction events
- `utag.link()`

## Sync
- `utag.view(data_object[, callback, uid_array]);`
- `utag.link(data_object[, callback, uid_array]);`

### Parameters

#### `data_object`
- A JS object containing the relevant page view data

#### Callback
- A function to be called after the tags have been fired
- _Optional_

#### `uid_array`
- Indicate the specific tags to fie
- _Optional_

### Special Variables
Use special variable to identify the different types of pages and events to be tracked in our application

### Examples

#### Shopping Car Funnel
```javascript
utag.view({
  "page_type": "checkout",
  "checkout_step": "shipping",
  "page_name" : "Checkout: Shipping Address"
})
```

#### Add to Cart
```javascript
utag.link({
  tealium_event: "cart_add",
  "product_id" :  ["PROD123"],
  Product_quantity: 2
})
```

#### Fire a specific tag
```javascript
utag.link({
  "tealium_event": "custom_click",
  "link_name": "logout",
  "link_category": "header",
  }, function() {}, [42]);
```

#### Single Page Applications | SPAs Require Special Considerations

##### Override the view rule
```javascript
window.utag_cfg_ovrd = { noview: true }
```

##### Send a custom event
```javascript
utag.view({
  "page_type": "home",
  "page_name": "dstart",
  "link_category": "header",
  }, function() {}, [42]);
```

### `jQuery` Extension

#### Description
- Ideal for custom click tracking
- Use markup attributes to expose contextual data
- Easy to maintain within `iQ`
- __Requires `jQuery` to already be included on our website__
  - _Any third-party tool we've already included on our webpage_

#### Implementation Options
- Code as `utag.link` or `utag.view`
- Modals
  - Example: Product Quick View
- Ajax content refreshes
  - Example: Sopping cart funnel
  - Any even with server-side validation

## Testing and Troubleshooting

### Required Tools
- Web Companion
- UTag Monitor

### Checklist
1. Is Tealium `utag.js` coded on the page?
2. Are there console errors?
3. Are there 303 errors
4. Is our profile publish?
5. Are we looking at the most recent version?
  - Check Publish Data within web Companion
  - Look at timestamp in first line comment of `utag.js` file
6. Is the correct Profile being called?called?
  - Includes the `Environment` part
7. Are tag templates being delivered?
  - A filter within the Network panel on _utag_, then look for `utag.1.js`, etc
8. Are the vendor network calls made?
  - Filter within the Network panel on the Vendor's domain
    - or a part of the URL we're familiar with
10. Do the Load Rules match?
  - Domain [ends with]
  - Path [exact match]
  - Query Parameters [contain]
  - Hash [exact match __excluding__ the #]
11. Check the values in the Data Layer
  - `utag.js`
12. Do we have debug mode ON
  - Either thru `utag=dev`, or using the Tealium Tool
    - In console: `document.cookie='utagdb=true'`
    - In console: `document..cookie="utag_env_utag_poc#//tags.tiq.cdn.com/utag/poc/dev/utag.js"`
13. Check for spaces in `Load Rules`
14. Does the pathname start with a `/`?
15. Are the Tags set with the appropriate Environment flag?
16. Are the correct values coming out?
  - Are they mapped in the tag
17. Are the Extensions evaluating?
18. Are the Extensions in the proper Order?
  - Correct Scope on the Extension
  - Is the Extension set to Before Load Rules?
19. Does the code run in the Console without errors?
20. Do Breakpoints get hit, and values set in `Watch` statements

### Key Breakpoint spots in `utag.js`
1. Pre Loader
  - `utag.conload`
2. Load Rules
  - `utag.loader.loadrules`
3. All Tags
  - `utag.handler.extend`
4. DOM Ready
  - `utag.jdhc`

### Load Rule Gotchas
1. Often we'll see a "TypeError"
  - This will cause Load Rules to stop firing
2. Always check that a value is defined, before trying to use it
  - Especially for
    - `page_view`
    - `page_type`

### `utag.handler.iflag`
- The "Everything is OK" Flag
  - If we don't see that, we need to double-check our implementation

### `utag.loader.cfg`
- Provides status codes for each tab
  - `0` is success
  - `1` is fail
- _Ideally, we shouldn't need to go this far down the rabbit hole_

#### Properties
- `id`
- `load`
- `send`
- `tid`
- `wait`

## Administration

### Description
- Topnav > User Profile

### Creating a New Profile
- When creating a new profile, we'll get the option to copy any or all of the following from a preexisting profile
  - Variables
  - Extensions
  - Consent manager
  - Load Rules
  - Publish Settings
  - Tags
  - Users

### Deleting Profiles
- Deleting profiles requires special access permissions

### User Manager
- Use this modal to edit permissions for users within our organization
  - Admin users will have more options within this stool
- We can assign permissions for each user on a per-action basis

### Manage Tag marketplace Policy
- Limit available Tags from the marketplace selector
  - In case we don't have a provider for a particular vendor

### Manage Password Policy
- Configure rules for user password validation

### Manage Labels
- Only allow certain users to edit certain labels
- Best practice is to add labels sooner rather than later
  - Retroactively applying them can be a monotonous process
    - Might still be a useful part of our code cleanup, however

### Version Manager
- View past versions published to any environment
  - Allows us to revert changes if something gets broken
  - We can view all changes associated with each previously-published version

