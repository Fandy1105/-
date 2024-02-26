-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1:3306
-- 生成日期： 2024-01-16 14:30:49
-- 服务器版本： 5.7.26
-- PHP 版本： 7.0.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `blogdemo2db`
--

-- --------------------------------------------------------

--
-- 表的结构 `adminuser`
--

DROP TABLE IF EXISTS `adminuser`;
CREATE TABLE IF NOT EXISTS `adminuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `nickname` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `profile` text COLLATE utf8_unicode_ci,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `adminuser`
--

INSERT INTO `adminuser` (`id`, `username`, `nickname`, `password`, `email`, `profile`, `auth_key`, `password_hash`, `password_reset_token`) VALUES
(1, 'weixi', '魏曦', '$2y$13$RZ20K81ZdERPDyFq2EM31e6KjmmdNRtGmCC6Fq9NST3hWhcgoPqUy', 'webmaster@example.com.cn', 'hello,this is my profile', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$4Y5KRDHPFYF.rYumLe6rx.34gBLpK6HROMklh9A8.TZwRFNrM5RyW', NULL),
(2, 'chengsc', '程思城', '$2y$13$RZ20K81ZdERPDyFq2EM31e6KjmmdNRtGmCC6Fq9NST3hWhcgoPqUy', 'tim@u2000.com', 'a testing user', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', NULL),
(3, 'heyx', '何永兴', '$2y$13$RZ20K81ZdERPDyFq2EM31e6KjmmdNRtGmCC6Fq9NST3hWhcgoPqUy', 'heyx@hotmail.com', 'a testing user', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', NULL),
(5, 'testadmin', 'testadmin', '*', 'testinguser@gmail.com', 'test', 'sAivVF-oznEEXaKeSLdJb0_UNAOjq1Dv', '$2y$13$Ac1SRzsv4zuzpmSJSpp32.Xrgub6rnSmOClwf/fr635tz3kD5v3pu', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `auth_assignment`
--

DROP TABLE IF EXISTS `auth_assignment`;
CREATE TABLE IF NOT EXISTS `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('admin', '1', 1478063489),
('commentAuditor', '1', 1478063489),
('commentAuditor', '4', 1465177361),
('postAdmin', '1', 1478063489),
('postAdmin', '2', 1477816632),
('postOperator', '1', 1478063489),
('postOperator', '3', 1465177361);

-- --------------------------------------------------------

--
-- 表的结构 `auth_item`
--

DROP TABLE IF EXISTS `auth_item`;
CREATE TABLE IF NOT EXISTS `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('admin', 1, '系统管理员', NULL, NULL, 1465177361, 1465177361),
('approveComment', 2, '审核评论', NULL, NULL, 1465177361, 1465177361),
('commentAuditor', 1, '评论审核员', NULL, NULL, 1465177361, 1465177361),
('createPost', 2, '新增文章', NULL, NULL, 1465177361, 1465177361),
('deletePost', 2, '删除文章', NULL, NULL, 1465177361, 1465177361),
('postAdmin', 1, '文章管理员', NULL, NULL, 1465177361, 1465177361),
('postOperator', 1, '文章操作员', NULL, NULL, 1465177361, 1465177361),
('updatePost', 2, '修改文章', NULL, NULL, 1465177361, 1465177361);

-- --------------------------------------------------------

--
-- 表的结构 `auth_item_child`
--

DROP TABLE IF EXISTS `auth_item_child`;
CREATE TABLE IF NOT EXISTS `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('commentAuditor', 'approveComment'),
('admin', 'commentAuditor'),
('postAdmin', 'createPost'),
('postAdmin', 'deletePost'),
('postOperator', 'deletePost'),
('admin', 'postAdmin'),
('postAdmin', 'updatePost');

-- --------------------------------------------------------

--
-- 表的结构 `auth_rule`
--

DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE IF NOT EXISTS `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `category`
--

INSERT INTO `category` (`id`, `cid`) VALUES
(42, 1),
(51, 2);

-- --------------------------------------------------------

--
-- 表的结构 `categoryname`
--

DROP TABLE IF EXISTS `categoryname`;
CREATE TABLE IF NOT EXISTS `categoryname` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` char(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `categoryname`
--

INSERT INTO `categoryname` (`cid`, `cname`) VALUES
(1, '科技'),
(2, '文化');

-- --------------------------------------------------------

--
-- 表的结构 `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `create_time` int(11) DEFAULT NULL,
  `userid` int(11) NOT NULL,
  `email` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `post_id` int(11) NOT NULL,
  `remind` int(4) DEFAULT '0' COMMENT '0:未提醒1：已提醒',
  PRIMARY KEY (`id`),
  KEY `FK_comment_post` (`post_id`),
  KEY `FK_comment_user` (`userid`),
  KEY `FK_comment_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `comment`
--

INSERT INTO `comment` (`id`, `content`, `status`, `create_time`, `userid`, `email`, `url`, `post_id`, `remind`) VALUES
(89, 'yii\\db\\Query::one() 方法只返回查询结果当中的第一条数据， 条件语句中不会加上 LIMIT 1 条件。如果你清楚的知道查询将会只返回一行或几行数据 （例如， 如果你是通过某些主键来查询的），这很好也提倡这样做。但是，如果查询结果 有机会返回大量的数据时，那么你应该显示调用 limit(1) 方法，以改善性能。 例如， (new \\yii\\db\\Query())->from(\'user\')->limit(1)->one()。', 2, 1443004455, 1, 'somuchfun@gmail.com', '', 39, 1),
(99, '魏老师，看了你的视频深入浅出，受益匪浅。真的非常非常感谢您！', 1, 1479353617, 2, 'mchael@163.com', NULL, 42, 1),
(108, '1', 1, 1705244939, 4, '11111@gmail.com', NULL, 42, 0);

-- --------------------------------------------------------

--
-- 表的结构 `commentstatus`
--

DROP TABLE IF EXISTS `commentstatus`;
CREATE TABLE IF NOT EXISTS `commentstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `commentstatus`
--

INSERT INTO `commentstatus` (`id`, `name`, `position`) VALUES
(1, '待审核', 1),
(2, '已审核', 2);

-- --------------------------------------------------------

--
-- 表的结构 `migration`
--

DROP TABLE IF EXISTS `migration`;
CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1462597684),
('m130524_201442_init', 1462597693),
('m140506_102106_rbac_init', 1465176156);

-- --------------------------------------------------------

--
-- 表的结构 `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE IF NOT EXISTS `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `tags` text COLLATE utf8_unicode_ci,
  `status` int(11) NOT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_post_author` (`author_id`),
  KEY `FK_post_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `post`
--

INSERT INTO `post` (`id`, `title`, `content`, `tags`, `status`, `create_time`, `update_time`, `author_id`) VALUES
(39, '查询构建器', '<div id=\"content\">\n\n<p>查询构建器建立在 <a href=\"/doc/guide/2.0/db-dao\">Database Access Objects</a> 基础之上，可让你创建\n程序化的、DBMS无关的SQL语句。相比于原生的SQL语句，查询构建器可以帮你\n写出可读性更强的SQL相关的代码，并生成安全性更强的SQL语句。</p>\n<p>使用查询构建器通常包含以下两个步骤：</p>\n<ol><li>创建一个 yii\\db\\Query 对象来代表一条 SELECT SQL 语句的不同子句（例如 <code>SELECT</code>, <code>FROM</code>）。</li>\n<li>执行 yii\\db\\Query 的一个查询方法（例如：<code>all()</code>）从数据库当中检索数据。</li>\n</ol><p>如下所示代码是查询构造器的一个典型用法：</p>\n<pre><code class=\"language-php hljs\"><span class=\"hljs-variable\">$rows</span> = (<span class=\"hljs-keyword\">new</span> \\yii\\db\\Query())\n    -&gt;select([<span class=\"hljs-string\">\'id\'</span>, <span class=\"hljs-string\">\'email\'</span>])\n    -&gt;from(<span class=\"hljs-string\">\'user\'</span>)\n    -&gt;where([<span class=\"hljs-string\">\'last_name\'</span> =&gt; <span class=\"hljs-string\">\'Smith\'</span>])\n    -&gt;limit(<span class=\"hljs-number\">10</span>)\n    -&gt;all();\n</code></pre>\n<p>上面的代码将会生成并执行如下的SQL语句，其中 <code>:last_name</code> 参数绑定了\n字符串 <code>\'Smith\'</code>。</p>\n<pre><code class=\"language-sql hljs\"><span class=\"hljs-operator\">SELECT <span class=\"hljs-string\">`id`</span>, <span class=\"hljs-string\">`email`</span> \n<span class=\"hljs-keyword\">FROM</span> <span class=\"hljs-string\">`user`</span>\n<span class=\"hljs-keyword\">WHERE</span> <span class=\"hljs-string\">`last_name`</span> = :last_name\n<span class=\"hljs-keyword\">LIMIT</span> <span class=\"hljs-number\">10</span>\n</span></code></pre>\n<blockquote><p>提示: 你平时更多的时候会使用 yii\\db\\Query 而不是 [yii\\db\\QueryBuilder]]。\n  当你调用其中一个查询方法时，后者将会被前者隐式的调用。yii\\db\\QueryBuilder主要负责将\n  DBMS 不相关的 yii\\db\\Query 对象转换成 DBMS 相关的 SQL 语句（例如，\n  以不同的方式引用表或字段名称）。</p>\n</blockquote>\n<h2>创建查询 <span></span></h2>\n<p>为了创建一个 yii\\db\\Query 对象，你需要调用不同的查询构建方法来代表SQL语句的不同子句。\n这些方法的名称集成了在SQL语句相应子句中使用的关键字。例如，为了指定 SQL 语句当中的\n<code>FROM</code> 子句，你应该调用 <code>from()</code> 方法。所有的查询构建器方法返回的是查询对象本身，\n也就是说，你可以把多个方法的调用串联起来。</p>\n<p>接下来，我们会对这些查询构建器方法进行一一讲解：</p>\n<h3>yii\\db\\Query::select() <span></span></h3>\n<p>yii\\db\\Query::select() 方法用来指定 SQL 语句当中的 <code>SELECT</code> 子句。\n你可以像下面的例子一样使用一个数组或者字符串来定义需要查询的字段。当 SQL 语句\n是由查询对象生成的时候，被查询的字段名称将会自动的被引号括起来。</p>\n<pre><code class=\"language-php hljs\"><span class=\"hljs-variable\">$query</span>-&gt;select([<span class=\"hljs-string\">\'id\'</span>, <span class=\"hljs-string\">\'email\'</span>]);\n\n<span class=\"hljs-comment\">// 等同于：</span>\n\n<span class=\"hljs-variable\">$query</span>-&gt;select(<span class=\"hljs-string\">\'id, email\'</span>);\n</code></pre>\n<p>就像写原生 SQL 语句一样，被选取的字段可以包含表前缀，以及/或者字段别名。\n例如： </p>\n<pre><code class=\"language-php hljs\"><span class=\"hljs-variable\">$query</span>-&gt;select([<span class=\"hljs-string\">\'user.id AS user_id\'</span>, <span class=\"hljs-string\">\'email\'</span>]);\n\n<span class=\"hljs-comment\">// 等同于：</span>\n\n<span class=\"hljs-variable\">$query</span>-&gt;select(<span class=\"hljs-string\">\'user.id AS user_id, email\'</span>);\n</code></pre>\n<p>如果使用数组格式来指定字段，你可以使用数组的键值来表示字段的别名。\n例如，上面的代码可以被重写为如下形式：</p>\n<pre><code class=\"language-php hljs\"><span class=\"hljs-variable\">$query</span>-&gt;select([<span class=\"hljs-string\">\'user_id\'</span> =&gt; <span class=\"hljs-string\">\'user.id\'</span>, <span class=\"hljs-string\">\'email\'</span>]);\n</code></pre>\n<p>如果你在组建查询时没有调用 yii\\db\\Query::select() 方法，那么选择的将是 <code>\'*\'</code> ，\n也即选取的是所有的字段。</p>\n<p>除了字段名称以外，你还可以选择数据库的表达式。当你使用到包含逗号的数据库表达式的时候，\n你必须使用数组的格式，以避免自动的错误的引号添加。例如：</p>\n<pre><code class=\"language-php hljs\"><span class=\"hljs-variable\">$query</span>-&gt;select([<span class=\"hljs-string\">\"CONCAT(first_name, \' \', last_name) AS full_name\"</span>, <span class=\"hljs-string\">\'email\'</span>]); \n</code></pre>\n<p>从 2.0.1 的版本开始你就可以使用子查询了。在定义每一个子查询的时候，\n你应该使用 yii\\db\\Query 对象。例如：</p>\n<pre><code class=\"language-php hljs\"><span class=\"hljs-variable\">$subQuery</span> = (<span class=\"hljs-keyword\">new</span> Query())-&gt;select(<span class=\"hljs-string\">\'COUNT(*)\'</span>)-&gt;from(<span class=\"hljs-string\">\'user\'</span>);\n\n<span class=\"hljs-comment\">// SELECT `id`, (SELECT COUNT(*) FROM `user`) AS `count` FROM `post`</span>\n<span class=\"hljs-variable\">$query</span> = (<span class=\"hljs-keyword\">new</span> Query())-&gt;select([<span class=\"hljs-string\">\'id\'</span>, <span class=\"hljs-string\">\'count\'</span> =&gt; <span class=\"hljs-variable\">$subQuery</span>])-&gt;from(<span class=\"hljs-string\">\'post\'</span>);\n</code></pre>\n<p>你应该调用 yii\\db\\Query::distinct() 方法来去除重复行，如下所示：</p>\n<pre><code class=\"language-php hljs\"><span class=\"hljs-comment\">// SELECT DISTINCT `user_id` ...</span>\n<span class=\"hljs-variable\">$query</span>-&gt;select(<span class=\"hljs-string\">\'user_id\'</span>)-&gt;distinct();\n</code></pre>\n<p>你可以调用 yii\\db\\Query::addSelect() 方法来选取附加字段，例如：</p>\n<pre><code class=\"language-php hljs\"><span class=\"hljs-variable\">$query</span>-&gt;select([<span class=\"hljs-string\">\'id\'</span>, <span class=\"hljs-string\">\'username\'</span>])\n    -&gt;addSelect([<span class=\"hljs-string\">\'email\'</span>]);\n</code></pre>\n<h3>yii\\db\\Query::from() <span></span></h3>\n<p>yii\\db\\Query::from() 方法指定了 SQL 语句当中的 <code>FROM</code> 子句。例如：</p>\n<pre><code class=\"language-php hljs\"><span class=\"hljs-comment\">// SELECT * FROM `user`</span>\n<span class=\"hljs-variable\">$query</span>-&gt;from(<span class=\"hljs-string\">\'user\'</span>);\n</code></pre>\n<p>你可以通过字符串或者数组的形式来定义被查询的表名称。就像你写原生的 SQL 语句一样，\n表名称里面可包含数据库前缀，以及/或者表别名。例如：</p>\n<pre><code class=\"language-php hljs\"><span class=\"hljs-variable\">$query</span>-&gt;from([<span class=\"hljs-string\">\'public.user u\'</span>, <span class=\"hljs-string\">\'public.post p\'</span>]);\n\n<span class=\"hljs-comment\">// 等同于：</span>\n\n<span class=\"hljs-variable\">$query</span>-&gt;from(<span class=\"hljs-string\">\'public.user u, public.post p\'</span>);\n</code></pre>\n<p>如果你使用的是数组的格式，那么你同样可以用数组的键值来定义表别名，如下所示：</p>\n<pre><code class=\"language-php hljs\"><span class=\"hljs-variable\">$query</span>-&gt;from([<span class=\"hljs-string\">\'u\'</span> =&gt; <span class=\"hljs-string\">\'public.user\'</span>, <span class=\"hljs-string\">\'p\'</span> =&gt; <span class=\"hljs-string\">\'public.post\'</span>]);\n</code></pre>\n<p>除了表名以外，你还可以从子查询中再次查询，这里的子查询是由 yii\\db\\Query 创建的对象。\n例如：</p>\n<pre><code class=\"language-php hljs\"><span class=\"hljs-variable\">$subQuery</span> = (<span class=\"hljs-keyword\">new</span> Query())-&gt;select(<span class=\"hljs-string\">\'id\'</span>)-&gt;from(<span class=\"hljs-string\">\'user\'</span>)-&gt;where(<span class=\"hljs-string\">\'status=1\'</span>);\n\n<span class=\"hljs-comment\">// SELECT * FROM (SELECT `id` FROM `user` WHERE status=1) u </span>\n<span class=\"hljs-variable\">$query</span>-&gt;from([<span class=\"hljs-string\">\'u\'</span> =&gt; <span class=\"hljs-variable\">$subQuery</span>]);\n</code></pre>\n<h3>yii\\db\\Query::where() <span></span></h3>\n<p>yii\\db\\Query::where() 方法定义了 SQL 语句当中的 <code>WHERE</code> 子句。\n你可以使用如下三种格式来定义 <code>WHERE</code> 条件：</p>\n<ul><li>字符串格式，例如：<code>\'status=1\'</code></li>\n<li>哈希格式，例如： <code>[\'status\' =&gt; 1, \'type\' =&gt; 2]</code></li>\n<li>操作符格式，例如：<code>[\'like\', \'name\', \'test\']</code></li>\n</ul><h4>字符串格式 <span></span></h4>\n<p>在定义非常简单的查询条件的时候，字符串格式是最合适的。它看起来和原生 SQL 语句差不多。例如：</p>\n<pre><code class=\"language-php hljs\"><span class=\"hljs-variable\">$query</span>-&gt;where(<span class=\"hljs-string\">\'status=1\'</span>);\n\n<span class=\"hljs-comment\">// 或者使用参数绑定来绑定动态参数值</span>\n<span class=\"hljs-variable\">$query</span>-&gt;where(<span class=\"hljs-string\">\'status=:status\'</span>, [<span class=\"hljs-string\">\':status\'</span> =&gt; <span class=\"hljs-variable\">$status</span>]);\n</code></pre>\n<p>千万不要像如下的例子一样直接在条件语句当中嵌入变量，特别是当这些变量来源于终端用户输入的时候，\n因为这样我们的软件将很容易受到 SQL 注入的攻击。</p>\n<pre><code class=\"language-php hljs\"><span class=\"hljs-comment\">// 危险！千万别这样干，除非你非常的确定 $status 是一个整型数值。</span>\n<span class=\"hljs-variable\">$query</span>-&gt;where(<span class=\"hljs-string\">\"status=$status\"</span>);\n</code></pre>\n<p>当使用参数绑定的时候，你可以调用 yii\\db\\Query::params() 或者 yii\\db\\Query::addParams() 方法\n来分别绑定不同的参数。</p>\n<pre><code class=\"language-php hljs\"><span class=\"hljs-variable\">$query</span>-&gt;where(<span class=\"hljs-string\">\'status=:status\'</span>)\n    -&gt;addParams([<span class=\"hljs-string\">\':status\'</span> =&gt; <span class=\"hljs-variable\">$status</span>]);\n</code></pre>\n<h4>哈希格式 <span></span></h4>\n<p>哈希格式最适合用来指定多个 <code>AND</code> 串联起来的简单的\"等于断言\"子条件。\n它是以数组的形式来书写的，数组的键表示字段的名称，而数组的值则表示\n这个字段需要匹配的值。例如：</p>\n<pre><code class=\"language-php hljs\"><span class=\"hljs-comment\">// ...WHERE (`status` = 10) AND (`type` IS NULL) AND (`id` IN (4, 8, 15))</span>\n<span class=\"hljs-variable\">$query</span>-&gt;where([\n    <span class=\"hljs-string\">\'status\'</span> =&gt; <span class=\"hljs-number\">10</span>,\n    <span class=\"hljs-string\">\'type\'</span> =&gt; <span class=\"hljs-keyword\">null</span>,\n    <span class=\"hljs-string\">\'id\'</span> =&gt; [<span class=\"hljs-number\">4</span>, <span class=\"hljs-number\">8</span>, <span class=\"hljs-number\">15</span>],\n]);\n</code></pre>\n<p>就像你所看到的一样，查询构建器非常的智能，能恰当地处理数值当中的空值和数组。</p>\n<p>你也可以像下面那样在子查询当中使用哈希格式： </p>\n<pre><code class=\"language-php hljs\"><span class=\"hljs-variable\">$userQuery</span> = (<span class=\"hljs-keyword\">new</span> Query())-&gt;select(<span class=\"hljs-string\">\'id\'</span>)-&gt;from(<span class=\"hljs-string\">\'user\'</span>);\n\n<span class=\"hljs-comment\">// ...WHERE `id` IN (SELECT `id` FROM `user`)</span>\n<span class=\"hljs-variable\">$query</span>-&gt;where([<span class=\"hljs-string\">\'id\'</span> =&gt; <span class=\"hljs-variable\">$userQuery</span>]);\n</code></pre>\n<h4>操作符格式 <span></span></h4>\n<p>操作符格式允许你指定类程序风格的任意条件语句，如下所示：</p>\n<pre><code class=\"language-php hljs\">[操作符, 操作数<span class=\"hljs-number\">1</span>, 操作数<span class=\"hljs-number\">2</span>, ...]\n</code></pre>\n<p>其中每个操作数可以是字符串格式、哈希格式或者嵌套的操作符格式，而操作符可以是如下列表中的一个：</p>\n<ul><li><p><code>and</code>: 操作数会被 <code>AND</code> 关键字串联起来。例如，<code>[\'and\', \'id=1\', \'id=2\']</code> \n将会生成 <code>id=1 AND id=2</code>。如果操作数是一个数组，它也会按上述规则转换成\n字符串。例如，<code>[\'and\', \'type=1\', [\'or\', \'id=1\', \'id=2\']]</code> \n将会生成 <code>type=1 AND (id=1 OR id=2)</code>。\n这个方法不会自动加引号或者转义。</p>\n</li>\n<li><p><code>or</code>: 用法和 <code>and</code> 操作符类似，这里就不再赘述。</p>\n</li>\n<li><p><code>between</code>: 第一个操作数为字段名称，第二个和第三个操作数代表的是这个字段\n的取值范围。例如，<code>[\'between\', \'id\', 1, 10]</code> 将会生成\n<code>id BETWEEN 1 AND 10</code>。</p>\n</li>\n<li><p><code>not between</code>: 用法和 <code>BETWEEN</code> 操作符类似，这里就不再赘述。</p>\n</li>\n</ul><ul><li><p><code>in</code>: 第一个操作数应为字段名称或者 DB 表达式。第二个操作符既可以是一个数组，\n也可以是一个  <code>Query</code> 对象。它会转换成<code>IN</code> 条件语句。如果第二个操作数是一个\n数组，那么它代表的是字段或 DB 表达式的取值范围。如果第二个操作数是 <code>Query</code> \n对象，那么这个子查询的结果集将会作为第一个操作符的字段或者 DB 表达式的取值范围。\n例如， <code>[\'in\', \'id\', [1, 2, 3]]</code> 将生成 <code>id IN (1, 2, 3)</code>。\n该方法将正确地为字段名加引号以及为取值范围转义。<code>in</code> 操作符还支持组合字段，此时，\n操作数1应该是一个字段名数组，而操作数2应该是一个数组或者 <code>Query</code> 对象，\n代表这些字段的取值范围。</p>\n</li>\n<li><p><code>not in</code>: 用法和 <code>in</code> 操作符类似，这里就不再赘述。</p>\n</li>\n<li><p><code>like</code>: 第一个操作数应为一个字段名称或 DB 表达式，第二个操作数可以使字符串或数组，\n代表第一个操作数需要模糊查询的值。比如，<code>[\'like\', \'name\', \'tester\']</code> 会生成\n<code>name LIKE \'%tester%\'</code>。 如果范围值是一个数组，那么将会生成用 <code>AND</code> 串联起来的\n多个 <code>like</code> 语句。例如，<code>[\'like\', \'name\', [\'test\', \'sample\']]</code> 将会生成\n<code>name LIKE \'%test%\' AND name LIKE \'%sample%\'</code>。\n你也可以提供第三个可选的操作数来指定应该如何转义数值当中的特殊字符。\n该操作数是一个从需要被转义的特殊字符到转义副本的数组映射。\n如果没有提供这个操作数，将会使用默认的转义映射。如果需要禁用转义的功能，\n只需要将参数设置为 <code>false</code> 或者传入一个空数组即可。需要注意的是，\n当使用转义映射（又或者没有提供第三个操作数的时候），第二个操作数的值的前后\n将会被加上百分号。</p>\n</li>\n</ul><p>  &gt; 注意：当使用 PostgreSQL 的时候你还可以使用 <a href=\"http://www.postgresql.org/docs/8.3/static/functions-matching.html#FUNCTIONS-LIKE\"><code>ilike</code></a>，\n  &gt; 该方法对大小写不敏感。</p>\n<ul><li><p><code>or like</code>: 用法和 <code>like</code> 操作符类似，区别在于当第二个操作数为数组时，\n会使用 <code>OR</code> 来串联多个 <code>LIKE</code> 条件语句。</p>\n</li>\n<li><p><code>not like</code>: 用法和 <code>like</code> 操作符类似，区别在于会使用 <code>NOT LIKE</code>\n来生成条件语句。</p>\n</li>\n<li><p><code>or not like</code>: 用法和 <code>not like</code> 操作符类似，区别在于会使用 <code>OR</code> \n来串联多个 <code>NOT LIKE</code> 条件语句。</p>\n</li>\n<li><p><code>exists</code>: 需要一个操作数，该操作数必须是代表子查询 yii\\db\\Query 的一个实例，\n它将会构建一个 <code>EXISTS (sub-query)</code> 表达式。</p>\n</li>\n<li><p><code>not exists</code>: 用法和 <code>exists</code> 操作符类似，它将创建一个  <code>NOT EXISTS (sub-query)</code> 表达式。</p>\n</li>\n<li><p><code>&gt;</code>, <code>&lt;=</code>, 或者其他包含两个操作数的合法 DB 操作符: 第一个操作数必须为字段的名称，\n而第二个操作数则应为一个值。例如，<code>[\'&gt;\', \'age\', 10]</code> 将会生成 <code>age&gt;10</code>。</p>\n</li>\n</ul><h4>附加条件 <span></span></h4>\n<p>你可以使用 yii\\db\\Query::andWhere() 或者 yii\\db\\Query::orWhere() 在原有条件的基础上\n附加额外的条件。你可以多次调用这些方法来分别追加不同的条件。\n例如，</p>\n<pre><code class=\"language-php hljs\"><span class=\"hljs-variable\">$status</span> = <span class=\"hljs-number\">10</span>;\n<span class=\"hljs-variable\">$search</span> = <span class=\"hljs-string\">\'yii\'</span>;\n\n<span class=\"hljs-variable\">$query</span>-&gt;where([<span class=\"hljs-string\">\'status\'</span> =&gt; <span class=\"hljs-variable\">$status</span>]);\n\n<span class=\"hljs-keyword\">if</span> (!<span class=\"hljs-keyword\">empty</span>(<span class=\"hljs-variable\">$search</span>)) {\n    <span class=\"hljs-variable\">$query</span>-&gt;andWhere([<span class=\"hljs-string\">\'like\'</span>, <span class=\"hljs-string\">\'title\'</span>, <span class=\"hljs-variable\">$search</span>]);\n}\n</code></pre>\n<p>如果 <code>$search</code> 不为空，那么将会生成如下 SQL 语句：</p>\n<pre><code class=\"language-sql hljs\">... WHERE (`status` = 10) AND (`title` LIKE \'%yii%\')\n</code></pre>\n<h4>过滤条件 <span></span></h4>\n<p>当 <code>WHERE</code> 条件来自于用户的输入时，你通常需要忽略用户输入的空值。\n例如，在一个可以通过用户名或者邮箱搜索的表单当中，用户名或者邮箱\n输入框没有输入任何东西，这种情况下你想要忽略掉对应的搜索条件，\n那么你就可以使用 yii\\db\\Query::filterWhere() 方法来实现这个目的：</p>\n<pre><code class=\"language-php hljs\"><span class=\"hljs-comment\">// $username 和 $email 来自于用户的输入</span>\n<span class=\"hljs-variable\">$query</span>-&gt;filterWhere([\n    <span class=\"hljs-string\">\'username\'</span> =&gt; <span class=\"hljs-variable\">$username</span>,\n    <span class=\"hljs-string\">\'email\'</span> =&gt; <span class=\"hljs-variable\">$email</span>,		\n]);\n</code></pre>\n<p>yii\\db\\Query::filterWhere() 和 yii\\db\\Query::where() 唯一的不同就在于，前者\n将忽略在条件当中的<a href=\"#hash-format\">hash format</a>的空值。所以如果 <code>$email</code> 为空而 <code>$username</code> \n不为空，那么上面的代码最终将生产如下 SQL <code>...WHERE username=:username</code>。 </p>\n<blockquote><p>提示：当一个值为 null、空数组、空字符串或者一个只包含空白字符时，那么它将被判定为空值。</p>\n</blockquote>\n<p>类似于 [yii\\db\\Query::andWhere()|andWhere()]] 和 yii\\db\\Query::orWhere(),\n你可以使用 yii\\db\\Query::andFilterWhere() 和 yii\\db\\Query::orFilterWhere() 方法\n来追加额外的过滤条件。</p>\n<h3>yii\\db\\Query::orderBy() <span></span></h3>\n<p>yii\\db\\Query::orderBy() 方法是用来指定 SQL 语句当中的 <code>ORDER BY</code> 子句的。例如，</p>\n<pre><code class=\"language-php hljs\"><span class=\"hljs-comment\">// ... ORDER BY `id` ASC, `name` DESC</span>\n<span class=\"hljs-variable\">$query</span>-&gt;orderBy([\n    <span class=\"hljs-string\">\'id\'</span> =&gt; SORT_ASC,\n    <span class=\"hljs-string\">\'name\'</span> =&gt; SORT_DESC,\n]);\n</code></pre>\n<p>如上所示，数组当中的键指代的是字段名称，而数组当中的值则表示的是排序的方式。\nPHP 的常量 <code>SORT_ASC</code> 指的是升序排列，<code>SORT_DESC</code> 指的则是降序排列。</p>\n<p>如果 <code>ORDER BY</code> 仅仅包含简单的字段名称，你可以使用字符串来声明它，\n就像写原生的 SQL 语句一样。例如，</p>\n<pre><code class=\"language-php hljs\"><span class=\"hljs-variable\">$query</span>-&gt;orderBy(<span class=\"hljs-string\">\'id ASC, name DESC\'</span>);\n</code></pre>\n<blockquote><p>注意：当 <code>ORDER BY</code> 语句包含一些 DB 表达式的时候，你应该使用数组的格式。</p>\n</blockquote>\n<p>你可以调用 [yii\\db\\Query::addOrderBy()|addOrderBy()]] 来为 <code>ORDER BY</code> 片断添加额外的子句。\n例如，</p>\n<pre><code class=\"language-php hljs\"><span class=\"hljs-variable\">$query</span>-&gt;orderBy(<span class=\"hljs-string\">\'id ASC\'</span>)\n    -&gt;addOrderBy(<span class=\"hljs-string\">\'name DESC\'</span>);\n</code></pre>\n<h3>yii\\db\\Query::groupBy() <span></span></h3>\n<p>yii\\db\\Query::groupBy() 方法是用来指定 SQL 语句当中的 <code>GROUP BY</code> 片断的。例如，</p>\n<pre><code class=\"language-php hljs\"><span class=\"hljs-comment\">// ... GROUP BY `id`, `status`</span>\n<span class=\"hljs-variable\">$query</span>-&gt;groupBy([<span class=\"hljs-string\">\'id\'</span>, <span class=\"hljs-string\">\'status\'</span>]);\n</code></pre>\n<p>如果 <code>GROUP BY</code> 仅仅包含简单的字段名称，你可以使用字符串来声明它，\n就像写原生的 SQL 语句一样。例如，</p>\n<pre><code class=\"language-php hljs\"><span class=\"hljs-variable\">$query</span>-&gt;groupBy(<span class=\"hljs-string\">\'id, status\'</span>);\n</code></pre>\n<blockquote><p>注意：当 <code>GROUP BY</code> 语句包含一些 DB 表达式的时候，你应该使用数组的格式。</p>\n</blockquote>\n<p>你可以调用 [yii\\db\\Query::addOrderBy()|addOrderBy()]] 来为 <code>GROUP BY</code> \n子句添加额外的字段。例如，</p>\n<pre><code class=\"language-php hljs\"><span class=\"hljs-variable\">$query</span>-&gt;groupBy([<span class=\"hljs-string\">\'id\'</span>, <span class=\"hljs-string\">\'status\'</span>])\n    -&gt;addGroupBy(<span class=\"hljs-string\">\'age\'</span>);\n</code></pre>\n<h3>yii\\db\\Query::having() <span></span></h3>\n<p>yii\\db\\Query::having() 方法是用来指定 SQL 语句当中的 <code>HAVING</code> 子句。它带有一个条件，\n和 <a href=\"#where\">where()</a> 中指定条件的方法一样。例如，</p>\n<pre><code class=\"language-php hljs\"><span class=\"hljs-comment\">// ... HAVING `status` = 1</span>\n<span class=\"hljs-variable\">$query</span>-&gt;having([<span class=\"hljs-string\">\'status\'</span> =&gt; <span class=\"hljs-number\">1</span>]);\n</code></pre>\n<p>请查阅 <a href=\"#where\">where()</a> 的文档来获取更多有关于如何指定一个条件的细节。</p>\n<p>你可以调用 yii\\db\\Query::andHaving() 或者 yii\\db\\Query::orHaving() \n方法来为 <code>HAVING</code> 子句追加额外的条件，例如，</p>\n<pre><code class=\"language-php hljs\"><span class=\"hljs-comment\">// ... HAVING (`status` = 1) AND (`age` &gt; 30)</span>\n<span class=\"hljs-variable\">$query</span>-&gt;having([<span class=\"hljs-string\">\'status\'</span> =&gt; <span class=\"hljs-number\">1</span>])\n    -&gt;andHaving([<span class=\"hljs-string\">\'&gt;\'</span>, <span class=\"hljs-string\">\'age\'</span>, <span class=\"hljs-number\">30</span>]);\n</code></pre>\n<h3>yii\\db\\Query::limit() 和 yii\\db\\Query::offset() <span></span></h3>\n<p>yii\\db\\Query::limit() 和 yii\\db\\Query::offset() 是用来指定 SQL 语句当中\n的 <code>LIMIT</code> 和 <code>OFFSET</code> 子句的。例如，</p>\n<pre><code class=\"language-php hljs\"><span class=\"hljs-comment\">// ... LIMIT 10 OFFSET 20</span>\n<span class=\"hljs-variable\">$query</span>-&gt;limit(<span class=\"hljs-number\">10</span>)-&gt;offset(<span class=\"hljs-number\">20</span>);\n</code></pre>\n<p>如果你指定了一个无效的 limit 或者 offset（例如，一个负数），那么它将会被忽略掉。</p>\n<blockquote><p>提示：在不支持 <code>LIMIT</code> 和 <code>OFFSET</code> 的 DBMS 中（例如，MSSQL），\n  查询构建器将生成一条模拟 <code>LIMIT</code>/<code>OFFSET</code> 行为的 SQL 语句。</p>\n</blockquote>\n<h3>yii\\db\\Query::join() <span></span></h3>\n<table><thead><tr><th>[yii\\db\\Query::join()|join()]] 是用来指定 SQL 语句当中的 <code>JOIN</code> 子句的。例如，</th></tr></thead><tbody><tr><td><code>`</code>php</td></tr><tr><td>// ... LEFT JOIN <code>post</code> ON <code>post</code>.<code>user_id</code> = <code>user</code>.<code>id</code></td></tr><tr><td>$query-&gt;join(\'LEFT JOIN\', \'post\', \'post.user_id = user.id\');</td></tr><tr><td><code>`</code></td></tr></tbody></table><p>yii\\db\\Query::join() 带有四个参数：</p>\n<ul><li><code>$type</code>: 连接类型，例如：<code>\'INNER JOIN\'</code>, <code>\'LEFT JOIN\'</code>。</li>\n<li><code>$table</code>: 将要连接的表名称。</li>\n<li><code>$on</code>: 可选参数，连接条件，即 <code>ON</code> 子句。请查阅 <a href=\"#where\">where()</a> \n获取更多有关于条件定义的细节。</li>\n<li><code>$params</code>: 可选参数，与连接条件绑定的参数。</li>\n</ul><p>你可以分别调用如下的快捷方法来指定 <code>INNER JOIN</code>, <code>LEFT JOIN</code> 和 <code>RIGHT JOIN</code>。</p>\n<ul><li>yii\\db\\Query::innerJoin()</li>\n<li>yii\\db\\Query::leftJoin()</li>\n<li>yii\\db\\Query::rightJoin()</li>\n</ul><p>例如，</p>\n<pre><code class=\"language-php hljs\"><span class=\"hljs-variable\">$query</span>-&gt;leftJoin(<span class=\"hljs-string\">\'post\'</span>, <span class=\"hljs-string\">\'post.user_id = user.id\'</span>);\n</code></pre>\n<p>可以通过多次调用如上所述的连接方法来连接多张表，每连接一张表调用一次。</p>\n<p>除了连接表以外，你还可以连接子查询。方法如下，将需要被连接的子查询指定\n为一个 yii\\db\\Query 对象，例如，</p>\n<pre><code class=\"language-php hljs\"><span class=\"hljs-variable\">$subQuery</span> = (<span class=\"hljs-keyword\">new</span> \\yii\\db\\Query())-&gt;from(<span class=\"hljs-string\">\'post\'</span>);\n<span class=\"hljs-variable\">$query</span>-&gt;leftJoin([<span class=\"hljs-string\">\'u\'</span> =&gt; <span class=\"hljs-variable\">$subQuery</span>], <span class=\"hljs-string\">\'u.id = author_id\'</span>);\n</code></pre>\n<p>在这个例子当中，你应该将子查询放到一个数组当中，而数组当中的键，则为这个子查询的别名。</p>\n<h3>yii\\db\\Query::union() <span></span></h3>\n<p>yii\\db\\Query::union() 方法是用来指定 SQL 语句当中的 <code>UNION</code> 子句的。例如，</p>\n<pre><code class=\"language-php hljs\"><span class=\"hljs-variable\">$query1</span> = (<span class=\"hljs-keyword\">new</span> \\yii\\db\\Query())\n    -&gt;select(<span class=\"hljs-string\">\"id, category_id AS type, name\"</span>)\n    -&gt;from(<span class=\"hljs-string\">\'post\'</span>)\n    -&gt;limit(<span class=\"hljs-number\">10</span>);\n\n<span class=\"hljs-variable\">$query2</span> = (<span class=\"hljs-keyword\">new</span> \\yii\\db\\Query())\n    -&gt;select(<span class=\"hljs-string\">\'id, type, name\'</span>)\n    -&gt;from(<span class=\"hljs-string\">\'user\'</span>)\n    -&gt;limit(<span class=\"hljs-number\">10</span>);\n\n<span class=\"hljs-variable\">$query1</span>-&gt;union(<span class=\"hljs-variable\">$query2</span>);\n</code></pre>\n<p>你可以通过多次调用 yii\\db\\Query::union() 方法来追加更多的 <code>UNION</code> 子句。</p>\n<h2>查询方法 <span></span></h2>\n<p>yii\\db\\Query 提供了一整套的用于不同查询目的的方法。</p>\n<ul><li>yii\\db\\Query::all(): 将返回一个由行组成的数组，每一行是一个由名称和值构成的关联数组（译者注：省略键的数组称为索引数组）。</li>\n<li>yii\\db\\Query::one(): 返回结果集的第一行。</li>\n<li>yii\\db\\Query::column(): 返回结果集的第一列。</li>\n<li>yii\\db\\Query::scalar(): 返回结果集的第一行第一列的标量值。</li>\n<li>yii\\db\\Query::exists(): 返回一个表示该查询是否包结果集的值。</li>\n<li>yii\\db\\Query::count(): 返回 <code>COUNT</code> 查询的结果。</li>\n<li>其它集合查询方法: 包括 yii\\db\\Query::sum(), yii\\db\\Query::average(),\nyii\\db\\Query::max(), yii\\db\\Query::min() 等. <code>$q</code> 是一个必选参数，\n既可以是一个字段名称，又可以是一个 DB 表达式。</li>\n</ul><p>例如，</p>\n<pre><code class=\"language-php hljs\"><span class=\"hljs-comment\">// SELECT `id`, `email` FROM `user`</span>\n<span class=\"hljs-variable\">$rows</span> = (<span class=\"hljs-keyword\">new</span> \\yii\\db\\Query())\n    -&gt;select([<span class=\"hljs-string\">\'id\'</span>, <span class=\"hljs-string\">\'email\'</span>])\n    -&gt;from(<span class=\"hljs-string\">\'user\'</span>)\n    -&gt;all();\n    \n<span class=\"hljs-comment\">// SELECT * FROM `user` WHERE `username` LIKE `%test%`</span>\n<span class=\"hljs-variable\">$row</span> = (<span class=\"hljs-keyword\">new</span> \\yii\\db\\Query())\n    -&gt;from(<span class=\"hljs-string\">\'user\'</span>)\n    -&gt;where([<span class=\"hljs-string\">\'like\'</span>, <span class=\"hljs-string\">\'username\'</span>, <span class=\"hljs-string\">\'test\'</span>])\n    -&gt;one();\n</code></pre>\n<blockquote><p>注意：yii\\db\\Query::one() 方法只返回查询结果当中的第一条数据，\n  条件语句中不会加上 <code>LIMIT 1</code> 条件。如果你清楚的知道查询将会只返回一行或几行数据\n  （例如， 如果你是通过某些主键来查询的），这很好也提倡这样做。但是，如果查询结果\n  有机会返回大量的数据时，那么你应该显示调用 <code>limit(1)</code> 方法，以改善性能。\n  例如， <code>(new \\yii\\db\\Query())-&gt;from(\'user\')-&gt;limit(1)-&gt;one()</code>。</p>\n</blockquote>\n<p>所有的这些查询方法都有一个可选的参数 <code>$db</code>, 该参数指代的是 yii\\db\\Connection，\n执行一个 DB 查询时会用到。如果你省略了这个参数，那么 <code>db</code> <a href=\"/doc/guide/2.0/structure-application-components\">application component</a> 将会被用作\n默认的 DB 连接。 如下是另外一个使用 <code>count()</code> 查询的例子：</p>\n<pre><code class=\"language-php hljs\"><span class=\"hljs-comment\">// 执行 SQL: SELECT COUNT(*) FROM `user` WHERE `last_name`=:last_name</span>\n<span class=\"hljs-variable\">$count</span> = (<span class=\"hljs-keyword\">new</span> \\yii\\db\\Query())\n    -&gt;from(<span class=\"hljs-string\">\'user\'</span>)\n    -&gt;where([<span class=\"hljs-string\">\'last_name\'</span> =&gt; <span class=\"hljs-string\">\'Smith\'</span>])\n    -&gt;count();\n</code></pre>\n<p>当你调用 yii\\db\\Query 当中的一个查询方法的时候，实际上内在的运作机制如下： </p>\n<ul><li>在当前 yii\\db\\Query 的构造基础之上，调用 yii\\db\\QueryBuilder 来生成一条 SQL 语句；</li>\n<li>利用生成的 SQL 语句创建一个 yii\\db\\Command 对象； </li>\n<li>调用 yii\\db\\Command 的查询方法（例如，<code>queryAll()</code>）来执行这条 SQL 语句，并检索数据。</li>\n</ul><p>有时候，你也许想要测试或者使用一个由 yii\\db\\Query 对象创建的 SQL 语句。\n你可以使用以下的代码来达到目的：</p>\n<pre><code class=\"language-php hljs\"><span class=\"hljs-variable\">$command</span> = (<span class=\"hljs-keyword\">new</span> \\yii\\db\\Query())\n    -&gt;select([<span class=\"hljs-string\">\'id\'</span>, <span class=\"hljs-string\">\'email\'</span>])\n    -&gt;from(<span class=\"hljs-string\">\'user\'</span>)\n    -&gt;where([<span class=\"hljs-string\">\'last_name\'</span> =&gt; <span class=\"hljs-string\">\'Smith\'</span>])\n    -&gt;limit(<span class=\"hljs-number\">10</span>)\n    -&gt;createCommand();\n    \n<span class=\"hljs-comment\">// 打印 SQL 语句</span>\n<span class=\"hljs-keyword\">echo</span> <span class=\"hljs-variable\">$command</span>-&gt;sql;\n<span class=\"hljs-comment\">// 打印被绑定的参数</span>\nprint_r(<span class=\"hljs-variable\">$command</span>-&gt;params);\n\n<span class=\"hljs-comment\">// 返回查询结果的所有行</span>\n<span class=\"hljs-variable\">$rows</span> = <span class=\"hljs-variable\">$command</span>-&gt;queryAll();\n</code></pre>\n<h3>索引查询结果 <span></span></h3>\n<p>当你在调用 yii\\db\\Query::all() 方法时，它将返回一个以连续的整型数值为索引的数组。\n而有时候你可能希望使用一个特定的字段或者表达式的值来作为索引结果集数组。那么你可以在调用 yii\\db\\Query::all() \n之前使用 yii\\db\\Query::indexBy() 方法来达到这个目的。\n例如，</p>\n<pre><code class=\"language-php hljs\"><span class=\"hljs-comment\">// 返回 [100 =&gt; [\'id\' =&gt; 100, \'username\' =&gt; \'...\', ...], 101 =&gt; [...], 103 =&gt; [...], ...]</span>\n<span class=\"hljs-variable\">$query</span> = (<span class=\"hljs-keyword\">new</span> \\yii\\db\\Query())\n    -&gt;from(<span class=\"hljs-string\">\'user\'</span>)\n    -&gt;limit(<span class=\"hljs-number\">10</span>)\n    -&gt;indexBy(<span class=\"hljs-string\">\'id\'</span>)\n    -&gt;all();\n</code></pre>\n<p>如需使用表达式的值做为索引，那么只需要传递一个匿名函数给 yii\\db\\Query::indexBy() 方法即可：</p>\n<pre><code class=\"language-php hljs\"><span class=\"hljs-variable\">$query</span> = (<span class=\"hljs-keyword\">new</span> \\yii\\db\\Query())\n    -&gt;from(<span class=\"hljs-string\">\'user\'</span>)\n    -&gt;indexBy(<span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-params\">(<span class=\"hljs-variable\">$row</span>)</span> </span>{\n        <span class=\"hljs-keyword\">return</span> <span class=\"hljs-variable\">$row</span>[<span class=\"hljs-string\">\'id\'</span>] . <span class=\"hljs-variable\">$row</span>[<span class=\"hljs-string\">\'username\'</span>];\n    })-&gt;all();\n</code></pre>\n<p>该匿名函数将带有一个包含了当前行的数据的 <code>$row</code> 参数，并且返回用作当前行索引的\n标量值（译者注：就是简单的数值或者字符串，而不是其他复杂结构，例如数组）。</p>\n<h3>批处理查询 <span></span></h3>\n<p>当需要处理大数据的时候，像 yii\\db\\Query::all() 这样的方法就不太合适了，\n因为它们会把所有数据都读取到内存上。为了保持较低的内存需求， Yii 提供了一个\n所谓的批处理查询的支持。批处理查询会利用数据游标将数据以批为单位取出来。</p>\n<p>批处理查询的用法如下：</p>\n<pre><code class=\"language-php hljs\"><span class=\"hljs-keyword\">use</span> <span class=\"hljs-title\">yii</span>\\<span class=\"hljs-title\">db</span>\\<span class=\"hljs-title\">Query</span>;\n\n<span class=\"hljs-variable\">$query</span> = (<span class=\"hljs-keyword\">new</span> Query())\n    -&gt;from(<span class=\"hljs-string\">\'user\'</span>)\n    -&gt;orderBy(<span class=\"hljs-string\">\'id\'</span>);\n\n<span class=\"hljs-keyword\">foreach</span> (<span class=\"hljs-variable\">$query</span>-&gt;batch() <span class=\"hljs-keyword\">as</span> <span class=\"hljs-variable\">$users</span>) {\n    <span class=\"hljs-comment\">// $users 是一个包含100条或小于100条用户表数据的数组</span>\n}\n\n<span class=\"hljs-comment\">// or if you want to iterate the row one by one</span>\n<span class=\"hljs-keyword\">foreach</span> (<span class=\"hljs-variable\">$query</span>-&gt;each() <span class=\"hljs-keyword\">as</span> <span class=\"hljs-variable\">$user</span>) {\n    <span class=\"hljs-comment\">// $user 指代的是用户表当中的其中一行数据</span>\n}\n</code></pre>\n<p>yii\\db\\Query::batch() 和 yii\\db\\Query::each() 方法将会返回一个实现了<code>Iterator</code> \n接口 yii\\db\\BatchQueryResult  的对象，可以用在 <code>foreach</code> 结构当中使用。在第一次迭代取数据的时候，\n数据库会执行一次 SQL 查询，然后在剩下的迭代中，将直接从结果集中批量获取数据。默认情况下，\n一批的大小为 100，也就意味着一批获取的数据是 100 行。你可以通过给 <code>batch()</code> \n或者 <code>each()</code> 方法的第一个参数传值来改变每批行数的大小。</p>\n<p>相对于 yii\\db\\Query::all() 方法，批处理查询每次只读取 100 行的数据到内存。\n如果你在处理完这些数据后及时丢弃这些数据，那么批处理查询可以很好的帮助降低内存的占用率。</p>\n<p>如果你通过 yii\\db\\Query::indexBy() 方法为查询结果指定了索引字段，那么批处理查询将仍然保持相对应的索引方案，例如，</p>\n<pre><code class=\"language-php hljs\"><span class=\"hljs-variable\">$query</span> = (<span class=\"hljs-keyword\">new</span> \\yii\\db\\Query())\n    -&gt;from(<span class=\"hljs-string\">\'user\'</span>)\n    -&gt;indexBy(<span class=\"hljs-string\">\'username\'</span>);\n\n<span class=\"hljs-keyword\">foreach</span> (<span class=\"hljs-variable\">$query</span>-&gt;batch() <span class=\"hljs-keyword\">as</span> <span class=\"hljs-variable\">$users</span>) {\n    <span class=\"hljs-comment\">// $users 的 “username” 字段将会成为索引</span>\n}\n\n<span class=\"hljs-keyword\">foreach</span> (<span class=\"hljs-variable\">$query</span>-&gt;each() <span class=\"hljs-keyword\">as</span> <span class=\"hljs-variable\">$username</span> =&gt; <span class=\"hljs-variable\">$user</span>) {\n}\n</code></pre>\n		</div>', '查询构建器,DAO,', 2, 1443002072, 1443002072, 1),
(42, '旧版Yii2.0视频教程', '			<div class=\"post\">\r\n		\r\n				<div class=\"title\">\r\n		\r\n	\r\n\r\n						<div class=\"desc\">\r\n							<p>本教程共2小时10分钟左右。结合了个人博客的例子，高效、系统、完整地讲解了Yii2.0框架的核心知识点，让学习Yii框架的过程变得轻松一点、愉快一点。<br>\r\n							Tips:请用超清模式播放。</p>\r\n						</div>\r\n		\r\n				</div>\r\n		\r\n		\r\n				<div class=\"content\">\r\n				\r\n			\r\n					<ul class=\"list-unstyled\">\r\n		 				  \r\n						 <li><h3>1、	课程简介</h3>\r\n						 		<ul class=\"list-unstyled lilevel2\">\r\n						  		<li><a href=\"/yii2/clip1.php\" target=\"_blank\"> 1.1 Yii框架介绍和教程讲解安排（<em>4分20秒</em>）<span class=\"glyphicon glyphicon-facetime-video\" aria-hidden=\"true\"></span> 在线观看 </a></li>\r\n						  		</ul>						  \r\n						  </li>\r\n						  \r\n						 <li><h3>2、	创建博客原型</h3>\r\n						 \r\n								<ul class=\"list-unstyled lilevel2\">\r\n								 \r\n								 <li>  <a href=\"/yii2/clip2.php\" target=\"_blank\"> 2.1 安装（<em>3分50秒</em>）<span class=\"glyphicon glyphicon-facetime-video\" aria-hidden=\"true\"></span> 在线观看 </a></li>\r\n								 <li> <a href=\"/yii2/clip3.php\" target=\"_blank\">  2.2 Yii运行原理初探（<em>10分40秒</em>）<span class=\"glyphicon glyphicon-facetime-video\" aria-hidden=\"true\"></span> 在线观看 </a></li>\r\n								 <li>  <a href=\"/yii2/clip4.php\" target=\"_blank\"> 2.3 博客系统需求和数据库（<em>4分40秒</em>）<span class=\"glyphicon glyphicon-facetime-video\" aria-hidden=\"true\"></span> 在线观看 </a></li>\r\n								 <li> <a href=\"/yii2/clip5.php\" target=\"_blank\">  2.4 Gii生成博客原型（<em>7分50秒</em>）<span class=\"glyphicon glyphicon-facetime-video\" aria-hidden=\"true\"></span> 在线观看 </a></li>\r\n								\r\n								</ul>\r\n						\r\n						</li>\r\n						\r\n						\r\n						 <li><h3>3、	通过分析代码学习Yii知识</h3>\r\n								  <ul class=\"list-unstyled lilevel2\">\r\n								 <li><a href=\"/yii2/clip6.php\" target=\"_blank\"> 3.1 文章查看功能的代码分析（<em>21分10秒</em>）<span class=\"glyphicon glyphicon-facetime-video\" aria-hidden=\"true\"></span> 在线观看 </a></li>\r\n								 <li><a href=\"/yii2/clip7.php\" target=\"_blank\"> 3.2 文章新增和修改功能的代码分析（<em>16分00秒</em>）<span class=\"glyphicon glyphicon-facetime-video\" aria-hidden=\"true\"></span> 在线观看 </a></li>\r\n								 <li><a href=\"/yii2/clip8.php\" target=\"_blank\"> 3.3 文章管理功能的代码分析（<em>24分20秒</em>）<span class=\"glyphicon glyphicon-facetime-video\" aria-hidden=\"true\"></span> 在线观看 </a></li>\r\n								</ul>\r\n						</li>		\r\n						 <li><h3>4、	完善博客原型</h3>\r\n								  <ul class=\"list-unstyled lilevel2\">\r\n								 <li><a href=\"/yii2/clip9.php\" target=\"_blank\"> 4.1 完善博客系统的后台功能（<em>23分20秒</em>）<span class=\"glyphicon glyphicon-facetime-video\" aria-hidden=\"true\"></span> 在线观看 </a></li>\r\n								 <li><a href=\"/yii2/clip10.php\" target=\"_blank\"> 4.2 完善博客系统的前台部分以及总结（<em>18分40秒</em>）<span class=\"glyphicon glyphicon-facetime-video\" aria-hidden=\"true\"></span> 在线观看 </a></li>\r\n								 </ul>\r\n						</li>\r\n					</ul>\r\n\r\n				</div>	\r\n\r\n			</div>\r\n', 'Yii2,视频教程,教程', 2, 1445512144, 1705383955, 1),
(51, '2', '<p>2<br></p>', 'yii', 2, 1705413304, 1705413304, 2);

-- --------------------------------------------------------

--
-- 表的结构 `poststatus`
--

DROP TABLE IF EXISTS `poststatus`;
CREATE TABLE IF NOT EXISTS `poststatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `poststatus`
--

INSERT INTO `poststatus` (`id`, `name`, `position`) VALUES
(1, '草稿', 1),
(2, '已发布', 2),
(3, '已归档', 3);

-- --------------------------------------------------------

--
-- 表的结构 `tag`
--

DROP TABLE IF EXISTS `tag`;
CREATE TABLE IF NOT EXISTS `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `frequency` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `tag`
--

INSERT INTO `tag` (`id`, `name`, `frequency`) VALUES
(60, 'Yii', 24),
(61, 'RESTful Web服务', 5),
(62, 'Yii2', 25),
(63, 'Gii', 8),
(64, '查询构建器', 2),
(65, 'DAO', 8),
(66, 'GridView', 10),
(67, 'ListView', 4),
(68, 'DetailView', 4),
(69, 'ActiveRecord', 25),
(70, '安装', 3),
(71, 'Composer', 3),
(74, '视频教程', 1),
(75, '教程', 1),
(76, '测试', 1);

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`) VALUES
(1, 'weixi_member', 'pG7TRyTIXlEbcenpi34TzmMYS2zDsMTF', '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu', NULL, 'weixi@weixistyle.com', 10, 1462597929, 1477554091),
(2, 'michael', 'xqGDBMlylihvNddSQgDkjAdpJwV4d02C', '$2y$13$bJC0vECI9EPLq/kia9CAmOT060fxoT/HopseOnY.C9siZJDOoQguK', NULL, 'mchael@163.com', 10, 1475850924, 1475850924),
(3, 'wo', 'T1xKUP_H3nEq00AufV56kuE2UZSweFFL', '$2y$13$Fld1Kn0neSxpCNycH1bghO3bcsBtg776mZoW3Y6Kkh497XFyp7JXu', NULL, '1111@gmail.com', 10, 1705122606, 1705122606),
(4, 'weixi', 'TM5y9vFOAXsE3pObRzEAVbkHW7bMt5ZA', '$2y$13$VpDUH/W70JndBdw4iIxLMOPCPWiUkBh8fOhNKUu48M0YaTDKh3scW', NULL, '11111@gmail.com', 10, 1705242969, 1705242969);

--
-- 限制导出的表
--

--
-- 限制表 `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- 限制表 `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_comment_post` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_comment_status` FOREIGN KEY (`status`) REFERENCES `commentstatus` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_comment_user` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- 限制表 `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `FK_post_author` FOREIGN KEY (`author_id`) REFERENCES `adminuser` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_post_status` FOREIGN KEY (`status`) REFERENCES `poststatus` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
