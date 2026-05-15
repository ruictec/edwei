# Host: localhost  (Version 5.7.26-log)
# Date: 2025-10-09 10:02:32
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
  `custom` int(11) DEFAULT NULL,
  `alias` varchar(20) DEFAULT NULL COMMENT '设备别名',
  `inallot` int(11) DEFAULT NULL,
  `inuse` int(11) DEFAULT NULL,
  `workstate` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `clockin` int(11) DEFAULT NULL,
  `warning` int(11) DEFAULT NULL,
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
  `buildtype` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='国家管理表';

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
  `warning` int(11) DEFAULT NULL,
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
  `type` int(11) DEFAULT NULL,
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
  `sex` int(11) DEFAULT NULL,
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
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '问题分类',
  `superid` varchar(8) NOT NULL DEFAULT '' COMMENT '上级企业唯一识别号',
  `tenantid` char(8) NOT NULL DEFAULT '' COMMENT '企业唯一识别号',
  `upgrade` int(11) DEFAULT NULL COMMENT '提升工单',
  `priority` int(11) NOT NULL DEFAULT '0' COMMENT '优先级',
  `details` varchar(255) NOT NULL DEFAULT '' COMMENT '问题内容',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '工单状态',
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
  `accprio` int(11) DEFAULT NULL,
  `maprio` int(11) DEFAULT NULL,
  `projectnum` int(3) unsigned DEFAULT '3' COMMENT '最大项目数',
  `mapnum` int(4) unsigned DEFAULT '10' COMMENT '最大上传地图数',
  `devnum` int(11) unsigned DEFAULT '100' COMMENT '终端设备数量',
  `validtime` int(4) unsigned DEFAULT '30' COMMENT '数据的有效时间(天)',
  `logoprio` int(11) DEFAULT NULL,
  `filelogo` varchar(64) DEFAULT NULL COMMENT 'logo文件名',
  `createtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `memo` varchar(255) DEFAULT NULL COMMENT '备注',
  `record` varchar(1024) DEFAULT NULL COMMENT '采购记录',
  PRIMARY KEY (`id`,`tenantid`,`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='采购用户表';

#
# Data for table "customers_tbl"
#

INSERT INTO `customers_tbl` VALUES (1,'superAdmin','1388888888','121321@163.com','China','xxxxx','qpb7jakk','qpb7jakk',1,'6a3ca77416ec43b4a58f19085f1e104f','CN470',0,1,2,6,10,100,30,1,'1646210870.png',1603788167,'testdsd','1000000000000000');

#
# Structure for table "dev_command_tbl"
#

DROP TABLE IF EXISTS `dev_command_tbl`;
CREATE TABLE `dev_command_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deveui` varchar(16) DEFAULT NULL COMMENT '设备号',
  `tenantid` char(8) DEFAULT NULL COMMENT '设备拥有者tenantid',
  `type` int(11) DEFAULT '0' COMMENT '消息类型',
  `msg` varchar(800) DEFAULT NULL COMMENT '消息内容',
  `msgstatus` int(11) DEFAULT '0' COMMENT '消息状态',
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
  `TYPE` int(11) DEFAULT NULL,
  `POWER` int(11) DEFAULT NULL,
  `DR` int(11) DEFAULT NULL,
  `MODE` int(11) DEFAULT NULL,
  `ALREPORT` int(11) DEFAULT NULL,
  `BLE` int(11) DEFAULT NULL,
  `SCAN` int(11) DEFAULT NULL,
  `SCALE` int(11) DEFAULT NULL,
  `STEPSOFF` tinyint(4) DEFAULT '0' COMMENT '步数门限',
  `BLEOFF` tinyint(4) DEFAULT '0',
  `BUZZER` int(11) DEFAULT NULL,
  `VIBRATOR` int(11) DEFAULT NULL,
  `DISTANCE` int(11) DEFAULT NULL,
  `PROXIMITY` int(11) DEFAULT NULL,
  `GPS` int(11) DEFAULT NULL,
  `HB` int(11) DEFAULT NULL,
  `DEGREE` tinyint(4) DEFAULT NULL COMMENT '睡眠程度(0~7)*HB',
  `SLEEPSTART` tinyint(3) unsigned DEFAULT '0' COMMENT '睡眠开始时间（小时）',
  `SLEEPEND` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '睡眠退出时间（小时）',
  `REPEATER` int(11) DEFAULT '0' COMMENT '0:设备不支持中继;1设备支持中继',
  `STATICINT` int(11) DEFAULT '0' COMMENT '0:设备静止时不发送位置数据;1~3:设备静止时每若干个心跳周期发送一次位置数据',
  `CHANNEL` int(11) DEFAULT '0' COMMENT '0:代表8通道;1代表16通道',
  `BLEACK` int(11) DEFAULT NULL,
  `THRES` int(11) DEFAULT NULL,
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
  `joinmode` int(11) DEFAULT NULL,
  `deveui` varchar(16) NOT NULL COMMENT '设备号',
  `scheme` int(11) DEFAULT NULL,
  `devtype` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `ver` varchar(4) DEFAULT NULL COMMENT 'software version',
  `country` varchar(32) DEFAULT NULL COMMENT '设备所属国家',
  `tenantid` char(8) DEFAULT NULL COMMENT '设备拥有者tenantid',
  `projectid` varchar(8) DEFAULT NULL COMMENT '所属项目id',
  `alias` varchar(20) DEFAULT NULL COMMENT '设备别名',
  `custom` int(11) DEFAULT NULL,
  `inallot` int(11) DEFAULT NULL,
  `inuse` int(11) DEFAULT NULL,
  `workstate` int(11) DEFAULT NULL,
  `hbstatus` int(11) DEFAULT NULL,
  `clockin` int(11) DEFAULT NULL,
  `battery` tinyint(4) DEFAULT NULL COMMENT '剩余电池电量',
  `rssi` smallint(6) DEFAULT NULL COMMENT '最后一次数据信号强度',
  `snr` float(6,2) DEFAULT NULL COMMENT '最后一次数据信噪比',
  `fcnt` int(11) DEFAULT '-1' COMMENT '最后一次数据帧号',
  `lastchannel` float(5,1) DEFAULT NULL COMMENT '最后一次心跳所在频点',
  `statustime` int(11) DEFAULT NULL COMMENT '状态更新时间',
  `groundid` int(11) unsigned DEFAULT NULL COMMENT '楼层编号',
  `tranche` varchar(32) DEFAULT NULL COMMENT '分组名称',
  `alarmid` int(11) unsigned DEFAULT NULL COMMENT '告警区域id',
  `gpstype` int(11) DEFAULT NULL,
  `anglimit` tinyint(4) NOT NULL DEFAULT '15' COMMENT '单点定位时，限制定位的角度',
  `lastx` double(20,8) DEFAULT '0.00000000' COMMENT '最后位置，若为网关，则为网关所部署的位置',
  `lasty` double(20,8) DEFAULT '0.00000000',
  `postime` int(11) DEFAULT NULL COMMENT '最后一次位置更新的时间',
  `warning` int(11) DEFAULT NULL,
  `postype` int(11) DEFAULT NULL,
  `keyenc` int(11) DEFAULT NULL,
  `appeui` varchar(32) DEFAULT NULL COMMENT 'OTAA时使用appeui',
  `nwkskey` char(32) DEFAULT NULL COMMENT 'ABP时使用（Nwkskey）',
  `appkey` char(32) DEFAULT NULL COMMENT 'OTAA的appkey，ABP模式的Appskey',
  `orignwkskey` char(32) DEFAULT NULL COMMENT 'nwkskey明文',
  `origappkey` char(32) DEFAULT NULL COMMENT 'appkey明文',
  `workmode` int(11) DEFAULT NULL,
  `debugmode` int(11) DEFAULT NULL,
  `configmode` int(11) DEFAULT NULL,
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
  `usetype` int(11) DEFAULT NULL,
  `devtype` int(11) DEFAULT NULL,
  `custom` int(11) DEFAULT NULL,
  `mode` varchar(16) DEFAULT NULL COMMENT '模式ABP/摄像头ip/蓝牙传感器major',
  `scheme` varchar(16) DEFAULT NULL COMMENT '制式CN470/蓝牙传感器minor',
  `inallot` int(11) DEFAULT NULL,
  `inuse` int(11) DEFAULT NULL,
  `battery` tinyint(3) DEFAULT NULL COMMENT '剩余电池电量',
  `appeui` char(32) DEFAULT NULL COMMENT 'appeui/报警器的applicationId',
  `appkey` char(32) DEFAULT NULL COMMENT 'ABP模式的Appskey',
  `origappeui` char(32) DEFAULT NULL COMMENT 'appeui明文',
  `origappkey` char(32) DEFAULT NULL COMMENT 'appkey明文',
  `tenantid` char(8) DEFAULT NULL COMMENT '设备拥有者tenantid',
  `projectid` varchar(8) DEFAULT NULL COMMENT '所属项目id',
  `workstate` int(11) DEFAULT NULL,
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
  `fremove` int(11) DEFAULT NULL,
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
  `flag` tinyint(1) NOT NULL DEFAULT '1',
  `colour` varchar(16) DEFAULT NULL COMMENT '围栏颜色',
  `projectid` varchar(64) DEFAULT NULL COMMENT '所属项目id',
  `groundid` int(10) unsigned DEFAULT NULL COMMENT '楼层编号',
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
  `scheme` int(11) DEFAULT NULL,
  `tenantid` char(8) DEFAULT NULL COMMENT '所属用户tenantid',
  `projectid` varchar(8) DEFAULT NULL COMMENT '项目编号',
  `country` varchar(32) DEFAULT NULL COMMENT '基站所属国家',
  `custom` int(11) DEFAULT NULL,
  `hbstatus` int(11) DEFAULT NULL,
  `statustime` int(11) unsigned DEFAULT NULL COMMENT '数据时间',
  `lastx` double(20,8) NOT NULL DEFAULT '0.00000000' COMMENT '位置',
  `lasty` double(20,8) NOT NULL DEFAULT '0.00000000' COMMENT '位置',
  `network` int(11) DEFAULT NULL,
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
  `maptype` int(11) DEFAULT NULL,
  `mapkey` varchar(64) DEFAULT NULL COMMENT '3D蜂鸟地图key',
  `appname` varchar(32) DEFAULT NULL COMMENT '3D地图应用名',
  `status` int(11) DEFAULT NULL,
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
  `status` int(11) DEFAULT NULL,
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
  `status` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='网络服务器';

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

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
  `cert` int(11) DEFAULT NULL,
  `dom` varchar(64) NOT NULL DEFAULT '' COMMENT '域名',
  `ip` varchar(64) DEFAULT NULL COMMENT 'ip',
  `port` smallint(6) NOT NULL DEFAULT '443' COMMENT '服务器访问端口',
  `status` int(11) DEFAULT NULL,
  `statustime` int(11) unsigned DEFAULT NULL COMMENT '状态更新时间',
  `usrname` varchar(32) DEFAULT NULL COMMENT '访问用户名',
  `token` varchar(255) DEFAULT NULL COMMENT '密钥',
  `emails` varchar(64) DEFAULT NULL COMMENT '邮箱',
  `memo` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='网络服务器';

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

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
  `neartype` int(11) DEFAULT NULL,
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
  `type` int(11) DEFAULT NULL,
  `projectype` int(11) DEFAULT NULL,
  `tenantid` char(8) DEFAULT NULL COMMENT '所属公司',
  `scheme` varchar(12) DEFAULT NULL COMMENT '制式',
  `offtime` int(11) unsigned NOT NULL DEFAULT '600' COMMENT '位置消除时间',
  `timezone` int(11) NOT NULL DEFAULT '0' COMMENT '时区时间差',
  `forward` int(11) DEFAULT NULL,
  `mqttname` varchar(16) DEFAULT NULL COMMENT 'mqtt连接用户名',
  `mqttpwd` varchar(120) DEFAULT NULL COMMENT 'mqtt连接密码',
  `url` varchar(255) DEFAULT NULL COMMENT '数据转发地址',
  `net` int(11) DEFAULT NULL,
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
# Structure for table "qpb7ja9k_status_record_tbl"
#

DROP TABLE IF EXISTS `qpb7ja9k_status_record_tbl`;
CREATE TABLE `qpb7ja9k_status_record_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deveui` varchar(16) NOT NULL,
  `vibstate` enum('static','move') DEFAULT 'static' COMMENT '运动状态',
  `steps` int(11) DEFAULT NULL COMMENT '步数',
  `battery` enum('未充电','正在充电','充电完成','未知') DEFAULT '未知' COMMENT '充电状态',
  `vol` tinyint(4) DEFAULT NULL COMMENT '电量',
  `gwrssi` smallint(6) DEFAULT '0' COMMENT '基站接收信号强度',
  `gwsnr` float(6,2) DEFAULT '0.00' COMMENT '基站接收信噪比',
  `rssi` smallint(6) NOT NULL DEFAULT '0' COMMENT '设备接收信号强度',
  `snr` float(6,2) DEFAULT NULL COMMENT '设备接收信噪比',
  `freq` float(6,1) DEFAULT NULL COMMENT '发送频点',
  `gnss` enum('off','locating','succeed','failed','indoor','static') DEFAULT 'off' COMMENT '定位状态',
  `time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='设备状态表';

#
# Data for table "qpb7ja9k_status_record_tbl"
#


#
# Structure for table "qpb7ja9k_tracker_test_tbl"
#

DROP TABLE IF EXISTS `qpb7ja9k_tracker_test_tbl`;
CREATE TABLE `qpb7ja9k_tracker_test_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deveui` varchar(16) NOT NULL,
  `freq` float(6,1) DEFAULT NULL COMMENT '频点',
  `dr` tinyint(3) DEFAULT NULL COMMENT '速率',
  `gwrssi` smallint(6) DEFAULT NULL,
  `gwsnr` float(6,2) DEFAULT '0.00',
  `gwno` tinyint(4) DEFAULT NULL COMMENT '网关数量',
  `framecount` int(11) NOT NULL DEFAULT '0' COMMENT '帧号',
  `msgtype` varchar(64) DEFAULT NULL COMMENT '消息类型',
  `payload` varchar(1500) DEFAULT NULL COMMENT '通用字段',
  `reboot` smallint(6) DEFAULT NULL COMMENT '重启次数',
  `pktlost` smallint(6) DEFAULT NULL COMMENT '丢包数量',
  `ratelost` float(7,4) DEFAULT NULL COMMENT '丢包率',
  `time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='测试表';

#
# Data for table "qpb7ja9k_tracker_test_tbl"
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
  `taskstatus` int(11) DEFAULT NULL,
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
  `repetition` int(11) DEFAULT NULL,
  `daily` varchar(320) DEFAULT NULL COMMENT '(如果repeat是每周或者每月daily用来存储另外设置的信息)',
  `begindate` varchar(12) DEFAULT NULL COMMENT '开始日期',
  `enddate` varchar(12) DEFAULT NULL COMMENT '结束日期',
  `begintime` varchar(8) DEFAULT NULL COMMENT '开始时间',
  `endtime` varchar(8) DEFAULT NULL COMMENT '结束时间',
  `states` int(11) DEFAULT NULL,
  `ctime` int(11) DEFAULT NULL COMMENT '创建时间',
  `memo` varchar(128) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='巡检管理';

#
# Data for table "task_management_tbl"
#


#
# Structure for table "tenantid_gateway_record_tbl"
#

DROP TABLE IF EXISTS `tenantid_gateway_record_tbl`;
CREATE TABLE `tenantid_gateway_record_tbl` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='反向定位位置记录';

#
# Data for table "tenantid_gateway_record_tbl"
#


#
# Structure for table "tenantid_status_record_tbl"
#

DROP TABLE IF EXISTS `tenantid_status_record_tbl`;
CREATE TABLE `tenantid_status_record_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deveui` char(16) NOT NULL DEFAULT '',
  `vibstate` enum('static','move') DEFAULT 'static' COMMENT '运动状态',
  `battery` enum('未充电','正在充电','充电完成','未知') DEFAULT NULL COMMENT '充电状态',
  `vol` tinyint(4) DEFAULT NULL COMMENT '电池电量',
  `gwrssi` smallint(6) DEFAULT '0' COMMENT '基站接收信号强度',
  `gwsnr` float(6,2) DEFAULT '0.00' COMMENT '基站接收信噪比',
  `rssi` smallint(6) NOT NULL DEFAULT '0' COMMENT '设备接收信号强度',
  `snr` float(6,2) DEFAULT NULL COMMENT '设备接收信噪比',
  `freq` float(6,1) DEFAULT NULL COMMENT '发送频点',
  `gnss` enum('off','locating','succeed','failed') DEFAULT NULL COMMENT '定位状态',
  `time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='设备状态表';

#
# Data for table "tenantid_status_record_tbl"
#


#
# Structure for table "tenantid_tracker_record_tbl"
#

DROP TABLE IF EXISTS `tenantid_tracker_record_tbl`;
CREATE TABLE `tenantid_tracker_record_tbl` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='正向定位位置记录';

#
# Data for table "tenantid_tracker_record_tbl"
#


#
# Structure for table "undo_log"
#

DROP TABLE IF EXISTS `undo_log`;
CREATE TABLE `undo_log` (
  `branch_id` bigint(20) NOT NULL COMMENT 'branch transaction id',
  `xid` varchar(100) NOT NULL COMMENT 'global transaction id',
  `context` varchar(128) NOT NULL COMMENT 'undo_log context,such as serialization',
  `rollback_info` longblob NOT NULL COMMENT 'rollback info',
  `log_status` int(11) NOT NULL COMMENT '0:normal status,1:defense status',
  `log_created` datetime(6) NOT NULL COMMENT 'create datetime',
  `log_modified` datetime(6) NOT NULL COMMENT 'modify datetime',
  UNIQUE KEY `ux_undo_log` (`xid`,`branch_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='AT transaction mode undo table';

#
# Data for table "undo_log"
#


#
# Structure for table "users_operate_tbl"
#

DROP TABLE IF EXISTS `users_operate_tbl`;
CREATE TABLE `users_operate_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) DEFAULT NULL,
  `tenantid` char(8) DEFAULT NULL COMMENT '公司识别号',
  `action` int(11) DEFAULT NULL,
  `module` varchar(32) DEFAULT NULL COMMENT '操作模块',
  `enmodule` varchar(64) DEFAULT NULL COMMENT '操作模块',
  `method` varchar(63) DEFAULT NULL COMMENT '操作接口名',
  `detail` varchar(2000) DEFAULT NULL COMMENT '操作内容',
  `time` int(11) DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户操作日志';

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
  `prio` int(11) NOT NULL DEFAULT '0' COMMENT '用户权限',
  `country` varchar(32) DEFAULT '' COMMENT '所在国家',
  `tenantid` char(8) NOT NULL DEFAULT '' COMMENT '用户编号',
  `delprio` int(11) DEFAULT NULL COMMENT '删除权限',
  `accprio` int(11) DEFAULT NULL COMMENT '访问权限',
  `logintime` int(11) DEFAULT NULL COMMENT '最后登录时间',
  `regtime` int(11) DEFAULT NULL COMMENT '用户注册时间',
  PRIMARY KEY (`username`),
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户信息表';

#
# Data for table "users_tbl"
#

INSERT INTO `users_tbl` VALUES (1,'admin','系统管理员','39aeb81892e1bff7b9176ce1dd4a3f4f','18913015482','super@ruichuangte.com',1,'China','qpb7jakk',1,1,1757899221,1334555);

#
# Structure for table "warning_config_tbl"
#

DROP TABLE IF EXISTS `warning_config_tbl`;
CREATE TABLE `warning_config_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectid` char(8) NOT NULL DEFAULT '0' COMMENT '项目编号',
  `type` int(11) DEFAULT NULL,
  `postype` int(11) DEFAULT NULL,
  `meth` int(1) NOT NULL DEFAULT '0' COMMENT '越界告警触发方式1为进，2为出',
  `cate` int(11) DEFAULT NULL,
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
  `type` int(11) DEFAULT NULL,
  `voice` int(1) NOT NULL DEFAULT '0' COMMENT '告警声音类型',
  `vtime` int(2) NOT NULL DEFAULT '0' COMMENT '告警声音时长(0，3秒，6秒，9秒，30秒)',
  `vcycle` int(3) NOT NULL DEFAULT '0' COMMENT '告警声音周期(0，30秒，1分钟，3分钟，5分钟)',
  `memo` varchar(128) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='告警声音配置表';

#
# Data for table "warning_voice_tbl"
#
