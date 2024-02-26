<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\Categoryname */

$this->title = '新增文章类型';
$this->params['breadcrumbs'][] = ['label' => '文章类型', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="categoryname-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
