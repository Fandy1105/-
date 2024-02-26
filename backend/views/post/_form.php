<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use common\models\Poststatus;
use yii\helpers\ArrayHelper;
use common\models\Adminuser;
use common\models\Categoryname;


/* @var $this yii\web\View */
/* @var $model common\models\Post */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="post-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'title')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'content')->textarea(['rows' => 6,'class'=>"summernote"]) ?>
	 


    <?= $form->field($model, 'tags')->textarea(['rows' => 6]) ?>
	
	
    
    <?= $form->field($model,'status')
         ->dropDownList(Poststatus::find()
						->select(['name','id'])
						->orderBy('position')
						->indexBy('id')
						->column(),
    		   ['prompt'=>'请选择状态']);?>
     		  
	<?= $form->field($model,'category_id')
         ->dropDownList(Categoryname::find()
						->select(['cname','cid'])
                        ->orderBy('cid')
						->indexBy('cid')
						->column(),
    		   ['prompt'=>'请选择类型']);?>

        <?= $form->field($model,'author_id')
         ->dropDownList(Adminuser::find()
						->select(['nickname','id'])
						->indexBy('id')
						->column(),
    		   ['prompt'=>'请选择作者']);?>
    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? '新增' : '修改', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>
    <!-- summernote所需script代码 -->
    <script>
    $(".summernote").summernote({
	height:500, //高度
	minHeight:null, //最小高度
	maxHeight:null, //最大高度
	focus:false, //是否获取焦点
	lang:'zh-CN' //中文
})

  </script>
    <?php ActiveForm::end(); ?>
 
</div>
