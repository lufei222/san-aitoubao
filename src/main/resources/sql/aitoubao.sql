/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50621
Source Host           : 127.0.0.1:3306
Source Database       : aitoubao

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2019-01-10 15:13:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL COMMENT '客户ID',
  `total_amount` decimal(12,2) DEFAULT NULL COMMENT '总资产',
  `frozen_amount` decimal(12,2) DEFAULT NULL COMMENT '冻结金额：投标冻结+提现冻结',
  `available_amount` decimal(12,2) DEFAULT NULL COMMENT '可用金额',
  `received_amount` decimal(12,2) DEFAULT NULL COMMENT '回款中金额',
  `receiving_amount` decimal(12,2) DEFAULT NULL COMMENT '已回款金额',
  `historial_amount` decimal(12,2) DEFAULT NULL COMMENT '投标累计总金额（包含收益）',
  `created_by` int(11) DEFAULT NULL COMMENT '创建者，customer_id',
  `updated_by` int(11) DEFAULT NULL COMMENT '修改者，customer_id',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `bank_no` varchar(255) DEFAULT NULL COMMENT '银行账户',
  `remark` varchar(255) DEFAULT NULL,
  `type` smallint(10) DEFAULT '1' COMMENT '账户类型：1：个人账户，2：企业账户：3：测试账户，4：内部账户',
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `account_customer` (`customer_id`),
  CONSTRAINT `account_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105184 DEFAULT CHARSET=utf8 COMMENT='资金账户表';

-- ----------------------------
-- Table structure for account_journal
-- ----------------------------
DROP TABLE IF EXISTS `account_journal`;
CREATE TABLE `account_journal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL COMMENT '客户ID',
  `journal` decimal(12,2) DEFAULT NULL COMMENT '流水金额',
  `journal_no` varchar(255) DEFAULT NULL COMMENT '流水号',
  `created_by` int(11) DEFAULT NULL COMMENT '创建者，customer_id',
  `updated_by` int(11) DEFAULT NULL COMMENT '修改者，customer_id',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `origin_bank_no` varchar(255) DEFAULT NULL COMMENT '进账银行账户',
  `destination_bank_no` varchar(255) DEFAULT NULL COMMENT '出账银行账户',
  `origin` smallint(10) DEFAULT '1' COMMENT '来源，1：充值入账，2：投标冻结，3：回款，4：提现，5：充值手续费，6：提现手续费，7：利息金额,8：违约金额,9：保证金金额',
  `remark` varchar(255) NOT NULL,
  `change_type` smallint(6) DEFAULT NULL COMMENT '1：进账，2：出账',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `account_fk` (`journal`),
  KEY `account_journal_customers_fk` (`customer_id`),
  CONSTRAINT `account_journal_customers_fk` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105175 DEFAULT CHARSET=utf8 COMMENT='账户资金流水';

-- ----------------------------
-- Table structure for attachments
-- ----------------------------
DROP TABLE IF EXISTS `attachments`;
CREATE TABLE `attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `temp` tinyint(4) DEFAULT '0' COMMENT '是否为临时文件，图片预览用',
  `bin_data` longblob COMMENT '二级进数据',
  `description` varchar(500) DEFAULT NULL COMMENT '附件描述',
  `file_name` varchar(255) DEFAULT NULL COMMENT '文件名字，带格式，255字以内，windows文件名+扩展名不超过255',
  `file_type` varchar(100) DEFAULT NULL COMMENT '文件类型',
  `width` decimal(10,0) DEFAULT NULL COMMENT '宽度',
  `height` decimal(10,0) DEFAULT NULL COMMENT '高度',
  `created_at` datetime DEFAULT NULL COMMENT '创建日期',
  `updated_at` datetime DEFAULT NULL COMMENT '更新日期',
  `operator_id` int(11) DEFAULT NULL COMMENT '操作人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='附件表：图片、flash等';

-- ----------------------------
-- Table structure for claim
-- ----------------------------
DROP TABLE IF EXISTS `claim`;
CREATE TABLE `claim` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL COMMENT '报销单编号',
  `claims_type` int(4) DEFAULT NULL COMMENT '报销单类型（1，吃住：2，交通：3，娱乐：4，礼品）',
  `applicant_id` bigint(20) DEFAULT NULL COMMENT '申请人ID',
  `applicant` varchar(25) DEFAULT NULL COMMENT '申请人',
  `app_date` datetime DEFAULT NULL COMMENT '申请日期',
  `state_code` varchar(25) DEFAULT NULL COMMENT '状态代码（1，新单：2，商务执行中：3，财务审批中，4，归档）',
  `filler_name` varchar(25) DEFAULT NULL COMMENT '提交人',
  `filler_id` bigint(20) DEFAULT NULL COMMENT '提交人ID',
  `proof` varchar(1500) DEFAULT NULL COMMENT '原始凭证',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `project_id` bigint(20) DEFAULT NULL COMMENT '项目Id（报销单对应的项目）',
  `start_date` datetime DEFAULT NULL COMMENT '新建时间',
  `edit_date` datetime DEFAULT NULL COMMENT '最后一次修改时间',
  `end_date` datetime DEFAULT NULL COMMENT '完结时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2448 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for companys
-- ----------------------------
DROP TABLE IF EXISTS `companys`;
CREATE TABLE `companys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_customer_id` int(11) DEFAULT NULL COMMENT '创建该公司实体的客户ID',
  `name` varchar(100) NOT NULL COMMENT '公司名称',
  `ab_name` varchar(50) NOT NULL COMMENT '公司名称缩写',
  `phone` varchar(20) NOT NULL COMMENT '联系电话',
  `address` varchar(100) NOT NULL COMMENT '联系地址',
  `city` char(6) DEFAULT NULL COMMENT '城市代码',
  `website` varchar(50) NOT NULL COMMENT '公司网址',
  `org_license` varchar(50) DEFAULT NULL COMMENT '营业执照注册号',
  `org_tax` varchar(50) DEFAULT NULL COMMENT '税务登记证税字号',
  `org_code` varchar(50) DEFAULT NULL COMMENT '组织机构代码',
  `org_colligate_code` varchar(50) DEFAULT NULL COMMENT '3合1证件编号',
  `type` smallint(6) NOT NULL DEFAULT '1' COMMENT '公司类型，1：采购商；2：供应商；',
  `attachment_id` int(11) DEFAULT NULL COMMENT '附件id',
  `org_license_aid` int(11) DEFAULT NULL COMMENT '营业执照附件',
  `org_tax_aid` int(11) DEFAULT NULL COMMENT '税务登记证附件',
  `org_code_aid` int(11) DEFAULT NULL COMMENT '组织机构代码证附件',
  `org_colligate_aid` int(11) DEFAULT NULL COMMENT '3合1附件id',
  `status` smallint(6) NOT NULL DEFAULT '1' COMMENT '公司状态，1：待审核；2：审核已通过；3：审核未通过；',
  `org_license_status` smallint(6) NOT NULL DEFAULT '1' COMMENT '营业执照审核状态，1：待审核；2：已通过；3：未通过；',
  `org_tax_status` smallint(6) NOT NULL DEFAULT '1' COMMENT '税务登记证审核状态，1：待审核；2：已通过；3：未通过；',
  `org_code_status` smallint(6) NOT NULL DEFAULT '1' COMMENT '组织机构代码审核状态，1：待审核；2：已通过；3：未通过；',
  `org_colligate_status` smallint(6) NOT NULL DEFAULT '1' COMMENT '3合1证审核状态，1：待审核；2：已通过；3：未通过；',
  `verified` tinyint(1) NOT NULL DEFAULT '0' COMMENT '公司是否已验证，0：否；1：是；',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '公司是否已删除，0：否；1：是；',
  `buyer_category_groups` varchar(255) NOT NULL DEFAULT '' COMMENT '关注买入的品种大类列表，英文逗号分割，category_groups的group_code',
  `seller_category_groups` varchar(255) NOT NULL DEFAULT '' COMMENT '可销售的品种大类列表，英文逗号分割，category_groups的group_code',
  `seller_districts` varchar(25) NOT NULL DEFAULT '' COMMENT '可销售的区域，英文逗号分隔，存储区域表district的ID',
  `business` varchar(255) DEFAULT NULL COMMENT '主营业务',
  `default_address_id` int(11) DEFAULT NULL COMMENT '默认收货地址信息',
  `default_bank_id` int(11) DEFAULT NULL COMMENT '默认银行信息',
  `buyer_level` smallint(6) DEFAULT NULL COMMENT '采购商等级，1：普通会员；2：铜牌会员；3：银牌会员；4：金牌会员',
  `seller_level` smallint(6) DEFAULT NULL COMMENT '供应商等级，1：普通会员；2：铜牌会员；3：银牌会员；4：金牌会员；',
  `purchaser_type` smallint(6) DEFAULT NULL COMMENT '采购商类型,1:贸易商(trafficker);2:次终端(secondTerminal);3:终端(terminal)',
  `supplier_type` smallint(6) DEFAULT NULL COMMENT '采购商类型，1：上游生厂商，2:一级代理商',
  `default_invoice_id` int(11) DEFAULT NULL COMMENT '默认开票信息',
  `kuaisu_supplier_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否供应商，0：否；1：是；',
  `kuaisu_supplier_level` char(1) DEFAULT NULL COMMENT '供应商级别:A,B,C,D...',
  `kuaisu_supplier_limit` decimal(13,3) DEFAULT NULL COMMENT '供应商额度，吨数',
  `taosu_contract_supplier_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否协议供应商，0：否；1：是；',
  `taosu_contract_supplier_level` char(1) DEFAULT NULL COMMENT '协议供应商级别:A,B,C,D...',
  `auction_flag` smallint(6) NOT NULL DEFAULT '1' COMMENT '拍卖资格状态（供应商），1：未申请；2：待审核；3：审核通过；4：审核未通过；99：禁用；',
  `bid_flag` smallint(6) NOT NULL DEFAULT '1' COMMENT '竞拍资格状态（采购商），1：未申请；2：待审核；3：审核通过；4：审核未通过；99：禁用；',
  `registered_capital` decimal(13,2) DEFAULT NULL COMMENT '注册资金',
  `org_code_audit_by` int(11) DEFAULT NULL COMMENT '组织机构代码审核人',
  `org_license_audit_by` int(11) DEFAULT NULL COMMENT '营业执照审核人',
  `org_colligate_audit_by` int(11) DEFAULT NULL COMMENT '三合一证件审核人',
  `org_code_audit_at` datetime DEFAULT NULL COMMENT '组织机构代码审核时间',
  `org_license_audit_at` datetime DEFAULT NULL COMMENT '营业执照审核时间',
  `org_tax_audit_at` datetime DEFAULT NULL COMMENT '税务登记审核时间',
  `org_colligate_audit_at` datetime DEFAULT NULL COMMENT '三合一证件审核时间',
  `org_tax_audit_by` int(11) DEFAULT NULL COMMENT '税务登记审核人',
  `credit_limit` decimal(13,2) DEFAULT '0.00' COMMENT '客户授信额度',
  `credit_term` int(11) DEFAULT '0' COMMENT '客户授信期限',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `created_by` int(11) DEFAULT NULL COMMENT '创建者，staff_id，后台创建时才有值',
  `updated_by` int(11) DEFAULT NULL COMMENT '修改者，staff_id，后台编辑时才有值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111538 DEFAULT CHARSET=utf8 COMMENT='公司表';

-- ----------------------------
-- Table structure for customers
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL COMMENT '关联的公司ID',
  `disable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用，0：否；1：是；',
  `gender` tinyint(1) NOT NULL DEFAULT '1' COMMENT '性别，1：男；2：女；',
  `login_name` varchar(255) DEFAULT NULL COMMENT '登录名称，手机号码',
  `name` varchar(255) NOT NULL COMMENT '客户姓名',
  `password` varchar(32) NOT NULL COMMENT '密码，md5',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `phone_verified` tinyint(1) DEFAULT '0' COMMENT '电话是否已验证，0：否；1：是；',
  `tel` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL,
  `email_verified` tinyint(1) DEFAULT '0' COMMENT '邮箱是否已验证，0：否；1：是；',
  `qq` varchar(20) DEFAULT NULL COMMENT 'qq号码',
  `wechat` varchar(20) DEFAULT NULL COMMENT '微信',
  `fax` varchar(20) DEFAULT NULL COMMENT '传真',
  `city` char(6) DEFAULT NULL COMMENT '所在城市代码',
  `qq_key` varchar(255) DEFAULT NULL COMMENT 'qq登录key',
  `weibo_key` varchar(255) DEFAULT NULL COMMENT '微博登录key',
  `wechat_key` varchar(255) DEFAULT NULL COMMENT '微信登录key',
  `virtualized` tinyint(1) DEFAULT '0' COMMENT '是否虚拟用户（内部客户）',
  `source` smallint(6) DEFAULT '1' COMMENT '用户来源，1：线上注册；2：线下渠道；3：线上咨询',
  `position` smallint(6) DEFAULT NULL COMMENT '职位,1:老板(boss);2:采购负责人(purchaser);3:销售负责人(salesman);99:其他(other)',
  `created_at` datetime DEFAULT NULL COMMENT '注册时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `created_by` int(11) DEFAULT NULL COMMENT '创建者，staff_id，后台注册的才有值',
  `updated_by` int(11) DEFAULT NULL COMMENT '修改者，staff_id，后台编辑的才有值',
  `bank_no` varchar(255) DEFAULT NULL COMMENT '银行账户',
  `id_no` varchar(255) DEFAULT NULL COMMENT '身份证号码',
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_name` (`login_name`),
  UNIQUE KEY `phone_UNIQUE` (`phone`),
  KEY `customers_companys_fk` (`company_id`),
  CONSTRAINT `customers_companys_fk` FOREIGN KEY (`company_id`) REFERENCES `companys` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105155 DEFAULT CHARSET=utf8 COMMENT='客户表';

-- ----------------------------
-- Table structure for customers_projects
-- ----------------------------
DROP TABLE IF EXISTS `customers_projects`;
CREATE TABLE `customers_projects` (
  `customer_id` int(11) NOT NULL COMMENT '客户ID',
  `projects_id` bigint(20) NOT NULL COMMENT '项目ID',
  `invest_amount` decimal(12,2) DEFAULT NULL COMMENT '投标金额',
  `invest_interest` decimal(12,2) DEFAULT NULL COMMENT '投标利息',
  `createded_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `bank_no` varchar(255) DEFAULT NULL COMMENT '银行账户',
  `remark` varchar(255) NOT NULL,
  `deduction_type` smallint(10) DEFAULT '0' COMMENT '抵扣类型：0：无，1：现金券，2：红包',
  `disable` tinyint(4) DEFAULT NULL COMMENT '是否禁用，0：否，1：是',
  PRIMARY KEY (`customer_id`,`projects_id`),
  UNIQUE KEY `customers_projects_fk` (`projects_id`) USING BTREE,
  CONSTRAINT `customers_projects_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `customers_projects_ibfk_2` FOREIGN KEY (`projects_id`) REFERENCES `project` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户投标表';

-- ----------------------------
-- Table structure for customers_roles
-- ----------------------------
DROP TABLE IF EXISTS `customers_roles`;
CREATE TABLE `customers_roles` (
  `customer_id` int(11) NOT NULL COMMENT '用户ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `data_areas` varchar(255) NOT NULL COMMENT '数据权限，英文逗号分隔，存储组织机构ID',
  PRIMARY KEY (`customer_id`,`role_id`),
  KEY `customers_roles_role_fk` (`role_id`) USING BTREE,
  CONSTRAINT `customers_roles_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `customers_roles_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户角色表';

-- ----------------------------
-- Table structure for expense
-- ----------------------------
DROP TABLE IF EXISTS `expense`;
CREATE TABLE `expense` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL COMMENT '费用单编号',
  `expenses_type` int(4) DEFAULT NULL COMMENT '费用单类型（1，项目费用：2，合同费用：3，充值费用：4：提现费用：99，其他费用）',
  `applicant_id` bigint(20) DEFAULT NULL COMMENT '申请人ID',
  `applicant` varchar(25) DEFAULT NULL COMMENT '申请人',
  `app_date` datetime DEFAULT NULL COMMENT '申请日期',
  `state_code` varchar(25) DEFAULT NULL COMMENT '状态代码（1，新单：2，商务执行中：3，财务审批中，4，归档）',
  `filler_name` varchar(25) DEFAULT NULL COMMENT '提交人',
  `filler_id` bigint(20) DEFAULT NULL COMMENT '提交人ID',
  `proof` varchar(1500) DEFAULT NULL COMMENT '原始凭证',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `project_id` bigint(20) DEFAULT NULL COMMENT '项目Id（费用单对应的项目）',
  `start_date` datetime DEFAULT NULL COMMENT '新建时间',
  `edit_date` datetime DEFAULT NULL COMMENT '最后一次修改时间',
  `end_date` datetime DEFAULT NULL COMMENT '完结时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2421 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for menus
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL COMMENT '父级Id',
  `permission_id` int(11) DEFAULT NULL COMMENT '关联的权限ID',
  `url` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '名称',
  `display_order` smallint(6) NOT NULL COMMENT '显示顺序',
  `sub_sys` varchar(25) NOT NULL COMMENT '所属子系统，oss：运营系统',
  PRIMARY KEY (`id`),
  KEY `uc_menus_parent_fk` (`parent_id`) USING BTREE,
  KEY `uc_menus_permissions_fk` (`permission_id`) USING BTREE,
  CONSTRAINT `menus_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `menus` (`id`),
  CONSTRAINT `menus_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=416 DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Table structure for organizations
-- ----------------------------
DROP TABLE IF EXISTS `organizations`;
CREATE TABLE `organizations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL COMMENT '父机构ID',
  `name` varchar(50) NOT NULL COMMENT '机构名称',
  `code` varchar(25) NOT NULL COMMENT '代码',
  `type` smallint(6) DEFAULT NULL COMMENT '组织机构类型，保留字段',
  `disable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用，0：否；1：是；',
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `created_by` int(11) NOT NULL COMMENT '创建者，staff_id',
  `updated_by` int(11) NOT NULL COMMENT '修改者，staff_id',
  PRIMARY KEY (`id`),
  KEY `organizations_parent_fk` (`parent_id`) USING BTREE,
  CONSTRAINT `organizations_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `organizations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='组织机构表';

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '名称',
  `code` varchar(50) NOT NULL COMMENT '编码',
  `menu` tinyint(1) NOT NULL COMMENT '是否菜单权限，0：否；1：是；',
  `sub_sys` varchar(25) NOT NULL COMMENT '子系统，oss：运营系统',
  `sub_module` varchar(25) NOT NULL COMMENT '子模块',
  `disable` tinyint(1) NOT NULL COMMENT '是否禁用，0：否；1：是；',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1013 DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `project_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(100) DEFAULT NULL COMMENT '项目名称',
  `project_code` varchar(20) DEFAULT NULL COMMENT '项目编号',
  `project_type` varchar(20) DEFAULT NULL COMMENT '项目类型 0活期理财  1 15天贷 2 30天标 3 45天标 4....',
  `date_type` varchar(20) CHARACTER SET utf16le DEFAULT NULL,
  `interest_date` int(10) DEFAULT '0' COMMENT '项目投资（天数）',
  `interest_ratio` decimal(12,4) DEFAULT '0.0000' COMMENT '利息率',
  `company_id` bigint(20) DEFAULT NULL COMMENT '筹资客户id',
  `company_name` varchar(50) DEFAULT NULL COMMENT '筹资客户名称',
  `linkman_id` bigint(20) DEFAULT NULL COMMENT '联系人ID',
  `linkman_name` varchar(20) DEFAULT NULL COMMENT '联系人名字',
  `linkman_phone` varchar(20) DEFAULT NULL COMMENT '联系号码',
  `create_id` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `creater_name` varchar(25) DEFAULT NULL COMMENT '创建人',
  `applier_id` varchar(25) DEFAULT NULL COMMENT '申请人id',
  `applier_name` varchar(25) DEFAULT NULL COMMENT '申请人',
  `follower_id` bigint(20) DEFAULT NULL COMMENT '跟单人id',
  `follower_name` varchar(30) DEFAULT NULL,
  `director_id` bigint(20) DEFAULT NULL COMMENT '项目负责id',
  `director_name` varchar(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `pstart_date` datetime DEFAULT NULL COMMENT '竞标日期',
  `pfull_date` datetime DEFAULT NULL COMMENT '满标日期',
  `pvalue_date` datetime DEFAULT NULL COMMENT '起息日期',
  `pend_date` datetime DEFAULT NULL COMMENT '回款日期',
  `prealend_date` datetime DEFAULT NULL COMMENT '实际回款日期',
  `pover_date` datetime DEFAULT NULL COMMENT '项目结束日期',
  `budget_interest` decimal(12,4) DEFAULT NULL COMMENT '预算利息',
  `real_interest` decimal(12,4) DEFAULT NULL COMMENT '实际利息',
  `budget_expenses` decimal(12,4) DEFAULT NULL COMMENT '预算支出',
  `real_expenses` decimal(12,4) DEFAULT NULL COMMENT '实际支出',
  `tax` decimal(12,4) DEFAULT NULL COMMENT '税费',
  `de_tax` decimal(12,4) DEFAULT NULL COMMENT '税费',
  `budget_income` decimal(12,4) DEFAULT NULL COMMENT '预算收入',
  `real_income` decimal(12,4) DEFAULT NULL COMMENT '预算收入',
  `edit_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `remark` text COMMENT '备注',
  `remark_date` datetime DEFAULT NULL COMMENT '添加备注时间',
  `state_code` varchar(25) DEFAULT NULL COMMENT '项目审批状态代码',
  `final_result` varchar(20) DEFAULT NULL COMMENT '项目执行结果（按时完成、未按时完成、项目取消、项目失败、其他）',
  `type` int(3) DEFAULT '0' COMMENT '项目类型 0活期理财  1 15天贷 2 30天标 3 45天标 4....',
  `is_del` bit(1) DEFAULT b'0',
  `is_count` int(1) DEFAULT '0' COMMENT '是否计提',
  `is_pDo_tax` int(1) DEFAULT '0' COMMENT '是否计抵扣税（默认0）',
  `budget_profit` decimal(12,2) DEFAULT NULL COMMENT '预计利润',
  `real_profit` decimal(12,2) DEFAULT NULL COMMENT '预计利润',
  `profit_rate` decimal(12,2) DEFAULT NULL COMMENT '利润率',
  `net_profit` decimal(12,2) DEFAULT NULL COMMENT '净利润率',
  `interest_ratio_in` decimal(12,4) DEFAULT '0.0000' COMMENT '对内利息率',
  `pstart_date_in` datetime DEFAULT NULL COMMENT '借款时间对内',
  `pfull_date_in` datetime DEFAULT NULL COMMENT '实际借款时间对内',
  `pvalue_date_in` datetime DEFAULT NULL COMMENT '起息日期对内',
  `pend_date_in` datetime DEFAULT NULL COMMENT '回款日期对内',
  `prealend_date_in` datetime DEFAULT NULL COMMENT '实际回款日期对内',
  `cur_invest_money` decimal(12,2) DEFAULT NULL COMMENT '当前投资金额',
  `invest_money` decimal(12,2) DEFAULT NULL COMMENT '标的总投资金额',
  PRIMARY KEY (`project_id`),
  KEY `project_name` (`project_name`)
) ENGINE=InnoDB AUTO_INCREMENT=1957 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `code` varchar(30) DEFAULT NULL COMMENT '角色编码，不允许编辑，有值时，代表内置角色。',
  `remark` varchar(200) NOT NULL COMMENT '备注',
  `data_areas` varchar(255) DEFAULT NULL COMMENT '数据权限，英文逗号分割，内容为组织机构ID',
  `sub_sys` varchar(25) DEFAULT NULL COMMENT '子系统，oss：运营系统',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `created_by` int(11) DEFAULT NULL COMMENT '创建者staff_id',
  `updated_by` int(11) DEFAULT NULL COMMENT '修改者staff_id',
  `disable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用，0：否；1：是；',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=567 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Table structure for role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `role_permissions`;
CREATE TABLE `role_permissions` (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `permission_id` int(11) NOT NULL COMMENT '权限ID',
  `disable` tinyint(4) DEFAULT NULL COMMENT '是否禁用，0：否，1：是',
  PRIMARY KEY (`role_id`,`permission_id`),
  KEY `role_permissions_permission_fk` (`permission_id`) USING BTREE,
  CONSTRAINT `role_permissions_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`),
  CONSTRAINT `role_permissions_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色权限表';

-- ----------------------------
-- Table structure for staffs
-- ----------------------------
DROP TABLE IF EXISTS `staffs`;
CREATE TABLE `staffs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_id` int(11) DEFAULT NULL COMMENT '组织机构ID',
  `login_name` varchar(20) NOT NULL COMMENT '登录用户名',
  `password` varchar(32) NOT NULL COMMENT '密码，md5',
  `name` varchar(60) NOT NULL COMMENT '姓名',
  `english_name` varchar(50) NOT NULL COMMENT '英文名',
  `gender` tinyint(1) NOT NULL COMMENT '性别，1：男；2：女；',
  `disable` tinyint(1) NOT NULL COMMENT '是否禁用，0：否；1：是；',
  `email` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `wechat` varchar(100) NOT NULL,
  `qq` varchar(20) NOT NULL,
  `manager` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否管理者，0：否；1：是；\n如果是管理者，自动继承所在部门的数据权限',
  `districts` varchar(25) NOT NULL COMMENT '负责的业务的区域范围，英文逗号分割，区域表district的district_code',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `remark` varchar(255) NOT NULL,
  `purchase_category_groups` varchar(255) NOT NULL COMMENT '负责采购的品种大类列表，英文逗号分隔，category_groups的group_code',
  `sell_category_groups` varchar(255) NOT NULL COMMENT '负责销售的品种大类列表，英文逗号分隔，category_groups的group_code',
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `created_by` int(11) NOT NULL COMMENT '创建者staff_id',
  `updated_by` int(11) NOT NULL COMMENT '修改者staff_id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_name_UNIQUE` (`login_name`) USING BTREE,
  KEY `staffs_orgs_fk` (`org_id`) USING BTREE,
  CONSTRAINT `staffs_ibfk_1` FOREIGN KEY (`org_id`) REFERENCES `organizations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16310 DEFAULT CHARSET=utf8 COMMENT='员工表';

-- ----------------------------
-- Table structure for staffs_roles
-- ----------------------------
DROP TABLE IF EXISTS `staffs_roles`;
CREATE TABLE `staffs_roles` (
  `staff_id` int(11) NOT NULL COMMENT '员工ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `data_areas` varchar(255) NOT NULL COMMENT '数据权限，英文逗号分隔，存储组织机构ID',
  PRIMARY KEY (`staff_id`,`role_id`),
  KEY `staff_roles_role_fk` (`role_id`) USING BTREE,
  CONSTRAINT `staffs_roles_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `staffs_roles_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工角色表';



INSERT INTO `aitoubao`.`account_journal` (`id`, `customer_id`, `journal`, `journal_no`, `created_by`, `updated_by`, `updated_at`, `origin_bank_no`, `destination_bank_no`, `origin`, `remark`, `change_type`, `created_at`) VALUES ('105151', '256', '1000.00', '2018439543954', '256', '3234', '2016-04-24 23:00:37', NULL, '424242424', '1', '42424', '4', '2016-04-24 23:00:52');
INSERT INTO `aitoubao`.`account_journal` (`id`, `customer_id`, `journal`, `journal_no`, `created_by`, `updated_by`, `updated_at`, `origin_bank_no`, `destination_bank_no`, `origin`, `remark`, `change_type`, `created_at`) VALUES ('105152', '256', '0.00', '2016-04-24-000000001', '700', '715', '2016-05-01 23:01:45', '6225783800048389299', '6227003122120113446', '4', '测试账户', '2', '2016-05-01 23:01:45');
INSERT INTO `aitoubao`.`account_journal` (`id`, `customer_id`, `journal`, `journal_no`, `created_by`, `updated_by`, `updated_at`, `origin_bank_no`, `destination_bank_no`, `origin`, `remark`, `change_type`, `created_at`) VALUES ('105153', '256', '0.00', '2016-04-23-000000001', '700', '715', '2016-05-01 23:01:49', '6225783800048389299', '6227003122120113446', '4', '测试账户', '2', '2016-05-01 23:01:49');
INSERT INTO `aitoubao`.`account_journal` (`id`, `customer_id`, `journal`, `journal_no`, `created_by`, `updated_by`, `updated_at`, `origin_bank_no`, `destination_bank_no`, `origin`, `remark`, `change_type`, `created_at`) VALUES ('105154', '256', '0.00', '2016-04-23-000000001', '700', '715', '2016-05-01 23:01:52', '6225783800048389299', '6227003122120113446', '4', '测试账户', '2', '2016-05-01 23:01:52');

INSERT INTO `aitoubao`.`account` (`id`, `customer_id`, `total_amount`, `frozen_amount`, `available_amount`, `received_amount`, `receiving_amount`, `historial_amount`, `created_by`, `updated_by`, `updated_at`, `bank_no`, `remark`, `type`, `created_at`) VALUES ('105152', '512', '1006.00', '100.00', '700.00', '303.00', '202.00', '500.00', NULL, NULL, '2016-04-24 18:17:51', NULL, NULL, '0', '2016-04-24 18:17:51');

INSERT INTO `aitoubao`.`companys` (`id`, `owner_customer_id`, `name`, `ab_name`, `phone`, `address`, `city`, `website`, `org_license`, `org_tax`, `org_code`, `org_colligate_code`, `type`, `attachment_id`, `org_license_aid`, `org_tax_aid`, `org_code_aid`, `org_colligate_aid`, `status`, `org_license_status`, `org_tax_status`, `org_code_status`, `org_colligate_status`, `verified`, `deleted`, `buyer_category_groups`, `seller_category_groups`, `seller_districts`, `business`, `default_address_id`, `default_bank_id`, `buyer_level`, `seller_level`, `purchaser_type`, `supplier_type`, `default_invoice_id`, `kuaisu_supplier_flag`, `kuaisu_supplier_level`, `kuaisu_supplier_limit`, `taosu_contract_supplier_flag`, `taosu_contract_supplier_level`, `auction_flag`, `bid_flag`, `registered_capital`, `org_code_audit_by`, `org_license_audit_by`, `org_colligate_audit_by`, `org_code_audit_at`, `org_license_audit_at`, `org_tax_audit_at`, `org_colligate_audit_at`, `org_tax_audit_by`, `credit_limit`, `credit_term`, `remark`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES ('256', NULL, 'A有限公司', '', '', '', NULL, '', '', '', '', NULL, '1', NULL, NULL, NULL, NULL, NULL, '1', '1', '1', '1', '1', '0', '1', 'S_COMMON,S_RESOURCE', '', '', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '0', NULL, NULL, '0', NULL, '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '0', '', '2014-11-06 16:41:06', '2019-01-10 15:09:33', '195', '195');
INSERT INTO `aitoubao`.`companys` (`id`, `owner_customer_id`, `name`, `ab_name`, `phone`, `address`, `city`, `website`, `org_license`, `org_tax`, `org_code`, `org_colligate_code`, `type`, `attachment_id`, `org_license_aid`, `org_tax_aid`, `org_code_aid`, `org_colligate_aid`, `status`, `org_license_status`, `org_tax_status`, `org_code_status`, `org_colligate_status`, `verified`, `deleted`, `buyer_category_groups`, `seller_category_groups`, `seller_districts`, `business`, `default_address_id`, `default_bank_id`, `buyer_level`, `seller_level`, `purchaser_type`, `supplier_type`, `default_invoice_id`, `kuaisu_supplier_flag`, `kuaisu_supplier_level`, `kuaisu_supplier_limit`, `taosu_contract_supplier_flag`, `taosu_contract_supplier_level`, `auction_flag`, `bid_flag`, `registered_capital`, `org_code_audit_by`, `org_license_audit_by`, `org_colligate_audit_by`, `org_code_audit_at`, `org_license_audit_at`, `org_tax_audit_at`, `org_colligate_audit_at`, `org_tax_audit_by`, `credit_limit`, `credit_term`, `remark`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES ('512', '512', 'B有限公司', '', '0216100', '', NULL, '', '', '', '', NULL, '2', NULL, NULL, NULL, NULL, NULL, '2', '1', '1', '1', '1', '0', '0', 'S_COMMON,S_RESOURCE', 'P_PP_PE,P_PVC,P_PS_ABS,P_OTHER,A_PP_PE,A_PVC,A_PS_ABS,A_OTHER', 'HD', ' pp pe', NULL, NULL, '1', '1', '0', '0', NULL, '0', NULL, '0.000', '0', NULL, '1', '1', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '0', '', '2014-11-08 10:57:31', '2019-01-10 15:09:41', '188', '16287');

INSERT INTO `aitoubao`.`customers` (`id`, `company_id`, `disable`, `gender`, `login_name`, `name`, `password`, `last_login_time`, `phone`, `phone_verified`, `tel`, `email`, `email_verified`, `qq`, `wechat`, `fax`, `city`, `qq_key`, `weibo_key`, `wechat_key`, `virtualized`, `source`, `position`, `created_at`, `updated_at`, `created_by`, `updated_by`, `bank_no`, `id_no`, `remark`) VALUES ('256', '256', '0', '1', 'customer256', '吴芝', 'e10adc3949ba59abbe56e057f20f883e', NULL, '256', '0', '256', '', '0', '15643643', 'zzhi', '', '310000', '', '', '', '0', '1', NULL, '2014-11-06 16:41:06', '2019-01-10 15:06:28', '195', '195', '6227003122120113446', '44033199806114513', '');
INSERT INTO `aitoubao`.`customers` (`id`, `company_id`, `disable`, `gender`, `login_name`, `name`, `password`, `last_login_time`, `phone`, `phone_verified`, `tel`, `email`, `email_verified`, `qq`, `wechat`, `fax`, `city`, `qq_key`, `weibo_key`, `wechat_key`, `virtualized`, `source`, `position`, `created_at`, `updated_at`, `created_by`, `updated_by`, `bank_no`, `id_no`, `remark`) VALUES ('512', '512', '0', '2', 'customer512', '吴静儿', 'e10adc3949ba59abbe56e057f20f883e', NULL, '512', '1', '512', '', '0', '', '', '', '310000', '', '', '', '0', '1', NULL, '2014-11-08 10:57:31', '2019-01-10 15:06:25', '188', '180', '6227003122120113446', '440583199706114003', '');

INSERT INTO `aitoubao`.`menus` (`id`, `parent_id`, `permission_id`, `url`, `name`, `display_order`, `sub_sys`) VALUES ('1', NULL, NULL, '', '系统管理', '1', 'oss');
INSERT INTO `aitoubao`.`organizations` (`id`, `parent_id`, `name`, `code`, `type`, `disable`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES ('1', NULL, 'A有限公司', '', '1001', '0', '2014-10-23 23:21:48', '2015-03-30 14:33:50', '1', '1');


INSERT INTO `permissions` VALUES ('1', '用户查询', 'ROLE_UC_USERS_SELECT', '1', 'oss', '用户管理', '1');
INSERT INTO `permissions` VALUES ('2', '用户管理', 'ROLE_UC_USERS_UPDATE', '0', 'oss', '用户管理', '1');
INSERT INTO `permissions` VALUES ('3', '组织机构查询', 'ROLE_UC_ORGS_SELECT', '1', 'oss', '组织机构管理', '1');
INSERT INTO `permissions` VALUES ('4', '组织机构管理', 'ROLE_UC_ORGS_UPDATE', '0', 'oss', '组织机构管理', '1');
INSERT INTO `permissions` VALUES ('5', '职位查询', 'ROLE_UC_DUTIES_SELECT', '1', 'oss', '职位管理', '1');
INSERT INTO `permissions` VALUES ('6', '职位管理', 'ROLE_UC_DUTIES_UPDATE', '0', 'oss', '职位管理', '1');
INSERT INTO `permissions` VALUES ('7', '岗位查询', 'ROLE_UC_POSTS_SELECT', '1', 'oss', '岗位管理', '1');
INSERT INTO `permissions` VALUES ('8', '岗位管理', 'ROLE_UC_POSTS_UPDATE', '0', 'oss', '岗位管理', '1');
INSERT INTO `permissions` VALUES ('9', '员工查询', 'ROLE_UC_STAFFS_SELECT', '1', 'oss', '员工管理', '1');
INSERT INTO `permissions` VALUES ('10', '员工管理', 'ROLE_UC_STAFFS_UPDATE', '0', 'oss', '员工管理', '1');
INSERT INTO `permissions` VALUES ('11', '权限查询', 'ROLE_UC_ROLES_SELECT', '1', 'oss', '权限管理', '1');
INSERT INTO `permissions` VALUES ('12', '权限管理', 'ROLE_UC_ROLES_UPDATE', '0', 'oss', '权限管理', '1');
INSERT INTO `permissions` VALUES ('13', '字典查询', 'ROLE_UC_DICTS_SELECT', '1', 'oss', '字典管理', '1');
INSERT INTO `permissions` VALUES ('14', '字典管理', 'ROLE_UC_DICTS_UPDATE', '0', 'oss', '字典管理', '1');


-- ----------------------------
INSERT INTO `project` VALUES ('1', '七天通知贷', '20151601032046', '通知贷', null, '7', '0.0980', '1', '网金控股公司', '16292', '胡平安', null, '16309', '罗三', null, null, null, null, null, null, '2016-03-02 10:05:42', '2016-03-02 10:05:42', '2016-03-02 10:05:42', '2016-03-02 10:05:42', '2016-03-02 10:05:42', '2016-03-02 10:05:42', null, null, null, '1000.0000', '2000.0000', null, null, '12000.0000', null, '2016-05-01 14:25:11', '测试数据', null, '1', null, '0', '\0', '0', '0', null, null, null, null, '0.0000', null, null, null, null, null, '5000.00', '10000.00');
INSERT INTO `project` VALUES ('1941', ' 100起投，长兴2号298-11', '20151601032046', '1', '1', '0', '0.0870', '1', '334', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '2016-01-27 23:24:56', '2016-01-28 23:25:02', '2016-01-03 23:25:07', '2015-12-30 23:25:13', '2016-01-23 23:25:19', '2016-01-30 23:25:24', '2016-01-29 23:25:30', '12.0000', '1.0000', '1.0000', '1.0000', '1.0000', '1.0000', '1.0000', '1.0000', '2016-05-01 14:25:11', '112', '2016-02-06 23:26:11', '2', '112', '1', '\0', '0', '0', null, null, null, null, '0.0000', null, null, null, null, null, '5000.00', '10000.00');
INSERT INTO `project` VALUES ('1942', '七32天通知贷', '20151601032046', '通知贷', null, '7', '0.0640', '1', '网金控股公司', '16292', '胡平安', null, '16309', '罗峰', null, null, null, null, null, null, '2016-03-04 16:20:34', '2016-03-04 16:20:34', '2016-03-04 16:20:34', '2016-03-04 16:20:34', '2016-03-04 16:20:34', '2016-03-04 16:28:01', null, null, null, '1000.0000', '2000.0000', null, null, '12000.0000', null, '2016-05-01 14:25:11', '测试数据543654654', null, '3', null, '0', '\0', '0', '0', null, null, null, null, '0.0000', null, null, null, null, null, '5000.00', '10000.00');
INSERT INTO `project` VALUES ('1943', null, null, null, null, '0', '0.0270', '0', null, '0', null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0.0000', '0.0000', null, null, '0.0000', null, '2016-05-01 14:25:11', '测试数据', null, '4', null, '0', '\0', '0', '0', null, null, null, null, '0.0000', null, null, null, null, null, '5000.00', '10000.00');
INSERT INTO `project` VALUES ('1945', '七天通知贷', '20151601032046', '通知贷', null, '7', '0.0540', '1', '网金控股公司', '16292', '胡平安', null, '16309', '罗三', null, null, null, null, null, null, '2016-03-02 10:08:34', '2016-03-02 10:08:34', '2016-03-02 10:08:34', '2016-03-02 10:08:34', '2016-03-02 10:08:34', '2016-03-02 10:08:34', null, null, null, '1000.0000', '2000.0000', null, null, '12000.0000', null, '2016-05-01 14:25:11', '测试数据', null, '4', null, '0', '\0', '0', '0', null, null, null, null, '0.0000', null, null, null, null, null, '5000.00', '10000.00');
INSERT INTO `project` VALUES ('1946', '七天通知贷', '20151601032046', '通知贷', null, '7', '0.0110', '1', '网金控股公司', '16292', '胡平安', null, '16309', '罗三', null, null, null, null, null, null, '2016-03-02 10:08:37', '2016-03-02 10:08:37', '2016-03-02 10:08:37', '2016-03-02 10:08:37', '2016-03-02 10:08:37', '2016-03-02 10:08:37', null, null, null, '1000.0000', '2000.0000', null, null, '12000.0000', null, '2016-05-01 14:25:11', '测试数据', null, '5', null, '0', '\0', '0', '0', null, null, null, null, '0.0000', null, null, null, null, null, '5000.00', '10000.00');
INSERT INTO `project` VALUES ('1947', '七天通知贷', '20151601032046', '通知贷', null, '7', '0.0640', '1', '网金控股公司', '16292', '胡平安', null, '16309', '罗三', null, null, null, null, null, null, '2016-03-02 10:08:42', '2016-03-02 10:08:42', '2016-03-02 10:08:42', '2016-03-02 10:08:42', '2016-03-02 10:08:42', '2016-03-02 10:08:42', null, null, null, '1000.0000', '2000.0000', null, null, '12000.0000', null, '2016-05-01 14:25:11', '测试数据', null, '6', null, '0', '\0', '0', '0', null, null, null, null, '0.0000', null, null, null, null, null, '5000.00', '10000.00');
INSERT INTO `project` VALUES ('1948', '七天通知贷', '20151601032046', '通知贷', null, '7', '0.0640', '1', '网金控股公司', '16292', '胡平安', null, '16309', '罗三', null, null, null, null, null, null, '2016-03-02 10:08:48', '2016-03-02 10:08:48', '2016-03-02 10:08:48', '2016-03-02 10:08:48', '2016-03-02 10:08:48', '2016-03-02 10:08:48', null, null, null, '1000.0000', '2000.0000', null, null, '12000.0000', null, '2016-05-01 14:25:11', '测试数据3', null, '6', null, '0', '\0', '0', '0', null, null, null, null, '0.0000', null, null, null, null, null, '5000.00', '10000.00');
INSERT INTO `project` VALUES ('1949', '七天通知贷', '20151601032046', '通知贷', null, '7', '0.0640', '1', '网金控股公司', '16292', '胡平安', null, '16309', '罗三', null, null, null, null, null, null, '2016-03-02 10:08:53', '2016-03-02 10:08:53', '2016-03-02 10:08:53', '2016-03-02 10:08:53', '2016-03-02 10:08:53', '2016-03-02 10:08:53', null, null, null, '1000.0000', '2000.0000', null, null, '12000.0000', null, '2016-05-01 14:25:11', '测试数据5', null, '7', null, '0', '\0', '0', '0', null, null, null, null, '0.0000', null, null, null, null, null, '5000.00', '10000.00');
INSERT INTO `project` VALUES ('1950', '七天通知贷', '20151601032046', '通知贷', null, '7', '0.0640', '1', '网金控股公司', '16292', '胡平安', null, '16309', '罗三', null, null, null, null, null, null, '2016-03-02 10:08:56', '2016-03-02 10:08:56', '2016-03-02 10:08:56', '2016-03-02 10:08:56', '2016-03-02 10:08:56', '2016-03-02 10:08:56', null, null, null, '1000.0000', '2000.0000', null, null, '12000.0000', null, '2016-05-01 14:25:11', '测试数据6', null, '8', null, '0', '\0', '0', '0', null, null, null, null, '0.0000', null, null, null, null, null, '5000.00', '10000.00');
INSERT INTO `project` VALUES ('1951', '七天通知贷', '20151601032046', '通知贷', null, '7', '0.0620', '1', '网金控股公司', '16292', '胡平安', null, '16309', '罗三', null, null, null, null, null, null, '2016-03-02 10:09:01', '2016-03-02 10:09:01', '2016-03-02 10:09:01', '2016-03-02 10:09:01', '2016-03-02 10:09:01', '2016-03-02 10:09:01', null, null, null, '1000.0000', '2000.0000', null, null, '12000.0000', null, '2016-05-01 14:25:11', '测试数据7', null, '9', null, '0', '\0', '0', '0', null, null, null, null, '0.0000', null, null, null, null, null, '5000.00', '10000.00');
INSERT INTO `project` VALUES ('1952', '七天通知贷', '20151601032046', '通知贷', null, '7', '0.0940', '1', '网金控股公司', '16292', '胡平安', null, '16309', '罗三', null, null, null, null, null, null, '2016-03-02 10:09:08', '2016-03-02 10:09:08', '2016-03-02 10:09:08', '2016-03-02 10:09:08', '2016-03-02 10:09:08', '2016-03-02 10:09:08', null, null, null, '1000.0000', '2000.0000', null, null, '12000.0000', null, '2016-05-01 14:25:11', '测试数据8', null, '11', null, '0', '\0', '0', '0', null, null, null, null, '0.0000', null, null, null, null, null, '5000.00', '10000.00');
INSERT INTO `project` VALUES ('1953', '七天通知贷', '20151601032046', '通知贷', null, '7', '0.1300', '1', '网金控股公司', '16292', '胡平安', null, '16309', '罗三', null, null, null, null, null, null, '2016-03-02 10:09:16', '2016-03-02 10:09:16', '2016-03-02 10:09:16', '2016-03-02 10:09:16', '2016-03-02 10:09:16', '2016-03-02 10:09:16', null, null, null, '1000.0000', '2000.0000', null, null, '12000.0000', null, '2016-05-01 14:25:11', '测试数据9', null, '12', null, '0', '\0', '0', '0', null, null, null, null, '0.0000', null, null, null, null, null, '5000.00', '10000.00');
INSERT INTO `project` VALUES ('1954', '132', null, '3232', null, '0', '0.1400', '111536', null, '105140', 'test55', null, '0', null, null, null, null, null, null, null, '2016-03-25 23:02:14', null, null, null, null, null, null, null, null, '0.0000', '0.0000', null, null, '0.0000', null, '2016-05-01 14:25:11', '3243', null, '3', null, '0', '\0', '0', '0', null, null, null, null, '20.0000', null, null, null, null, null, '5000.00', '10000.00');
INSERT INTO `project` VALUES ('1955', '435', null, '4343', null, '0', '0.2000', '111536', null, '105140', 'test55', null, '0', null, null, null, null, null, null, null, '2016-03-25 23:32:39', null, null, null, null, null, null, null, null, '0.0000', '0.0000', null, null, '0.0000', null, '2016-05-01 14:25:11', '453wt5634', null, '2', null, '0', '\0', '0', '0', null, null, null, null, '2.0000', null, null, null, null, null, '5000.00', '10000.00');
INSERT INTO `project` VALUES ('1956', '七32天通知贷', '20151601032046', '通知贷', null, '7', '0.1500', '111535', '网金控股公司', '105139', '天山童姥', '13807048849', '16309', '罗峰', null, null, null, null, null, null, '2016-03-25 23:34:16', '2016-03-25 23:33:52', '2016-03-25 23:33:52', '2016-03-25 23:33:52', '2016-03-25 23:33:52', '2016-03-26 00:16:36', null, null, null, '1000.0000', '2000.0000', null, null, '12000.0000', null, '2016-05-01 14:25:11', '测试数据543654654', null, '1', null, '0', '\0', '0', '0', null, null, null, null, '20.0000', null, null, null, null, null, '5000.00', '10000.00');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `code` varchar(30) DEFAULT NULL COMMENT '角色编码，不允许编辑，有值时，代表内置角色。',
  `remark` varchar(200) NOT NULL COMMENT '备注',
  `data_areas` varchar(255) DEFAULT NULL COMMENT '数据权限，英文逗号分割，内容为组织机构ID',
  `sub_sys` varchar(25) DEFAULT NULL COMMENT '子系统，oss：运营系统',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `created_by` int(11) DEFAULT NULL COMMENT '创建者staff_id',
  `updated_by` int(11) DEFAULT NULL COMMENT '修改者staff_id',
  `disable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用，0：否；1：是；',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=567 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('9', '管理员', '', '', '', 'oss', '2014-11-04 21:23:52', '2016-04-17 22:44:19', '1', '1', '1');
INSERT INTO `roles` VALUES ('10', '交易员', '', '', '', 'oss', '2014-11-04 21:23:52', '2016-04-17 22:44:19', '1', '1', '1');
INSERT INTO `roles` VALUES ('11', '采购员', '', '', '', 'oss', '2014-11-04 21:23:52', '2016-04-17 22:44:19', '1', '1', '1');
INSERT INTO `roles` VALUES ('12', '商务执行', '', '', '', 'oss', '2014-11-04 21:23:52', '2016-04-17 22:44:19', '1', '1', '1');
INSERT INTO `roles` VALUES ('13', '财务', '', '', '', 'oss', '2014-11-04 21:23:52', '2016-04-17 22:44:19', '1', '1', '1');
INSERT INTO `roles` VALUES ('15', '交易员管理', '', '', '', 'oss', '2014-11-10 14:11:49', '2016-04-17 22:44:19', '1', '1', '1');


INSERT INTO `role_permissions` VALUES ('9', '1', '1');
INSERT INTO `role_permissions` VALUES ('9', '2', '1');
INSERT INTO `role_permissions` VALUES ('9', '3', '1');
INSERT INTO `role_permissions` VALUES ('9', '4', '1');
INSERT INTO `role_permissions` VALUES ('9', '5', '1');
INSERT INTO `role_permissions` VALUES ('9', '6', '1');
INSERT INTO `role_permissions` VALUES ('9', '7', '1');
INSERT INTO `role_permissions` VALUES ('9', '8', '1');
INSERT INTO `role_permissions` VALUES ('9', '9', '1');
INSERT INTO `role_permissions` VALUES ('9', '10', '1');
INSERT INTO `role_permissions` VALUES ('9', '11', '1');
INSERT INTO `role_permissions` VALUES ('9', '12', '1');
INSERT INTO `role_permissions` VALUES ('9', '13', '1');
INSERT INTO `role_permissions` VALUES ('9', '14', '1');
INSERT INTO `role_permissions` VALUES ('9', '15', '1');
INSERT INTO `role_permissions` VALUES ('9', '16', '1');
INSERT INTO `role_permissions` VALUES ('9', '17', '1');
INSERT INTO `role_permissions` VALUES ('9', '18', '1');
INSERT INTO `role_permissions` VALUES ('9', '19', '1');
INSERT INTO `role_permissions` VALUES ('9', '20', '1');
INSERT INTO `role_permissions` VALUES ('9', '21', '1');
INSERT INTO `role_permissions` VALUES ('9', '22', '1');
INSERT INTO `role_permissions` VALUES ('9', '23', '1');


INSERT INTO `aitoubao`.`staffs` (`id`, `org_id`, `login_name`, `password`, `name`, `english_name`, `gender`, `disable`, `email`, `phone`, `wechat`, `qq`, `manager`, `districts`, `last_login_time`, `remark`, `purchase_category_groups`, `sell_category_groups`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES ('16309', '7', 'luosan', 'e10adc3949ba59abbe56e057f20f883e', '罗星星', 'luosan', '1', '0', '1145673826@qq.com', '17099794190', 'luoxingxing', '285106488', '0', '', NULL, '', '', '', '2016-01-22 10:08:57', '2016-01-22 10:08:57', '16292', '16292');
INSERT INTO `aitoubao`.`staffs` (`id`, `org_id`, `login_name`, `password`, `name`, `english_name`, `gender`, `disable`, `email`, `phone`, `wechat`, `qq`, `manager`, `districts`, `last_login_time`, `remark`, `purchase_category_groups`, `sell_category_groups`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES ('1', '1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '管理员', '', '1', '0', '', '', '', '2851659991', '1', 'HD,HN', '2016-02-18 17:15:36', '', 'P_PP_PE,P_OTHER,A_PP_PE,A_OTHER,A_PS_ABS,P_PVC,P_PS_ABS', 'S_RESOURCE,S_COMMON', '2014-10-23 23:21:48', '2016-02-18 17:15:36', '1', '1');


INSERT INTO `staffs_roles` VALUES ('1', '9', '');

