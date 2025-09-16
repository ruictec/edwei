

## 技术栈

- **后端框架**：Spring Boot 2.1.8, Spring Cloud Greenwich.SR2
- **数据库**：MySQL 8.0, Redis 缓存
- **ORM框架**：MyBatis 1.3.2
- **消息队列**：MQTT
- **日志框架**：Log4j2
- **部署工具**：Docker-compose

## 快速开始

### 前置条件

- Docker-compose

### 安装

## 重要说明

- 使用root权限进行操作
- 构建项目需要在edwei目录下操作
- 确保端口没有冲突
- 确保redis文件的操作权限
- 修改/edwei/configuration/nginx/nginx.conf文件中的地址example.com
- 修改/edwei/.env文件中EUREKA_SERVER_IP的值为服务器ip

## 证书配置

- 在/edwei/certs/目录放置证书
- 修改/edwei/configuration/nginx/nginx.conf文件中关于SSL的配置

## 部署步骤

```
# 构建镜像
docker-compose build
# 启动容器
docker-compose up -d

```
## 二次开发部署

- 打包前端代码生成static和index.html文件
- 替换/edwei/configuration/nginx/html目录下的static和index.html文件
- 修改/edwei/configuration/nginx/nginx.conf文件中的配置

## 项目结构

```
edwei/
├── configuration/       # 项目配置目录
│       ├── chirpstack/
│       ├── chirpstack-gateway-bridge/
│       ├── mosquitto/
│       ├── mysql/
│       ├── nginx/
│       ├── postgresql/
│       └── redis/
├── data/                # 数据目录
│     ├── mysql/
│     ├── postgresql/
│     └── redis/
├── file/
│
├── config/              # 证书配置目录
│   └── config.properties
│
├── certs/               # 主机证书目录
│
├── log/                 # 项目日志目录
│
├── dockerfile
│
└── docker-compose.yml

```

## 项目下载

## API接口

**鉴权参数**
| 参数名 | 参数类型 | 说明 | 是否必填 |
|--------|----------|------|----------|
| ts | String | 时间戳 | 是 | |
| tenantid | String | 公司识别号 | 是 |
| siginfo | String | SHA1加密信息 | 是 |

**鉴权说明**  
- 鉴权参数需要放在请求头里面
- 登录平台在用户管理中公司信息列表中获取tenantid、tenantkey
- get请求siginfo值：path + tenantkey + ts的SHA1加密信息
- 非get请求siginfo值：path + body + tenantkey + ts的SHA1加密信息
- path示例：/v1/devices/xxxx

**接口地址**  
- 用户模块地址为：/v1/user/xxxx
- 设备模块地址为：/v1/devices/xxxx
- 定位模块地址为：/v1/map/xxxx

## ChirpStacK

**账号信息**
- ChirpStacK管理员账号为：admin/admin

**创建Key**
- 在API key界面创建并记录key

## 定位平台

**超级管理员**
- 平台默认超级管理员账号为：admin/admin@2025
- 用超级管理员登录创建的采购公司信息为二级企业信息

**企业管理员**
- 企业管理员注册需要通过超级管理员获取注册码
- 账号需要在登录页面进行注册
- 可以管理三级客户信息
- 可以在项目管理页面创建管理项目信息

**三级用户**   
- 用户可以登录平台管理该公司下的所有项目
- 管理各项目下的人员信息
- 监测各项目下的设备状态

**LNS配置**
- 添加ChirpStack信息位置在NS管理页面
- 域名和ip都为chirpstack
- 端口号为8090
- 访问用户填写root
- 访问密码用ChirpStacK中创建的key
- 证书默认选No
- 订阅消息地址为tcp://IP:1883
- 上行数据topic为：application/{{application_id}}/device/{{dev_eui}}/event/{{event}}
- 下行命令topic为：application/{{application_id}}/device/{{dev_eui}}/command/{{command}}
- 用户名和密码默认为空


