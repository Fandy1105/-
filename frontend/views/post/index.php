<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\ListView;
use frontend\components\TagsCloudWidget;
use frontend\components\RctReplyWidget;
use common\models\Post;
use frontend\widgets\banner\BannerWidget;
use yii\bootstrap\ActiveForm;
use yii\helpers\ArrayHelper;
use common\models\Categoryname;


/* @var $this yii\web\View */
/* @var $searchModel common\models\PostSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
//储存文章分类
$categories = ArrayHelper::map(Categoryname::find()->all(), 'cid', 'cname');

?>

<div class="container">

	<div class="row">
		<!-- 插入轮播图组件 --> 
		
		<?= BannerWidget::widget()?>
		
		<script type="text/javascript">
        $(document).ready(function(){
            $('#carousel-example-generic').carousel();
        });
    	</script>
		<div class="col-md-9">
		
		<ol class="breadcrumb">
		<li><a href="<?= Yii::$app->homeUrl;?>">首页</a></li>
		<li>文章列表</li>
		
		
		</ol>
		
		<?= ListView::widget([
				'id'=>'postList',
				'dataProvider'=>$dataProvider,
				'itemView'=>'_listitem',//子视图,显示一篇文章的标题等内容.
				'layout'=>'{items} {pager}',
				'pager'=>[
						'maxButtonCount'=>10,
						'nextPageLabel'=>Yii::t('app','下一页'),
						'prevPageLabel'=>Yii::t('app','上一页'),
		],
		])?>
		
		</div>

		
		<div class="col-md-3">
			<div class="searchbox">
				<ul class="list-group">
				  <li class="list-group-item">
				  <span class="glyphicon glyphicon-search" aria-hidden="true"></span> 查找文章（
				  <?= Post::find()->count();?>
				  )
				  </li>
				  <li class="list-group-item">				  
					  <form class="form-inline" action="index.php?r=post/index" id="w0" method="get">
						  <div class="form-group">
						    <input type="text" class="form-control" name="PostSearch[title]" id="w0input" placeholder="按标题">
						  </div>
						  <button type="submit" class="btn btn-default">搜索</button>
					</form>
				  
				  </li>
				</ul>			
			</div>
			<!-- 下拉框选择文章类型 -->
			<div class="category-select-box">
    			<ul class="list-group">
        			<li class="list-group-item">
            			<span class="glyphicon glyphicon-list" aria-hidden="true"></span> 选择文章类型
        			</li>
        			<li class="list-group-item">
            			<?php $form = ActiveForm::begin([
                            'action' => ['post/index'], // 指定动作路由
                            'method' => 'get',
                        ]); ?>

            			<?= $form->field($searchModel, 'selectedCategoryTypeId')->dropDownList($categories, ['prompt' => '选择文章类型'])->label(false); ?>

            			<?= Html::submitButton('搜索', ['class' => 'btn btn-default']); ?>

            			<?php ActiveForm::end(); ?>
        			</li>
    			</ul>
			</div>
			<div class="tagcloudbox">
				<ul class="list-group">
				  <li class="list-group-item">
				  <span class="glyphicon glyphicon-tags" aria-hidden="true"></span> 标签云
				  </li>
				  <li class="list-group-item">
				  <?= TagsCloudWidget::widget(['tags'=>$tags])?>
				   </li>
				</ul>			
			</div>
			
			
			<div class="commentbox">
				<ul class="list-group">
				  <li class="list-group-item">
				  <span class="glyphicon glyphicon-comment" aria-hidden="true"></span> 最新回复
				  </li>
				  <li class="list-group-item">
				  <?= RctReplyWidget::widget(['recentComments'=>$recentComments])?>
				  </li>
				</ul>			
			</div>
			
		
		</div>
		
		
	</div>

</div>
