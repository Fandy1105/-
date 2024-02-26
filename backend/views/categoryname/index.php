<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\bootstrap\ActiveForm;
use yii\helpers\ArrayHelper;
use common\models\Categoryname;

/* @var $this yii\web\View */
/* @var $searchModel common\models\CategorynameSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = '分类管理';
$this->params['breadcrumbs'][] = $this->title;


?>
<div class="categoryname-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('新增文章类型', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['attribute'=>'cid',
                'contentOptions'=>['width'=>'30px'],
            ],
            ['attribute'=>'cname',
                'label'=>'文章类型',
               
            ],
            [
                'attribute' => 'articlesCount',
                'label' => '文章数量',
                'value' => function ($model) {
                return $model->getArticlesCount(); 
                },
             ],

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
