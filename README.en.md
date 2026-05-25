## Operating Procedures

- 1. Install Docker
- 2. Install Docker Compose
- 3. Change the value of EUREKA_SERVER_IP in the /edwei/.env file to the local IP address
- 4. Deploy the Edwei positioning service
- 5. Log in with the ChirpStack administrator account, create and record the API key on the Network Server API Key page
- 6. Log in with the super admin account of the positioning platform, add LNS information and create secondary company information
- 7. Register an administrator account for the secondary company
- 8. Log in with the secondary company administrator account to create tertiary companies, tertiary company user accounts, and projects
- 9. Modify the base station data address to the local IP address
- 10. Log in with the super admin account of the positioning platform, add information of base stations, terminal devices and beacons
- 11. Log in with the secondary company administrator account to assign terminal devices and beacons to corresponding projects
- 12. Log in with the tertiary company user account to upload and submit maps
- 13. Log in with the super admin account of the positioning platform to review the submitted maps
- 14. Log in with the tertiary company user account to create buildings and floors, deploy beacons, and add personnel information

## Registration Code
- 1. When the page displays the following message, the registration code needs to be updated.
- 2. Message: The registration file does not exist! The registration code has expired! The target quantity has reached the maximum limit! The equipment is illegal!
- 3. Under the super administrator "admin" account, the personal center page allows for the update of the registration code.
- 4. If the registration code has expired, you need to manually update the "edwei/profile/openRegister.txt" file, and then restart the rct-service service.

## Technology Stack

- **Backend Framework**: Spring Boot 2.1.8, Spring Cloud Greenwich.SR2
- **Database**: MySQL 8.0, Redis Cache
- **ORM Framework**: MyBatis 1.3.2
- **Message Queue**: MQTT
- **Logging Framework**: Log4j2
- **Deployment Tool**: Docker-compose

## Quick Start

### Prerequisites

- Docker-compose

### Installation

## Important Notes

- Use root privileges for operations
- Project building needs to be done in the edwei directory
- Ensure no port conflicts
- Ensure proper file permissions for redis files
- Modify the address example.com in /edwei/configuration/nginx/nginx.conf file
- Modify the EUREKA_SERVER_IP value in /edwei/.env file to the server IP
- Pulling the openjdk:8 image makes it more convenient to operate locally. Command: docker pull openjdk:8

## Certificate Configuration

- Place certificates in /edwei/certs/ directory
- Modify SSL configuration in /edwei/configuration/nginx/nginx.conf file

## Deployment Steps

```
# Build images
docker-compose build
# Start containers
docker-compose up -d

```
## Secondary Development Deployment

- Source address: https://github.com/ruictec/location_web
- Package frontend code to generate static and index.html files
- Replace static and index.html files in /edwei/configuration/nginx/html directory
- Modify configuration in /edwei/configuration/nginx/nginx.conf file

## Project Structure

```
edwei/
├── configuration/       # Project configuration directory
│       ├── chirpstack/
│       ├── chirpstack-gateway-bridge/
│       ├── mosquitto/
│       ├── mysql/
│       ├── nginx/
│       ├── postgresql/
│       └── redis/
├── data/                # Data directory
│     ├── mysql/
│     ├── postgresql/
│     └── redis/
├── file/

├── config/              # Certificate configuration directory
│   └── config.properties
│
├── certs/               # Host certificate directory
│
├── log/                 # Project log directory
│
├── dockerfile
│
└── docker-compose.yml

```

## Project Download

## API Interface

**Authentication Parameters**
| Parameter Name | Parameter Type | Description | Required |
|--------|----------|------|----------|
| ts | String | Timestamp | Yes |
| tenantid | String | Company ID | Yes |
| siginfo | String | SHA1 encrypted information | Yes |

**Authentication Instructions**  
- Authentication parameters need to be placed in request headers
- Login platform to get tenantid and tenantkey from company information list in user management
- For GET requests, siginfo value: SHA1 encryption of path + tenantkey + ts
- For non-GET requests, siginfo value: SHA1 encryption of path + body + tenantkey + ts
- Path example: /v1/devices/xxxx

**Interface Address**  
- User module address: /v1/user/xxxx
- Device module address: /v1/devices/xxxx
- Location module address: /v1/map/xxxx

## ChirpStack

**Account Information**
- ChirpStack address: http://IP:8080
- ChirpStack admin account: admin/admin

**Creating Key**
- Create and record the key in the API key interface under the Network Server

## Location Platform

**Super Administrator**
- Platform default super admin account: admin/admin@2025
- Company information created by super admin login becomes secondary enterprise information

**Enterprise Administrator**
- Enterprise administrator registration requires registration code from super administrator
- Account needs to be registered on login page
- Can manage tertiary customer information
- Can create and manage project information on project management page

**Tertiary Users**   
- Users can log into platform to manage all projects under the company
- Manage personnel information under each project
- Monitor device status under each project

**LNS Configuration**
- Add ChirpStack information in NS management page
- Domain and IP are both chirpstack-rest-api
- Port number is 8090
- Access user fill in root
- Access password use key created in ChirpStack
- Certificate default select No
- Subscription message address is tcp://IP:1883
- Uplink data topic: application/{{application_id}}/device/{{dev_eui}}/event/{{event}}
- Downlink command topic: application/{{application_id}}/device/{{dev_eui}}/command/{{command}}
- Username and password default to empty

**Add secondary enterprise information**
- On the 【User Management】 -> 【Purchasing Company】 page, add the information of the secondary company
- After adding the information of the secondary company, you can obtain the identification number of the secondary company

**Register as an enterprise administrator**
- Record the identification number of the secondary company
- Click the "Register" button on the login page to complete the registration process
- Note: The username cannot be in Chinese characters

**Synchronize LNS information**
- Log in to the Super Administrator account
- On the "Purchasing Company" page, click the "Sync" button and select the LNS option

**Add third-level enterprise information**
- Log in to the secondary enterprise administrator account
- On the 【User Management】 -> 【Purchasing Company】 page, add the information of the third-level company

**Add User**
- On the 【User Management】 page, click the "Add" button and select "User" to add user information

**Technical Email**
- Email: support@ruichuangte.com






