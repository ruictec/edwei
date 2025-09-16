# Host: localhost  (Version 5.7.26-log)
# Date: 2025-09-13 14:07:30
# Generator: MySQL-Front 6.0  (Build 2.20)


#
# Structure for table "beacons_tbl"
#

DROP TABLE IF EXISTS `beacons_tbl`;
CREATE TABLE `beacons_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `beaconid` char(8) NOT NULL COMMENT '信标唯一标识，16进制字符串',
  `major` varchar(4) NOT NULL DEFAULT '0',
  `minor` varchar(4) NOT NULL DEFAULT '0',
  `custom` enum('Yes','No') DEFAULT 'Yes' COMMENT '锐创特设备',
  `alias` varchar(20) DEFAULT NULL COMMENT '设备别名',
  `inallot` enum('Yes','No') DEFAULT 'No' COMMENT '分配状态',
  `inuse` enum('Yes','No') DEFAULT 'No' COMMENT '使用状态',
  `workstate` enum('正常','故障') NOT NULL DEFAULT '正常' COMMENT '工作状态',
  `type` enum('position','hazardous','asset','badge') NOT NULL DEFAULT 'position' COMMENT '信标类型(asset资产管理，hazardous告警)',
  `clockin` enum('Yes','No') DEFAULT 'No',
  `warning` enum('disabled','enabled') DEFAULT 'disabled' COMMENT '是否触发告警',
  `rssi1` tinyint(4) DEFAULT '-59' COMMENT '1米处信号强度',
  `rssi2` tinyint(4) DEFAULT '-69' COMMENT '2米处信号强度',
  `h` double unsigned DEFAULT '1.5' COMMENT '信标布置高度',
  `a` double DEFAULT '59',
  `n` double DEFAULT '-3.32226',
  `tenantid` char(8) DEFAULT NULL COMMENT '设备所属用户的tenantid',
  `projectid` varchar(8) DEFAULT NULL COMMENT '所属项目编号',
  `nearbeacons` varchar(100) DEFAULT NULL COMMENT '相邻信标',
  `groundid` int(11) unsigned DEFAULT NULL COMMENT '楼层编号',
  `tranche` varchar(32) DEFAULT NULL COMMENT '分组名称',
  `alarmid` int(11) unsigned DEFAULT NULL COMMENT '告警区域id',
  `anglimit` tinyint(4) NOT NULL DEFAULT '15' COMMENT '单点定位时，限制定位的角度',
  `longi` double(20,8) DEFAULT '0.00000000' COMMENT '信标固定地图所在经度或人的位置',
  `lati` double(20,8) DEFAULT '0.00000000' COMMENT '信标固定地图所在纬度或人的位置',
  `postime` int(11) DEFAULT NULL COMMENT '位置更新时间，时间戳',
  `battery` tinyint(4) DEFAULT NULL COMMENT '剩余电量',
  `devtime` int(11) DEFAULT NULL COMMENT '被设备扫描的时间',
  `regtime` int(11) DEFAULT NULL COMMENT '创建时间，时间戳',
  `sysmemo` varchar(255) DEFAULT NULL COMMENT '备注，企业级权限不可见',
  `memo` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`,`beaconid`),
  UNIQUE KEY `beaconid` (`beaconid`) USING BTREE,
  KEY `projectid` (`projectid`) USING BTREE,
  KEY `groundid` (`groundid`) USING BTREE,
  KEY `tenantid` (`tenantid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='信标管理表';

#
# Data for table "beacons_tbl"
#


#
# Structure for table "buildings_grounds_tbl"
#

DROP TABLE IF EXISTS `buildings_grounds_tbl`;
CREATE TABLE `buildings_grounds_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '楼层编号',
  `buildid` int(11) NOT NULL DEFAULT '0' COMMENT '楼栋编号',
  `name` varchar(32) DEFAULT NULL COMMENT '楼层名称',
  `ground` int(11) NOT NULL COMMENT '楼层',
  `mapid` varchar(64) DEFAULT NULL COMMENT '室内地图编号',
  `memo` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `buildid` (`buildid`,`ground`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='建筑表';

#
# Data for table "buildings_grounds_tbl"
#


#
# Structure for table "buildings_tbl"
#

DROP TABLE IF EXISTS `buildings_tbl`;
CREATE TABLE `buildings_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '楼栋编号',
  `building` varchar(64) NOT NULL DEFAULT '' COMMENT '楼栋',
  `tenantid` char(8) DEFAULT NULL,
  `projectid` char(8) NOT NULL DEFAULT '0' COMMENT '项目编号',
  `buildtype` enum('2D','3D') DEFAULT '2D' COMMENT '地图的2D3D类型',
  `flag` tinyint(1) DEFAULT '0',
  `longi` double(20,8) DEFAULT '0.00000000' COMMENT '楼栋所在经度',
  `lati` double(20,8) DEFAULT '0.00000000' COMMENT '楼栋所在纬度',
  `src` varchar(255) DEFAULT NULL COMMENT '楼栋图标地址',
  PRIMARY KEY (`id`),
  UNIQUE KEY `projectid` (`projectid`,`building`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='建筑表';

#
# Data for table "buildings_tbl"
#


#
# Structure for table "country_tbl"
#

DROP TABLE IF EXISTS `country_tbl`;
CREATE TABLE `country_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(32) NOT NULL,
  `gwnumber` int(10) unsigned DEFAULT '0' COMMENT '网关数量',
  `nodenumber` int(10) unsigned DEFAULT '0' COMMENT '终端数量',
  `uptime` int(11) DEFAULT NULL COMMENT '数量更新时间，时间戳',
  `memo` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`,`country`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='国家管理表';

#
# Data for table "country_tbl"
#


#
# Structure for table "customer_asset_tbl"
#

DROP TABLE IF EXISTS `customer_asset_tbl`;
CREATE TABLE `customer_asset_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '资产名称',
  `type` varchar(32) DEFAULT NULL COMMENT '资产类型',
  `model` varchar(32) DEFAULT NULL COMMENT '资产型号',
  `tenantid` char(8) DEFAULT NULL COMMENT '所属公司',
  `projectid` varchar(8) DEFAULT NULL COMMENT '项目编号',
  `username` varchar(32) DEFAULT NULL COMMENT '所属用户',
  `depart` varchar(32) DEFAULT NULL COMMENT '所属部门',
  `beaconid` varchar(16) DEFAULT NULL COMMENT '绑定标签号',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否是信标(false/true)',
  `warning` enum('disabled','enabled') DEFAULT 'disabled' COMMENT '是否触发告警',
  `filename` varchar(32) DEFAULT NULL COMMENT '资产图片文件名',
  `memo` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='资产信息表';

#
# Data for table "customer_asset_tbl"
#


#
# Structure for table "customer_branch_tbl"
#

DROP TABLE IF EXISTS `customer_branch_tbl`;
CREATE TABLE `customer_branch_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '种类名称',
  `tenantid` char(8) DEFAULT NULL COMMENT '所属公司',
  `projectid` char(8) NOT NULL DEFAULT '' COMMENT '项目编号',
  `type` enum('worktype','depart','assetype','tboxtype') DEFAULT 'worktype' COMMENT '分类类型',
  `colour` int(3) unsigned DEFAULT NULL COMMENT '角色工作图标数字',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_unique` (`name`,`projectid`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='员工类型、员工部门、资产类型';

#
# Data for table "customer_branch_tbl"
#


#
# Structure for table "customer_members_tbl"
#

DROP TABLE IF EXISTS `customer_members_tbl`;
CREATE TABLE `customer_members_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) DEFAULT NULL COMMENT '员工姓名',
  `birthday` varchar(12) DEFAULT NULL COMMENT '出生年月日',
  `sex` enum('男','女','未知') DEFAULT '未知' COMMENT '性别',
  `cardno` varchar(16) DEFAULT NULL COMMENT '工号',
  `worktype` varchar(32) DEFAULT NULL COMMENT '工种',
  `tel` varchar(16) DEFAULT NULL COMMENT '电话',
  `tenantid` char(8) DEFAULT NULL COMMENT '所属公司',
  `projectid` varchar(8) DEFAULT NULL COMMENT '项目编号',
  `depart` varchar(32) DEFAULT NULL COMMENT '所属部门',
  `maplabel` varchar(16) DEFAULT NULL COMMENT '绑定标签号，可能是信标，可能是工卡',
  `filename` varchar(32) DEFAULT NULL COMMENT '头像文件名',
  `memo` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "customer_members_tbl"
#


#
# Structure for table "customer_question_tbl"
#

DROP TABLE IF EXISTS `customer_question_tbl`;
CREATE TABLE `customer_question_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '工单编号',
  `title` varchar(64) DEFAULT '' COMMENT '工单标题',
  `type` enum('登录注册','设备管理','用户管理','项目管理','数据管理','告警管理','员工管理','资产管理','定位管理','个人中心','其它') NOT NULL DEFAULT '登录注册' COMMENT '问题分类',
  `superid` varchar(8) NOT NULL DEFAULT '' COMMENT '上级企业唯一识别号',
  `tenantid` char(8) NOT NULL DEFAULT '' COMMENT '企业唯一识别号',
  `upgrade` enum('Yes','No') NOT NULL DEFAULT 'No' COMMENT '提升工单',
  `priority` enum('重要','一般') NOT NULL DEFAULT '一般' COMMENT '优先级',
  `details` varchar(255) NOT NULL DEFAULT '' COMMENT '问题内容',
  `status` enum('草稿','待处理','处理中','已处理','已关闭') NOT NULL DEFAULT '草稿' COMMENT '工单状态',
  `filename` varchar(255) DEFAULT NULL COMMENT '附件',
  `creatime` int(11) DEFAULT NULL COMMENT '创建时间',
  `lastime` int(11) DEFAULT NULL COMMENT '最后留言时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工单信息表';

#
# Data for table "customer_question_tbl"
#


#
# Structure for table "customer_tbox_tbl"
#

DROP TABLE IF EXISTS `customer_tbox_tbl`;
CREATE TABLE `customer_tbox_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(32) NOT NULL DEFAULT '' COMMENT '车牌号',
  `type` varchar(32) DEFAULT NULL COMMENT '车型',
  `tenantid` char(8) DEFAULT NULL COMMENT '所属公司',
  `projectid` varchar(8) DEFAULT NULL COMMENT '项目编号',
  `depart` varchar(32) DEFAULT NULL COMMENT '所属部门',
  `maplabel` varchar(16) DEFAULT NULL COMMENT '绑定标签号是工卡',
  `filename` varchar(32) DEFAULT NULL COMMENT '车辆图片文件名',
  `memo` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn_unique` (`sn`,`projectid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='车辆信息表';

#
# Data for table "customer_tbox_tbl"
#


#
# Structure for table "customers_tbl"
#

DROP TABLE IF EXISTS `customers_tbl`;
CREATE TABLE `customers_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '采购客户名称',
  `tel` varchar(16) DEFAULT NULL COMMENT '采购客户电话',
  `email` varchar(64) DEFAULT NULL COMMENT '采购客户邮箱',
  `country` varchar(32) DEFAULT NULL COMMENT '所在国家',
  `address` varchar(120) DEFAULT NULL COMMENT '所在地址',
  `superid` varchar(8) DEFAULT NULL COMMENT '上级企业唯一识别号',
  `tenantid` char(8) NOT NULL DEFAULT '' COMMENT '企业唯一识别号',
  `level` int(2) unsigned DEFAULT NULL COMMENT '公司级别',
  `tenantkey` char(32) NOT NULL DEFAULT '' COMMENT '用户API访问密钥',
  `schemes` varchar(255) DEFAULT NULL COMMENT '设备制式',
  `nsid` int(3) unsigned DEFAULT NULL COMMENT '所属ns服务器编号',
  `accprio` enum('Yes','No') DEFAULT 'Yes' COMMENT '访问权限',
  `maprio` enum('Yes','No') DEFAULT 'No' COMMENT '设置地图及建筑的权限',
  `projectnum` int(3) unsigned DEFAULT '3' COMMENT '最大项目数',
  `mapnum` int(4) unsigned DEFAULT '10' COMMENT '最大上传地图数',
  `devnum` int(11) unsigned DEFAULT '100' COMMENT '终端设备数量',
  `validtime` int(4) unsigned DEFAULT '30' COMMENT '数据的有效时间(天)',
  `logoprio` enum('Yes','No') DEFAULT 'No' COMMENT '设置logo权限',
  `filelogo` varchar(64) DEFAULT NULL COMMENT 'logo文件名',
  `createtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `memo` varchar(255) DEFAULT NULL COMMENT '备注',
  `record` varchar(1024) DEFAULT NULL COMMENT '采购记录',
  PRIMARY KEY (`id`,`tenantid`,`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='采购用户表';

#
# Data for table "customers_tbl"
#

INSERT INTO `customers_tbl` VALUES (1,'南京锐创特信息科技有限公司','1388888888','121321@163.com','China','南京龙蟠路','qpb7ja9k','qpb7ja9k',1,'6a3ca77416ec43b4a58f19085f1e103f','CN470',0,'Yes','No',6,10,100,30,'Yes','1646210870.png',1603788167,'testdsd','1000000000000000');

#
# Structure for table "dev_command_tbl"
#

DROP TABLE IF EXISTS `dev_command_tbl`;
CREATE TABLE `dev_command_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deveui` varchar(16) DEFAULT NULL COMMENT '设备号',
  `tenantid` char(8) DEFAULT NULL COMMENT '设备拥有者tenantid',
  `type` enum('Param Configuration','Position Request','Reset','Turn Off','Search','Dismiss Search','Positioning Beacon List','Asset Beacon List','Pass-through Beacon List','History BLE Config List','Positioning Beacon UUID','Asset Beacon UUID','Pass-through Beacon Filter','History BLE Config','Time Synchronization') DEFAULT 'Param Configuration' COMMENT '消息类型',
  `msg` varchar(800) DEFAULT NULL COMMENT '消息内容',
  `msgstatus` enum('等待','待确认','成功','失败') DEFAULT '等待' COMMENT '消息状态',
  `creatime` int(11) DEFAULT NULL COMMENT '消息创建时间',
  `sendtime` int(11) DEFAULT NULL COMMENT '消息发送时间',
  `statustime` int(11) DEFAULT NULL COMMENT '更改状态时间',
  PRIMARY KEY (`id`),
  KEY `deveui` (`deveui`),
  KEY `tenantid` (`tenantid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='下行命令状态表';

#
# Data for table "dev_command_tbl"
#


#
# Structure for table "dev_config"
#

DROP TABLE IF EXISTS `dev_config`;
CREATE TABLE `dev_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deveui` varchar(16) NOT NULL,
  `ADR` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '速率自适应0或1',
  `RFU` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Reserved for Future Use.\n若MODE为CLAA，此字段表示终端扫频模式：\n 1：A模式\n 2：B模式\n 3：C模式\n 4：D模式\n 5：E模式\n 6：全频扫描',
  `DR` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Data Rate',
  `MODE` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '当前模式',
  `VER` smallint(6) NOT NULL DEFAULT '0' COMMENT '支持的模式',
  `POWER` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ALREPORT` tinyint(3) unsigned DEFAULT '0',
  `BLE` smallint(6) DEFAULT '0',
  `BLEOFF` tinyint(4) DEFAULT '0',
  `SCAN` tinyint(4) DEFAULT '0',
  `GPS` tinyint(4) NOT NULL DEFAULT '6' COMMENT 'GPS上报周期',
  `HB` tinyint(4) NOT NULL DEFAULT '10' COMMENT '心跳周期，单位30秒',
  `LONGI` int(11) DEFAULT '0',
  `LATI` int(11) DEFAULT '0',
  `RAD` tinyint(4) DEFAULT '100',
  `CRC16` smallint(6) NOT NULL DEFAULT '0' COMMENT '配置参数的CRC校验码',
  PRIMARY KEY (`id`,`deveui`),
  UNIQUE KEY `deveui` (`deveui`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='博世设备参数配置表';

#
# Data for table "dev_config"
#


#
# Structure for table "dev_config_filter"
#

DROP TABLE IF EXISTS `dev_config_filter`;
CREATE TABLE `dev_config_filter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deveui` varchar(16) NOT NULL,
  `port` int(11) unsigned NOT NULL COMMENT '过滤器通道',
  `filter` varchar(255) DEFAULT NULL COMMENT '过滤器字符串',
  `filterStart` int(11) unsigned DEFAULT NULL COMMENT '截取匹配的字符串数据的开始位置',
  `filterLen` int(11) unsigned DEFAULT NULL COMMENT '截取匹配的字符串数据的长度',
  `start` int(11) unsigned DEFAULT NULL COMMENT '透传数据的开始位置',
  `end` int(11) unsigned DEFAULT NULL COMMENT '透传数据的结束位置',
  PRIMARY KEY (`id`,`deveui`,`port`),
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='透传数据配置信息表';

#
# Data for table "dev_config_filter"
#


#
# Structure for table "dev_config_v2"
#

DROP TABLE IF EXISTS `dev_config_v2`;
CREATE TABLE `dev_config_v2` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deveui` varchar(16) NOT NULL,
  `TYPE` enum('tracker','gateway') NOT NULL DEFAULT 'tracker' COMMENT '当前工作模式',
  `POWER` enum('20','18','17','16','15','14','13','12','11','10') NOT NULL DEFAULT '20' COMMENT '发射功率',
  `DR` enum('DR5','DR4','DR3','DR2','DR1') NOT NULL DEFAULT 'DR5' COMMENT 'Data Rate',
  `MODE` enum('CN470','US915','EU868','AS923','IN865','RU864','AU915','KR920') NOT NULL DEFAULT 'CN470' COMMENT '当前模式',
  `ALREPORT` enum('disabled','enabled') DEFAULT 'disabled' COMMENT '自动上报模式',
  `BLE` enum('disabled','5s','10s','20s','30s','1m','2m','5m','10m','15m','20m','30m','1h','2h','6h','12h') DEFAULT '10s' COMMENT '蓝牙扫描周期',
  `SCAN` enum('1s','2s','3s','6s','9s','12s','15s','Always') DEFAULT '1s' COMMENT '蓝牙扫描持续时间',
  `SCALE` enum('position/hazardous','position/asset/hazardous','proximity badge','all','asset') DEFAULT NULL COMMENT '指示扫描信标的类型',
  `STEPSOFF` tinyint(4) DEFAULT '0' COMMENT '步数门限',
  `BLEOFF` tinyint(4) DEFAULT '0',
  `BUZZER` enum('disable','enable') DEFAULT 'enable' COMMENT '蜂鸣器工作模式',
  `VIBRATOR` enum('disable','enable') DEFAULT 'disable' COMMENT '振动器工作模式',
  `DISTANCE` enum('2m','4m','6m','8m','10m','15m','unlimit') DEFAULT '4m' COMMENT '人员解除告警距离',
  `PROXIMITY` enum('disabled','enabled') DEFAULT 'disabled' COMMENT '人员近距离接触是否触发告警',
  `GPS` enum('disabled','5s','10s','15s','30s','60s','150s','5m','15m','30m','60m','90m','3h','6h') NOT NULL DEFAULT 'disabled' COMMENT 'GPS上报周期',
  `HB` enum('1min','5min','10min','20min','30min','1h','2h','6h','12h','24h') NOT NULL DEFAULT '10min' COMMENT '心跳周期',
  `DEGREE` tinyint(4) DEFAULT NULL COMMENT '睡眠程度(0~7)*HB',
  `SLEEPSTART` tinyint(3) unsigned DEFAULT '0' COMMENT '睡眠开始时间（小时）',
  `SLEEPEND` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '睡眠退出时间（小时）',
  `BLEACK` enum('disabled','enabled') NOT NULL DEFAULT 'disabled' COMMENT '蓝牙消息确认',
  `THRES` enum('No limit','-90dbm','-87dbm','-84dbm','-81dbm','-78dbm','-75dbm','-72dbm') DEFAULT 'No limit',
  `PUUID` varchar(200) DEFAULT NULL COMMENT '扫描定位Beacon的uuid',
  `AUUID` varchar(200) DEFAULT NULL COMMENT '扫描资产Beacon的uuid',
  `BLECONFIG` varchar(200) DEFAULT NULL COMMENT '缓存历史定位数据配置',
  PRIMARY KEY (`id`,`deveui`),
  UNIQUE KEY `deveui` (`deveui`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='锐创特设备参数配置表';

#
# Data for table "dev_config_v2"
#


#
# Structure for table "dev_list_tbl"
#

DROP TABLE IF EXISTS `dev_list_tbl`;
CREATE TABLE `dev_list_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `joinmode` enum('OTAA','ABP','Other') DEFAULT 'OTAA' COMMENT '入网模式',
  `deveui` varchar(16) NOT NULL COMMENT '设备号',
  `scheme` enum('CN470','US915_BAND1','US915_BAND2','EU868','AS923','IN865','RU864','AU915_BAND1','AU915_BAND2','KR920') DEFAULT 'EU868',
  `devtype` enum('badge','gateway','tbox') DEFAULT 'badge' COMMENT '硬件设备类型',
  `type` enum('tracker','gateway') DEFAULT 'tracker' COMMENT '当前工作模式',
  `ver` varchar(4) DEFAULT NULL COMMENT 'software version',
  `country` varchar(32) DEFAULT NULL COMMENT '设备所属国家',
  `tenantid` char(8) DEFAULT NULL COMMENT '设备拥有者tenantid',
  `projectid` varchar(8) DEFAULT NULL COMMENT '所属项目id',
  `alias` varchar(20) DEFAULT NULL COMMENT '设备别名',
  `custom` enum('Yes','No') DEFAULT 'Yes',
  `inallot` enum('Yes','No') DEFAULT 'No' COMMENT '分配状态',
  `inuse` enum('Yes','No') DEFAULT 'No' COMMENT '使用状态',
  `workstate` enum('正常','故障') NOT NULL DEFAULT '正常' COMMENT '工作状态',
  `hbstatus` enum('online','offline','unknown') DEFAULT 'offline' COMMENT '设备是否在线(当设备在线时，最后一次数据不更新)',
  `clockin` enum('Yes','No') DEFAULT 'No' COMMENT '打卡点',
  `battery` tinyint(4) DEFAULT NULL COMMENT '剩余电池电量',
  `rssi` smallint(6) DEFAULT NULL COMMENT '最后一次数据信号强度',
  `snr` float(6,2) DEFAULT NULL COMMENT '最后一次数据信噪比',
  `fcnt` int(11) DEFAULT '-1' COMMENT '最后一次数据帧号',
  `lastchannel` float(5,1) DEFAULT NULL COMMENT '最后一次心跳所在频点',
  `statustime` int(11) DEFAULT NULL COMMENT '状态更新时间',
  `groundid` int(11) unsigned DEFAULT NULL COMMENT '楼层编号',
  `tranche` varchar(32) DEFAULT NULL COMMENT '分组名称',
  `alarmid` int(11) unsigned DEFAULT NULL COMMENT '告警区域id',
  `gpstype` enum('Ble','Gps') DEFAULT 'Ble' COMMENT '最后一次位置的定位类型',
  `anglimit` tinyint(4) NOT NULL DEFAULT '15' COMMENT '单点定位时，限制定位的角度',
  `lastx` double(20,8) DEFAULT '0.00000000' COMMENT '最后位置，若为网关，则为网关所部署的位置',
  `lasty` double(20,8) DEFAULT '0.00000000',
  `postime` int(11) DEFAULT NULL COMMENT '最后一次位置更新的时间',
  `warning` enum('disabled','enabled') DEFAULT 'disabled' COMMENT '是否触发告警，作为网关时适用',
  `postype` enum('三点定位','区域定位','GPS定位','网关','四点定位') DEFAULT '区域定位' COMMENT '定位算法类型',
  `keyenc` enum('Yes','No') DEFAULT 'No' COMMENT '设备密钥是否加密存储',
  `appeui` varchar(32) DEFAULT NULL COMMENT 'OTAA时使用appeui',
  `nwkskey` char(32) DEFAULT NULL COMMENT 'ABP时使用（Nwkskey）',
  `appkey` char(32) DEFAULT NULL COMMENT 'OTAA的appkey，ABP模式的Appskey',
  `orignwkskey` char(32) DEFAULT NULL COMMENT 'nwkskey明文',
  `origappkey` char(32) DEFAULT NULL COMMENT 'appkey明文',
  `workmode` enum('Normal','Test','Sold') DEFAULT 'Normal' COMMENT '设备当前状态',
  `debugmode` enum('Debug','Info','Error') DEFAULT 'Info' COMMENT '设备调试状态',
  `configmode` enum('Yes','No') DEFAULT 'Yes' COMMENT '设备配置模式',
  `recv` int(11) DEFAULT NULL COMMENT '设备添加时间，时间戳',
  `sysmemo` varchar(255) DEFAULT NULL COMMENT '备注，企业级权限不可见',
  `memo` varchar(255) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`,`deveui`),
  UNIQUE KEY `deveui` (`deveui`) USING BTREE,
  KEY `tenantid` (`tenantid`),
  KEY `groundid` (`groundid`) USING BTREE,
  KEY `projectid` (`projectid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='终端设备列表';

#
# Data for table "dev_list_tbl"
#


#
# Structure for table "dev_other_tbl"
#

DROP TABLE IF EXISTS `dev_other_tbl`;
CREATE TABLE `dev_other_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deveui` varchar(16) NOT NULL COMMENT '设备号',
  `alias` varchar(20) DEFAULT NULL COMMENT '设备别名',
  `usetype` enum('布置','绑定') NOT NULL DEFAULT '布置' COMMENT '使用类型',
  `devtype` enum('AOA网关','烟感','报警器','蓝牙传感器','摄像头') NOT NULL DEFAULT 'AOA网关' COMMENT '设备类型',
  `custom` enum('Yes','No') NOT NULL DEFAULT 'Yes' COMMENT '系统设备',
  `mode` varchar(16) DEFAULT NULL COMMENT '模式ABP/摄像头ip/蓝牙传感器major',
  `scheme` varchar(16) DEFAULT NULL COMMENT '制式CN470/蓝牙传感器minor',
  `inallot` enum('Yes','No') DEFAULT 'No' COMMENT '分配状态',
  `inuse` enum('Yes','No') DEFAULT 'No' COMMENT '使用状态',
  `battery` tinyint(3) DEFAULT NULL COMMENT '剩余电池电量',
  `appeui` char(32) DEFAULT NULL COMMENT 'appeui/报警器的applicationId',
  `appkey` char(32) DEFAULT NULL COMMENT 'ABP模式的Appskey',
  `origappeui` char(32) DEFAULT NULL COMMENT 'appeui明文',
  `origappkey` char(32) DEFAULT NULL COMMENT 'appkey明文',
  `tenantid` char(8) DEFAULT NULL COMMENT '设备拥有者tenantid',
  `projectid` varchar(8) DEFAULT NULL COMMENT '所属项目id',
  `workstate` enum('正常','故障') NOT NULL DEFAULT '正常' COMMENT '工作状态',
  `groundid` int(10) unsigned DEFAULT NULL COMMENT '楼层编号',
  `tranche` varchar(32) DEFAULT NULL COMMENT '分组名称',
  `alarmid` int(11) unsigned DEFAULT NULL COMMENT '告警区域id',
  `lastx` double(20,8) DEFAULT '0.00000000' COMMENT '最后位置，若部署，则为部署的位置',
  `lasty` double(20,8) DEFAULT '0.00000000',
  `devtime` int(11) DEFAULT NULL COMMENT '数据更新的时间',
  `regtime` int(11) DEFAULT NULL COMMENT '创建时间，时间戳',
  `memo` varchar(255) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `deveui_unqiue` (`deveui`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='安全设备';

#
# Data for table "dev_other_tbl"
#


#
# Structure for table "dev_tracker_rssi_tbl"
#

DROP TABLE IF EXISTS `dev_tracker_rssi_tbl`;
CREATE TABLE `dev_tracker_rssi_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deveui` varchar(16) NOT NULL,
  `tenantid` char(8) DEFAULT NULL COMMENT '所属公司',
  `type` varchar(12) DEFAULT NULL COMMENT '上行下行类型',
  `flag` tinyint(1) DEFAULT '0' COMMENT '状态好与坏',
  `rssi1` smallint(6) DEFAULT NULL COMMENT '三次信号强度',
  `rssi2` smallint(6) DEFAULT NULL,
  `rssi3` smallint(6) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='测试表';

#
# Data for table "dev_tracker_rssi_tbl"
#


#
# Structure for table "dev_tranche_tbl"
#

DROP TABLE IF EXISTS `dev_tranche_tbl`;
CREATE TABLE `dev_tranche_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '分组名称',
  `site` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为定位区域',
  `groundid` int(11) NOT NULL DEFAULT '0' COMMENT '楼层编号',
  `projectid` char(8) NOT NULL DEFAULT '' COMMENT '项目编号',
  `fremove` enum('Yes','No') NOT NULL DEFAULT 'No' COMMENT '区域防抖',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_unique` (`name`,`groundid`,`site`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='分组类别表';

#
# Data for table "dev_tranche_tbl"
#


#
# Structure for table "fence_manage_tbl"
#

DROP TABLE IF EXISTS `fence_manage_tbl`;
CREATE TABLE `fence_manage_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '围栏的编号',
  `name` varchar(32) DEFAULT NULL COMMENT '围栏名',
  `colour` varchar(16) DEFAULT NULL COMMENT '围栏颜色',
  `projectid` varchar(64) DEFAULT NULL COMMENT '所属项目id',
  `time` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`name`,`projectid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='围栏表';

#
# Data for table "fence_manage_tbl"
#


#
# Structure for table "fence_point_tbl"
#

DROP TABLE IF EXISTS `fence_point_tbl`;
CREATE TABLE `fence_point_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '点的编号',
  `fenceid` varchar(24) NOT NULL DEFAULT '' COMMENT '围栏编号',
  `pointX` double(20,8) NOT NULL DEFAULT '0.00000000' COMMENT '点坐标X',
  `pointY` double(20,8) NOT NULL DEFAULT '0.00000000' COMMENT '点坐标Y',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='围栏点表';

#
# Data for table "fence_point_tbl"
#


#
# Structure for table "gateway_tbl"
#

DROP TABLE IF EXISTS `gateway_tbl`;
CREATE TABLE `gateway_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deveui` varchar(16) NOT NULL COMMENT '网关eui',
  `alias` varchar(20) DEFAULT NULL COMMENT '别名',
  `scheme` enum('CN470','US915_BAND1','US915_BAND2','EU868','AS923','IN865','RU864','AU915_BAND1','AU915_BAND2','KR920') NOT NULL DEFAULT 'EU868' COMMENT '设备制式',
  `tenantid` char(8) DEFAULT NULL COMMENT '所属用户tenantid',
  `projectid` varchar(8) DEFAULT NULL COMMENT '项目编号',
  `country` varchar(32) DEFAULT NULL COMMENT '基站所属国家',
  `custom` enum('Yes','No') DEFAULT 'Yes' COMMENT '锐创特设备',
  `hbstatus` enum('online','offline','unknown') DEFAULT 'unknown' COMMENT '设备是否在线',
  `statustime` int(11) unsigned DEFAULT NULL COMMENT '数据时间',
  `lastx` double(20,8) NOT NULL DEFAULT '0.00000000' COMMENT '位置',
  `lasty` double(20,8) NOT NULL DEFAULT '0.00000000' COMMENT '位置',
  `network` enum('4G卡','有线') DEFAULT '4G卡' COMMENT '入网方式',
  `cardid` varchar(32) DEFAULT NULL COMMENT '4G卡号',
  `totalbytes` varchar(32) DEFAULT NULL COMMENT '4G卡总流量',
  `firsttime` int(11) DEFAULT NULL COMMENT '创建时间',
  `sysmemo` varchar(255) DEFAULT NULL COMMENT '备注，企业级权限不可见',
  `memo` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`,`deveui`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='Lora基站列表';

#
# Data for table "gateway_tbl"
#


#
# Structure for table "map_tbl"
#

DROP TABLE IF EXISTS `map_tbl`;
CREATE TABLE `map_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mapid` varchar(64) NOT NULL DEFAULT '' COMMENT '室内地图编号',
  `mapname` varchar(64) DEFAULT NULL COMMENT '地图名称',
  `maptype` enum('2D','3D') NOT NULL DEFAULT '2D' COMMENT '地图的2D3D类型',
  `mapkey` varchar(64) DEFAULT NULL COMMENT '3D蜂鸟地图key',
  `appname` varchar(32) DEFAULT NULL COMMENT '3D地图应用名',
  `status` enum('draft','audit','pass','fail','lock') DEFAULT 'draft' COMMENT '室内地图审核状态',
  `width` int(11) NOT NULL DEFAULT '0' COMMENT '2D地图像素/3D地图的最小y坐标值',
  `length` int(11) NOT NULL DEFAULT '0' COMMENT '2D地图像素/3D地图的最小x坐标值',
  `realwidth` int(11) NOT NULL DEFAULT '0' COMMENT '2D地图实际宽/3D地图的最大y坐标值',
  `reallength` int(11) NOT NULL DEFAULT '0' COMMENT '2D地图实际长/3D地图的最大x坐标值',
  `distance` int(4) NOT NULL DEFAULT '0' COMMENT '精度：位置变动的距离值',
  `active` double(2,1) NOT NULL DEFAULT '0.0' COMMENT '活跃度',
  `scale` int(11) unsigned NOT NULL DEFAULT '1',
  `tenantid` char(8) NOT NULL DEFAULT '' COMMENT '所属用户tenantid',
  `projectid` varchar(8) DEFAULT NULL COMMENT '所属项目编号',
  `username` varchar(32) DEFAULT NULL COMMENT '地图提交人',
  `filetype` varchar(32) DEFAULT NULL COMMENT '地图文件名',
  `filename` varchar(64) DEFAULT NULL COMMENT '原始文件名',
  `creattime` int(11) DEFAULT '0' COMMENT '地图创建时间',
  `edittime` int(11) DEFAULT '0' COMMENT '地图编辑时间',
  `audittime` int(11) DEFAULT '0' COMMENT '地图审核时间',
  `instruction` varchar(255) DEFAULT NULL COMMENT '审核意见',
  `sysmemo` varchar(255) DEFAULT NULL COMMENT '备注，企业级权限不可见',
  `memo` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mapid` (`mapid`) USING BTREE,
  KEY `filename` (`filename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='地图表';

#
# Data for table "map_tbl"
#


#
# Structure for table "member_attendance_tbl"
#

DROP TABLE IF EXISTS `member_attendance_tbl`;
CREATE TABLE `member_attendance_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '姓名',
  `maplabel` varchar(16) DEFAULT NULL COMMENT '绑定标签号，可能是信标，可能是工卡',
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '当true时，扫描到打卡点，需要下一次的步数确认',
  `status` enum('出勤','缺勤','未打卡') DEFAULT '出勤' COMMENT '打卡状态',
  `projectid` varchar(8) DEFAULT NULL COMMENT '项目编号',
  `state` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要第一次心跳确认',
  `basenum` int(11) DEFAULT NULL COMMENT '步数基数',
  `steps` int(11) DEFAULT '0' COMMENT '步数',
  `retime` varchar(12) DEFAULT NULL COMMENT '日期',
  `firstime` int(11) DEFAULT NULL COMMENT '记录时间',
  `lastime` int(11) DEFAULT NULL COMMENT '离场时间',
  `reboottimes` int(11) unsigned DEFAULT NULL COMMENT '重启次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='员工考勤表';

#
# Data for table "member_attendance_tbl"
#


#
# Structure for table "msg_board_tbl"
#

DROP TABLE IF EXISTS `msg_board_tbl`;
CREATE TABLE `msg_board_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `questionid` int(11) NOT NULL DEFAULT '0' COMMENT '问题信息id',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `details` varchar(255) NOT NULL DEFAULT '' COMMENT '留言内容',
  `time` int(11) NOT NULL DEFAULT '0' COMMENT '留言时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='留言信息表';

#
# Data for table "msg_board_tbl"
#


#
# Structure for table "notice_tbl"
#

DROP TABLE IF EXISTS `notice_tbl`;
CREATE TABLE `notice_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `notice` varchar(32) DEFAULT NULL COMMENT '消息对象',
  `ennotice` varchar(32) DEFAULT NULL COMMENT '消息对象',
  `status` enum('未读','已读') DEFAULT '未读' COMMENT '消息状态',
  `msg` varchar(255) DEFAULT NULL COMMENT '消息内容',
  `enmsg` varchar(255) DEFAULT NULL COMMENT '消息内容',
  `time` int(11) DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`),
  KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "notice_tbl"
#


#
# Structure for table "ns_application_tbl"
#

DROP TABLE IF EXISTS `ns_application_tbl`;
CREATE TABLE `ns_application_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nsid` int(11) DEFAULT NULL COMMENT 'ns服务器信息编号',
  `tenantid` char(8) NOT NULL DEFAULT '' COMMENT 'Ns服务器组织名(企业唯一识别号)',
  `applicationId` char(36) NOT NULL DEFAULT '',
  `scheme` varchar(12) NOT NULL DEFAULT '' COMMENT '设备制式',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT 'application名称',
  `tenId` char(36) NOT NULL DEFAULT '' COMMENT 'tenant编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='网络服务器';

#
# Data for table "ns_application_tbl"
#


#
# Structure for table "ns_device_tbl"
#

DROP TABLE IF EXISTS `ns_device_tbl`;
CREATE TABLE `ns_device_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nsid` int(11) DEFAULT NULL COMMENT 'ns服务器信息编号',
  `tenantid` char(8) NOT NULL DEFAULT '' COMMENT 'Ns服务器组织名(企业唯一识别号)',
  `deviceProfileId` char(36) NOT NULL DEFAULT '' COMMENT 'device-profile编号',
  `scheme` varchar(12) NOT NULL DEFAULT '' COMMENT '设备制式',
  `joinmode` varchar(12) DEFAULT '' COMMENT '入网模式:OTAA,ABP,SMOKE,ALERTOR',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT 'device-profile名称',
  `tenId` char(36) NOT NULL DEFAULT '' COMMENT 'tenant编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#
# Data for table "ns_device_tbl"
#


#
# Structure for table "ns_tbl"
#

DROP TABLE IF EXISTS `ns_tbl`;
CREATE TABLE `ns_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL COMMENT '名称',
  `cert` enum('Yes','No') NOT NULL DEFAULT 'No' COMMENT '需要证书',
  `domain` varchar(64) NOT NULL DEFAULT '' COMMENT '域名',
  `ip` varchar(64) DEFAULT NULL COMMENT 'ip',
  `port` smallint(6) NOT NULL DEFAULT '443' COMMENT '服务器访问端口',
  `status` enum('online','offline') DEFAULT 'offline' COMMENT '状态',
  `statustime` int(11) unsigned DEFAULT NULL COMMENT '状态更新时间',
  `usrname` varchar(32) DEFAULT NULL COMMENT '访问用户名',
  `token` varchar(255) DEFAULT NULL COMMENT '密钥',
  `emails` varchar(64) DEFAULT NULL COMMENT '邮箱',
  `memo` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ip` (`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='网络服务器';

#
# Data for table "ns_tbl"
#


#
# Structure for table "ns_tenant_tbl"
#

DROP TABLE IF EXISTS `ns_tenant_tbl`;
CREATE TABLE `ns_tenant_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nsid` int(11) DEFAULT NULL COMMENT 'ns服务器信息编号',
  `tenantid` char(8) NOT NULL DEFAULT '' COMMENT 'Ns服务器组织名(企业唯一识别号)',
  `tenId` char(36) NOT NULL DEFAULT '' COMMENT 'tenant编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#
# Data for table "ns_tenant_tbl"
#


#
# Structure for table "point_near_tbl"
#

DROP TABLE IF EXISTS `point_near_tbl`;
CREATE TABLE `point_near_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groundid` int(11) NOT NULL COMMENT '楼层编号',
  `pointid` varchar(24) NOT NULL DEFAULT '' COMMENT '点名称',
  `nearpointid` varchar(24) NOT NULL DEFAULT '' COMMENT '相邻点编号',
  `neartype` enum('Yes','No') NOT NULL DEFAULT 'No' COMMENT '相邻点的类型是否是信标',
  `dist` double(20,8) NOT NULL DEFAULT '0.00000000' COMMENT '两点间距离',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='相邻点表';

#
# Data for table "point_near_tbl"
#


#
# Structure for table "point_tbl"
#

DROP TABLE IF EXISTS `point_tbl`;
CREATE TABLE `point_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '点的编号',
  `groundid` int(11) NOT NULL COMMENT '楼层编号',
  `pointid` varchar(24) NOT NULL DEFAULT '' COMMENT '点编号',
  `nodeX` double(20,8) NOT NULL DEFAULT '0.00000000' COMMENT '点坐标X',
  `nodeY` double(20,8) NOT NULL DEFAULT '0.00000000' COMMENT '点坐标Y',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pointid_unique` (`groundid`,`pointid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='点的信息表';

#
# Data for table "point_tbl"
#


#
# Structure for table "project_config_tbl"
#

DROP TABLE IF EXISTS `project_config_tbl`;
CREATE TABLE `project_config_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectid` char(8) NOT NULL DEFAULT '0' COMMENT '项目编号',
  `alarmConfig` tinyint(1) NOT NULL DEFAULT '1' COMMENT '人员告警配置',
  `tboxConfig` tinyint(1) NOT NULL DEFAULT '1' COMMENT '车辆告警配置',
  `employee` tinyint(1) NOT NULL DEFAULT '1' COMMENT '人员管理',
  `asset` tinyint(1) NOT NULL DEFAULT '1' COMMENT '资产管理',
  `tbox` tinyint(1) NOT NULL DEFAULT '1' COMMENT '车辆管理',
  `attendance` tinyint(1) NOT NULL DEFAULT '1' COMMENT '考勤管理',
  `task` tinyint(1) NOT NULL DEFAULT '1' COMMENT '巡检管理',
  `devgw` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '终端管理',
  `scanbeacon` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '信标管理',
  `aoagw` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT 'AOA网关',
  `smoke` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '烟感',
  `alertor` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '报警器',
  `blesensor` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '蓝牙传感器',
  `camera` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '摄像头',
  `outDoor` tinyint(1) NOT NULL DEFAULT '1' COMMENT '室外定位',
  `inDoor` tinyint(1) NOT NULL DEFAULT '1' COMMENT '室内定位',
  `attenFlag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '3级用户显示考勤还是信标状态(true:考勤)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='项目功能配置表';

#
# Data for table "project_config_tbl"
#


#
# Structure for table "project_tbl"
#

DROP TABLE IF EXISTS `project_tbl`;
CREATE TABLE `project_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectid` char(8) NOT NULL DEFAULT '0' COMMENT '项目编号',
  `name` varchar(64) DEFAULT NULL COMMENT '项目名称',
  `type` enum('正向','反向') NOT NULL DEFAULT '正向' COMMENT '项目定位类型',
  `projectype` enum('学校','医院','写字楼','居民区','工厂','仓库','养老院','商场','停车场','工地','隧道','其它') DEFAULT '居民区' COMMENT '项目类型',
  `tenantid` char(8) DEFAULT NULL COMMENT '所属公司',
  `scheme` varchar(12) DEFAULT NULL COMMENT '制式',
  `offtime` int(11) unsigned NOT NULL DEFAULT '600' COMMENT '位置消除时间',
  `timezone` int(11) NOT NULL DEFAULT '0' COMMENT '时区时间差',
  `forward` enum('MQTT','HTTP','No') NOT NULL DEFAULT 'No' COMMENT '消息是否转发',
  `mqttname` varchar(16) DEFAULT NULL COMMENT 'mqtt连接用户名',
  `mqttpwd` varchar(120) DEFAULT NULL COMMENT 'mqtt连接密码',
  `url` varchar(255) DEFAULT NULL COMMENT '数据转发地址',
  `net` enum('内置','TTN','ChirpStack-MQTT','ChirpStack-HTTP','其它') DEFAULT '内置' COMMENT '网络服务器',
  `ttnbroker` varchar(125) DEFAULT NULL COMMENT 'MQTT Broker',
  `ttname` varchar(125) DEFAULT NULL COMMENT 'username',
  `ttnpwd` varchar(255) DEFAULT NULL COMMENT 'password',
  `uptopic` varchar(125) DEFAULT NULL COMMENT '上行topic',
  `downtopic` varchar(125) DEFAULT NULL COMMENT '下行topic',
  `longi` double(20,8) DEFAULT NULL COMMENT '地图中心点经度',
  `lati` double(20,8) DEFAULT NULL COMMENT '地图中心点纬度',
  `zoom` double(6,2) DEFAULT '8.00' COMMENT '地图缩放倍数',
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` varchar(32) DEFAULT NULL COMMENT '用户名',
  `setkey` char(32) DEFAULT NULL COMMENT '镶嵌功能访问密钥',
  `filename` varchar(64) DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`,`projectid`),
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目管理表';

#
# Data for table "project_tbl"
#


#
# Structure for table "task_info_tbl"
#

DROP TABLE IF EXISTS `task_info_tbl`;
CREATE TABLE `task_info_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) unsigned NOT NULL COMMENT '员工id',
  `taskid` int(11) NOT NULL COMMENT '任务id',
  `projectid` char(8) NOT NULL DEFAULT '0' COMMENT '项目编号',
  `details` varchar(3000) DEFAULT '' COMMENT '任务详情',
  `infodetails` varchar(3000) DEFAULT '' COMMENT '巡检过的详情',
  `taskdate` varchar(12) DEFAULT NULL COMMENT '巡检日期',
  `begintime` varchar(8) DEFAULT NULL COMMENT '开始时间',
  `endtime` varchar(8) DEFAULT NULL COMMENT '结束时间',
  `missnum` int(11) DEFAULT NULL COMMENT '漏检个数',
  `missdetails` varchar(3000) DEFAULT NULL COMMENT '漏检详情',
  `taskstatus` enum('未进行','进行中','完成','未完成') DEFAULT '未进行' COMMENT '任务状态:\r\n1.未进行\r\n2.进行中\r\n3.完成\r\n4.未完成',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='巡检历史';

#
# Data for table "task_info_tbl"
#


#
# Structure for table "task_info_time_tbl"
#

DROP TABLE IF EXISTS `task_info_time_tbl`;
CREATE TABLE `task_info_time_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskinfoid` int(11) NOT NULL DEFAULT '0' COMMENT '巡检任务信息id',
  `deveui` varchar(16) NOT NULL DEFAULT '' COMMENT '正向：信标编号，反向：网关设备号',
  `begintime` int(11) DEFAULT NULL COMMENT '巡检该点的开始时间',
  `staytime` int(11) NOT NULL DEFAULT '0' COMMENT '巡检该点的持续时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='巡检点情况表';

#
# Data for table "task_info_time_tbl"
#


#
# Structure for table "task_management_tbl"
#

DROP TABLE IF EXISTS `task_management_tbl`;
CREATE TABLE `task_management_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '任务名',
  `userids` varchar(320) DEFAULT NULL COMMENT '员工id集合',
  `projectid` char(8) NOT NULL DEFAULT '0' COMMENT '项目编号',
  `details` varchar(3000) DEFAULT NULL COMMENT '线路详情',
  `repetition` enum('不重复','每天','每月','每周','每一小时','每两小时','每三小时','每四小时','每五小时','每六小时') DEFAULT '不重复',
  `daily` varchar(320) DEFAULT NULL COMMENT '(如果repeat是每周或者每月daily用来存储另外设置的信息)',
  `begindate` varchar(12) DEFAULT NULL COMMENT '开始日期',
  `enddate` varchar(12) DEFAULT NULL COMMENT '结束日期',
  `begintime` varchar(8) DEFAULT NULL COMMENT '开始时间',
  `endtime` varchar(8) DEFAULT NULL COMMENT '结束时间',
  `states` enum('正常','终止') DEFAULT '正常' COMMENT '任务状态:1.正常2.终止',
  `ctime` int(11) DEFAULT NULL COMMENT '创建时间',
  `memo` varchar(128) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='巡检管理';

#
# Data for table "task_management_tbl"
#


#
# Structure for table "users_operate_tbl"
#

DROP TABLE IF EXISTS `users_operate_tbl`;
CREATE TABLE `users_operate_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) DEFAULT NULL,
  `tenantid` char(8) DEFAULT NULL COMMENT '公司识别号',
  `action` enum('login','exit','add','update','delete') NOT NULL DEFAULT 'login' COMMENT '用户操作类型',
  `module` varchar(32) DEFAULT NULL COMMENT '操作模块',
  `enmodule` varchar(64) DEFAULT NULL COMMENT '操作模块',
  `method` varchar(63) DEFAULT NULL COMMENT '操作接口名',
  `detail` varchar(2000) DEFAULT NULL COMMENT '操作内容',
  `time` int(11) DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户操作日志';

#
# Data for table "users_operate_tbl"
#


#
# Structure for table "users_tbl"
#

DROP TABLE IF EXISTS `users_tbl`;
CREATE TABLE `users_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `realname` varchar(32) DEFAULT NULL COMMENT '真实姓名',
  `userkey` varchar(32) NOT NULL DEFAULT '' COMMENT '用户登录密码，需加密存储',
  `usertel` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `usermail` varchar(30) NOT NULL DEFAULT '' COMMENT '用户邮箱',
  `prio` enum('系统管理员','系统子管理员','企业管理员','企业子管理员','企业用户','企业资产拥有者') NOT NULL DEFAULT '系统管理员' COMMENT '用户权限',
  `country` varchar(32) DEFAULT '' COMMENT '所在国家',
  `tenantid` char(8) NOT NULL DEFAULT '' COMMENT '用户编号',
  `delprio` enum('Yes','No') DEFAULT 'No' COMMENT '删除权限',
  `accprio` enum('Yes','No') DEFAULT 'Yes' COMMENT '访问权限',
  `logintime` int(11) DEFAULT NULL COMMENT '最后登录时间',
  `regtime` int(11) DEFAULT NULL COMMENT '用户注册时间',
  PRIMARY KEY (`username`),
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户信息表';

#
# Data for table "users_tbl"
#

INSERT INTO `users_tbl` VALUES (1,'admin',NULL,'39aeb81892e1bff7b9176ce1dd4a3f4f','18913015482','zhangchao@ruichuangte.com','系统管理员','China','qpb7ja9k','Yes','Yes',1757671047,1334555);

#
# Structure for table "warning_config_tbl"
#

DROP TABLE IF EXISTS `warning_config_tbl`;
CREATE TABLE `warning_config_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectid` char(8) NOT NULL DEFAULT '0' COMMENT '项目编号',
  `type` enum('滞留告警','聚集告警','异常静止','越界告警') DEFAULT '滞留告警' COMMENT '告警类型',
  `postype` enum('Ble','Gps') DEFAULT 'Ble',
  `meth` int(1) NOT NULL DEFAULT '0' COMMENT '越界告警触发方式1为进，2为出',
  `cate` enum('人员','车辆') DEFAULT '人员' COMMENT '类型：人员,车辆',
  `worktypes` varchar(320) DEFAULT NULL COMMENT '工种',
  `tranches` varchar(320) DEFAULT NULL COMMENT '分组名称',
  `begintime` varchar(8) DEFAULT NULL COMMENT '开始时间',
  `endtime` varchar(8) DEFAULT NULL COMMENT '结束时间',
  `warnum` int(11) DEFAULT NULL COMMENT '告警门限(时长或人数)',
  `memo` varchar(128) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='告警配置表';

#
# Data for table "warning_config_tbl"
#


#
# Structure for table "warning_voice_tbl"
#

DROP TABLE IF EXISTS `warning_voice_tbl`;
CREATE TABLE `warning_voice_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectid` char(8) NOT NULL DEFAULT '0' COMMENT '项目编号',
  `push` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推送消息(false/true)',
  `type` enum('SOS告警','聚集告警','越界告警','滞留告警','异常静止','倾斜告警','倾倒告警','火灾告警') DEFAULT '滞留告警' COMMENT '告警类型',
  `voice` int(1) NOT NULL DEFAULT '0' COMMENT '告警声音类型',
  `vtime` int(2) NOT NULL DEFAULT '0' COMMENT '告警声音时长(0，3秒，6秒，9秒，30秒)',
  `vcycle` int(3) NOT NULL DEFAULT '0' COMMENT '告警声音周期(0，30秒，1分钟，3分钟，5分钟)',
  `memo` varchar(128) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='告警声音配置表';

#
# Data for table "warning_voice_tbl"
#

