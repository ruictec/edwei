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


