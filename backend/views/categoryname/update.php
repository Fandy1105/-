<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Categoryname */

$this->title = '更新文章类型 ' . $model->cid;
$this->params['breadcrumbs'][] = ['label' => '文章类型', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->cid, 'url' => ['view', 'id' => $model->cid]];
$this->params['breadcrumbs'][] = '更新';
?>
<div class="categoryname-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
