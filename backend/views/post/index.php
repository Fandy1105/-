<?php

use yii\helpers\Html;
use yii\grid\GridView;
use common\models\Poststatus;
use yii\bootstrap\ActiveForm;
use yii\helpers\ArrayHelper;
use common\models\Categoryname;


/* @var $this yii\web\View */
/* @var $searchModel common\models\PostSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = '文章管理';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="post-index">

    <h1><?= Html::encode($this->title) ?></h1>
    

    <p>
        <?= Html::a('创建文章', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
   <p>
   		<?php
   		$form = ActiveForm::begin([
   		    'method' => 'get',
   		]);
   		
   		// 获取所有文章类型的列表
   		$categories = ArrayHelper::map(Categoryname::find()->all(), 'cid', 'cname');
   		echo $form->field($searchModel, 'selectedCategoryTypeId')->dropDownList($categories, ['prompt' => '选择文章类型']);
   		
   		echo Html::submitButton('搜索', ['class' => 'btn btn-primary']);
   		
   		ActiveForm::end();
   		?>
   </p>
   

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
           
            ['attribute'=>'id',
            'contentOptions'=>['width'=>'30px'],
            ],
            'title',
        	//'author_id',
        	['attribute'=>'authorName',
        	'label'=>'作者',
        	'value'=>'author.nickname',
    		],
           // 'content:ntext',
            'tags:ntext',
            [
                'attribute' => 'category_id', // 文章类型的属性
                'label' => '文章类型', // 列的标题
                'value' => function ($model) {
                // 使用 getCategoryName 关联关系获取文章类型名称
            return $model->categoryName ? $model->categoryName->cname : '未分类';
                },
            ],
            //'status',
            ['attribute'=>'status',
            'value'=>'status0.name',
            'filter'=>Poststatus::find()
            		->select(['name','id'])
            		->orderBy('position')
            		->indexBy('id')
            		->column(),
   			 ],
            // 'create_time:datetime',
             //'update_time:datetime',
             ['attribute'=>'update_time',
             'format'=>['date','php:Y-m-d H:i:s'],
        	],
             

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
