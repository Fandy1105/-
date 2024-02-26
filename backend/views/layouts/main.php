<?php

/* @var $this \yii\web\View */
/* @var $content string */

use backend\assets\AppAsset;
use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use common\widgets\Alert;
use common\models\Comment;


AppAsset::register($this);

?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?= Html::csrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
     <?php
// 引入SB Admin2的 CSS
echo Html::cssFile('@web/assets/startbootstrap-sb-admin-2-3.3.7-1/vendor/bootstrap/css/bootstrap.min.css');
echo Html::cssFile('@web/assets/startbootstrap-sb-admin-2-3.3.7-1/vendor/metisMenu/metisMenu.min.css');
echo Html::cssFile('@web/assets/startbootstrap-sb-admin-2-3.3.7-1/dist/css/sb-admin-2.css');
echo Html::cssFile('@web/assets/startbootstrap-sb-admin-2-3.3.7-1/vendor/font-awesome/css/font-awesome.min.css');
echo Html::cssFile('@web/assets/startbootstrap-sb-admin-2-3.3.7-1/vendor/font-awesome/css/font-awesome.min.css');
?>
	<!-- 引入富文本编辑器summernate -->
	<link href="https://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap.css" rel="stylesheet">
<link href="https://cdn.bootcss.com/summernote/0.8.10/summernote.css" rel="stylesheet">
<script src="https://cdn.bootcss.com/jquery/1.11.0/jquery.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.js"></script>
<script src="https://cdn.bootcss.com/summernote/0.8.10/summernote.js"></script>
<script src="https://cdn.bootcss.com/summernote/0.8.10/lang/summernote-zh-CN.js"></script>

</head>
<body>
<?php $this->beginBody() ?>

<?php

// 导航菜单项
$menuItems = [
    ['label' => '首页', 'url' => ['/site/index']],
    ['label' => 'DashBoard', 'url' => ['/dashboard/index']],
    ['label' => '文章管理', 'url' => ['/post/index']],
    ['label' => '评论管理', 'url' => ['/comment/index']],
    ['label' => '用户管理', 'url' => ['/user/index']],
    ['label' => '分类管理', 'url' => ['/categoryname/index']],
    ['label' => '管理员', 'url' => ['/adminuser/index']],
    
];

// 登录注销菜单项
if (Yii::$app->user->isGuest) {
    $menuItems[] = ['label' => '登录', 'url' => ['/site/login']];
} else {
    $menuItems[] = '<li>'
        . Html::beginForm(['/site/logout'], 'post')
        . Html::submitButton(
            '注销 (' . Yii::$app->user->identity->username . ')',
            ['class' => 'btn btn-link']
        )
        . Html::endForm()
        . '</li>';
}
?>
 <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/">Blogdemo2</a>
            </div>
            <!-- /.navbar-header -->
			<ul class="nav navbar-top-links navbar-right">
            	<ul class="nav navbar-nav">
                    <?php foreach ($menuItems as $menuItem): ?>
                        <?php if (is_array($menuItem)): ?>
                        	<li><?= Html::a($menuItem['label'], $menuItem['url']) ?></li>
                    	<?php else: ?>
                        	<?= $menuItem ?>
                    	<?php endif; ?>
                	<?php endforeach; ?>
            	</ul>
        	</ul>
        	
            <!-- /.navbar-static-side -->
        </nav>
        	<div class="container-fluid">
        		<div class="row">
                    <!--使用col-md-2和col-md-10布置侧边栏和页面主体部分布局-->
        			<div class="col-md-2 navbar-default sidebar" >
                		<div class="sidebar-nav navbar-collapse">
                    		<ul id="side-menu" class="nav in">
                
                                <!-- 管理员导航菜单 -->
                        		<?php foreach ($menuItems as $menuItem): ?>
                            	<?php if (is_array($menuItem)): ?>
                                	<li><?= Html::a($menuItem['label'], $menuItem['url']) ?></li>
                            	<?php else: ?>
                                	<?= $menuItem ?>
                            	<?php endif; ?>
                        		<?php endforeach; ?>

                    		</ul>
                		</div>
                    </div>
        		
        		
        		<div class="col-md-10" id="page-wrapper" >
            		<div class="container-fluid">
                		<div class="row">
                                <!--$content放置页面信息-->
                        		<div class="container">
                        			<!-- 显示页面内容 -->
                            		<?= $content ?>
                            		<!-- 显示闪存消息 -->
        							<?php foreach (Yii::$app->session->getAllFlashes() as $key => $message): ?>
            						<div class="alert alert-<?= Html::encode($key) ?>">
                						<?= Html::encode($message) ?>
            						</div>
        							<?php endforeach; ?>
                    		
                				</div>
                    <!-- /.row -->
            		</div>
        		</div>
                <!-- /#page-wrapper -->
                </div>
			</div>
    </div>
    <!-- /#wrapper -->

<footer class="footer" >
    <div class="container">
        <p class="pull-left">&copy; 222100404_余诗怡 <?= date('Y') ?></p>

        <p class="pull-right"><?= Yii::powered() ?></p>
    </div>
</footer>


<?php

//引入SB Admin2的JS文件

echo Html::jsFile('@web/assets/startbootstrap-sb-admin-2-3.3.7-1/vendor/bootstrap/js/bootstrap.min.js');
echo Html::jsFile('@web/assets/startbootstrap-sb-admin-2-3.3.7-1/vendor/metisMenu/metisMenu.min.js');


?>

<?php $this->endBody() ?>

    
</body>
</html>
<?php $this->endPage() ?>
