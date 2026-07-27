## 操作步骤

- 1. 安装Docker
- 2. 安装Docker-compose
- 3. 将/edwei/.env文件中EUREKA_SERVER_IP修改成本地ip
- 4. 修改/edwei/configuration/nginx/html/static/config.js文件中VUE_APP_TIANDITU_KEY的天地图配置
- 5. 部署edwei定位服务
- 6. 用ChirpStacK管理员账号在Network Server下面的API key界面创建并记录key
- 7. 用定位平台的admin超级管理员账号添加LNS信息、创建二级公司信息
- 8. 注册二级公司管理员账号
- 9. 用二级公司管理员账号创建三级公司、三级公司用户账号、项目
- 10. 将基站数据地址改成本地ip
- 11. 用定位平台的admin超级管理员账号添加基站信息、终端设备信息、信标信息
- 12. 用二级公司管理员账号分配终端设备、信标至项目
- 13. 用三级公司用户账号上传提交地图
- 14. 用定位平台的admin超级管理员账号审核地图
- 15. 用三级公司用户账号创建楼栋、楼层、部署信标、创建人员信息

## 注册码
- 1. 当页面提示以下信息时，需要更新注册码
- 2. 提示信息：注册文件不存在！注册码已过期！目标数量已达到上限！设备不合法！
- 3. 在超级管理员admin账号下，个人中心页面可以更新注册码
- 4. 如果提示注册码已过期，需要手动更新/edwei/profile/openRegister.txt文件，然后重启rct-service服务

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
- 修改/edwei/configuration/nginx/html/static/config.js文件中VUE_APP_TIANDITU_KEY天地图配置
- 拉取openjdk:8镜像可以更方便在本地进行操作，命令：docker pull openjdk:8
- 中国用户在选择制式时，请选择CN470制式

## 证书配置

- 在/edwei/certs/目录放置证书
- 修改/edwei/configuration/nginx/nginx.conf文件中关于SSL的配置

## 天地图配置

- 地址：https://cloudcenter.tianditu.gov.cn/center/development/myApp
- 在【注册】->【登录】->【服务中心控制台】->【应用管理】->【我的应用】页面，创建新应用后，获取应用密钥
- 修改/edwei/configuration/nginx/html/static/config.js文件中VUE_APP_TIANDITU_KEY的天地图配置

## 部署步骤

```
# 构建镜像
docker-compose build
# 启动容器
docker-compose up -d

```
## 二次开发部署

- 源代码地址：https://github.com/ruictec/location_web
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
- ChirpStacK地址：http://IP:8080
- ChirpStacK管理员账号为：admin/admin

**创建Key**
- 在Network Server下面的API key界面创建并记录key

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
- 域名和ip都为chirpstack-rest-api
- 端口号为8090
- 访问用户填写root
- 访问密码用ChirpStacK中创建的key
- 证书默认选No
- 订阅消息地址为tcp://IP:1883
- 上行数据topic为：application/{{application_id}}/device/{{dev_eui}}/event/{{event}}
- 下行命令topic为：application/{{application_id}}/device/{{dev_eui}}/command/{{command}}
- 用户名和密码默认为空

**添加二级企业信息**
- 在【用户管理】->【采购公司】页面，添加二级公司信息
- 添加二级公司信息后，可以获取二级公司的识别号

**注册企业管理员**
- 记录二级公司的识别号
- 在登录页面点击注册按钮进行注册操作
- 注意：用户名不能为汉字

**同步LNS信息**
- 登录超级管理员账号
- 在【采购公司】页面，点击操作【同步】按钮，选择LNS选项

**添加三级企业信息**
- 登录二级企业管理员账号
- 在【用户管理】->【采购公司】页面，添加三级公司信息

**添加用户**
- 在【用户管理】页面，点击添加按钮，选择用户进行添加用户信息

**添加项目**
- 在【项目管理】页面，点击添加按钮

**技术邮箱**
- 邮箱：support@ruichuangte.com

