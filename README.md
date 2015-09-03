# CI-RBAC
CodeIgniter Role-Based Access Control

<pre>
一、系统要求
PHP 5.2.4以上
CI 2.x 以上


二、CI-RBAC简介

1、简介
这是一个基于角色的权限控制，安装配置方便且容易上手。

2、目录结构
├─application
│  ├─controllers              //控制器
│  │  ├─manage
│  │  └─product
│  ├─third_party
│  │  └─rbac                  //核心目录
│  │      ├─config
│  │      ├─helpers
│  │      ├─hooks
│  │      ├─libraries
│  │      ├─models
│  │      └─views
│  │          └─manage
│  │              ├─member
│  │              ├─menu
│  │              ├─node
│  │              └─role
│  └─views
│      └─product              //测试的视图界面
├─static                      //静态文件
│    └─bootstrap
│       ├─css
│       ├─fonts
│       └─js
├─mysql.sql                   //创建数据库表和默认数据
└─README.md                   //说明文件



三、安装步骤
1、文件放置
复制文件到你的项目目录覆盖即可,目录对应如下:
（1）/application/third_party/rbac
（2）/application/controllers
（3）/application/views
（4）/static


2、RBAC配置
开启自动加载第三方包
（1）编辑文件：/application/config/autoload.php  修改：
$autoload['packages'] = array(APPPATH.'third_party/rbac');

（2）编辑文件：/application/config/config.php  修改：
$config['enable_hooks'] = TRUE;

（3）编辑文件：/application/config/hooks.php  添加：
//RBAC权限验证
$hook['post_controller_constructor'] = array(
		'class'    => 'Rbac',
		'function' => 'aoto_verify',
		'filename' => 'rbac_hook.php',
		'filepath' => 'third_party/rbac/hooks',
		'params'   => '',
);

$hook['display_override'] = array(
		'class'    => 'Rbac',
		'function' => 'view_override',
		'filename' => 'rbac_hook.php',
		'filepath' => 'third_party/rbac/hooks',
		'params'   => '',
);

//默认开启SESSION
$hook['pre_system'] = array(
		'class'    => '',
		'function' => 'session_start',
		'filename' => '',
		'filepath' => '',
		'params'   => '',
);

（4）配置数据库
编辑文件：/application/config/database.php  修改：

根据项目需求更改相关值。
（5）编辑文件：/application/config/routes.php  修改：
$route['default_controller'] = 'index';

（6）导入数据库，创建表和基础数据
注意：请选择数据库后再导入。

（7）配置RBAC
编辑文件：/application/third_party/rbac/config/rbac.php  修改：
根据项目需求更改相关值。

（8）配置完成，在浏览器里访问项目吧
</pre>
