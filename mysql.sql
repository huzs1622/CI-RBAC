SET NAMES utf8;

CREATE TABLE `rbac_auth` (
  `node_id` int(11) NOT NULL COMMENT '权限ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  UNIQUE KEY `nid_rid` (`node_id`,`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='角色与权限对应表';

CREATE TABLE `rbac_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL COMMENT '菜单名称',
  `node_id` int(11) DEFAULT NULL COMMENT '权限ID',
  `p_id` int(11) DEFAULT NULL COMMENT '菜单父id',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(11) DEFAULT '1' COMMENT '状态(1:正常,0:停用)',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='菜单表';

CREATE TABLE `rbac_node` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dirc` varchar(20) NOT NULL COMMENT '目录',
  `cont` varchar(10) NOT NULL COMMENT '控制器',
  `func` varchar(10) NOT NULL COMMENT '方法',
  `memo` varchar(25) DEFAULT NULL COMMENT '备注',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态(1:正常,0:停用)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `d_c_f` (`dirc`,`cont`,`func`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='权限表';

CREATE TABLE `rbac_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(25) NOT NULL COMMENT '角色名',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态(1:正常,0停用)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `rolename` (`rolename`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色表';

CREATE TABLE `rbac_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `nickname` varchar(20) NOT NULL COMMENT '昵称',
  `email` varchar(25) NOT NULL COMMENT 'Email',
  `role_id` int(11) DEFAULT NULL COMMENT '角色ID',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态(1:正常,0:停用)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';


insert into `rbac_auth` (`node_id`,`role_id`) values (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1);

insert into `rbac_menu` (`id`,`title`,`node_id`,`p_id`,`sort`,`status`) values (1,'后台管理',NULL,NULL,9,1),(2,'权限管理',5,1,2,1),(3,'菜单管理',1,1,1,1),(4,'人员管理',14,1,4,1),(5,'角色管理',9,1,3,1),(6,'一级菜单',0,NULL,0,1),(7,'二级权限',18,6,1,1),(8,'一级菜单2',NULL,NULL,2,1),(9,'二级菜单',NULL,8,1,1),(10,'三级权限',18,9,1,1);

insert into `rbac_node` (`id`,`dirc`,`cont`,`func`,`memo`,`status`) values (1,'manage','menu','index','菜单管理',1),(2,'manage','menu','edit','菜单修改',1),(3,'manage','menu','delete','菜单删除',1),(4,'manage','menu','add','菜单新增',1),(5,'manage','node','index','权限管理',1),(6,'manage','node','add','权限新增',1),(7,'manage','node','delete','权限删除',1),(8,'manage','node','edit','权限修改',1),(9,'manage','role','index','角色管理',1),(10,'manage','role','action','角色赋权',1),(11,'manage','role','delete','角色删除',1),(12,'manage','role','edit','角色修改',1),(13,'manage','role','add','角色新增',1),(14,'manage','member','index','人员管理',1),(15,'manage','member','edit','人员修改',1),(16,'manage','member','delete','人员删除',1),(17,'manage','member','add','人员新增',1),(18,'product','index','index','测试用权限',1);

insert into `rbac_role` (`id`,`rolename`,`status`) values (1,'管理员',1);
insert into `rbac_user` (`id`,`username`,`password`,`nickname`,`email`,`role_id`,`status`) values (1,'admin','21232f297a57a5a743894a0e4a801fc3','Josen','admin@admin.com',1,1);