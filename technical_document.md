# System Design Document

### Task: Write an application that implements the following user stories:
● As a Director of IT, I want to be able to submit a pickup to Revivn for a specific
date and location
● As a Director of IT, I want to be able to track the status of that pickup

### Technical Requirements
1. API endpoints needed
  * POST /equipment/{id}/pickups
  * GET /pickups
  * GET /equipment
2. Dashboard to submit a pickup, and to track the status of any pickup previously created.
3. A piece of equipment can only have one pickup request


## Outside Scope
1. Design will not incorporate accounts, authentication + authorization.
2. Pickups will not generate a notification. Although we generally would want a pickup to notify
the appropriate systems so that the physical equipment is picked up, we are only storing the pickup request.

### Database Design

pickups
id serial primary key
address text
address_2 text
city text
state text
zip_code text
status text enum
equipment_id FK
created_at timestamp
updated_at timestamp

equipment
id serial primary key
serial_number text
manufacturer text
model text
created_at timestamp
updated_at timestamp

### High Level Design

Two new API endpoints will be created, serving JSON to a UI dashboard.
The director of IT will be able to select from a list of equipment, and request a pickup with a location.

# Outside Scope of high level design

The APIs will need to be deployed on at least two application servers with a load balancer to send the requests. This ensures
we have high availability if one server goes down. (Note, we can have a backup load balancer as well). Both app servers will
connect to a Postgres DB server, configured as a leader -> follower. That is we have a backup DB where writes will go to. In case
our DB fails or shuts down, we failover to the follower. But otherwise, all writes and reads will go to the primary database.
This simple 3 tier architecture should be sufficient for thousands of users. Since we are targeting medium to large size companies,
We can anticipate 1000 companies / accounts, with an average of 100 users and each having 1 piece of equipment. That leaves us with 100,000 pieces
of equipment.

Since an EOL for a piece of equipment may be around 3-5 years, lets round to 1000 days before a piece of equipment reaches EOL. This means,
if we are assuming an average of 100 pieces of equipment for company, we are averaging 100 pickup requests per day. The API and database will have no issues
handling 100 writes per day. However, we may receive 10 times the amount of reads as an equipment manager may look at the app and check for their pickup requests.
Still, if we average 1000 reads per day, that still only comes out to less than one read per minute.

### Detailed Design

API endpoints will be written with Rails API. Frontend will be supported by React.JS. Both will run in containers
alongside a Postgres container.

Unit testing will take place on the Rails API, and manual testing will take place with an end-to-end test for function.
