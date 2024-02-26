<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "category".
 *
 * @property integer $id
 * @property integer $cid
 */
class Category extends \yii\db\ActiveRecord
{
    public $articlesCount;//声明文章数
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'category';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['cid'], 'required'],
            [['cid'], 'integer'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'cid' => 'Cid',
        ];
    }
    //建立与categoryname的关联
    public function getCategoryName()
    {
        return $this->hasOne(CategoryName::className(), ['cid' => 'cid']);
    }
    
    
}
