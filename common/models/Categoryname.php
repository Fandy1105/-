<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "categoryname".
 *
 * @property integer $cid
 * @property string $cname
 */
class Categoryname extends \yii\db\ActiveRecord
{
    public $articlesCount;//声明文章数
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'categoryname';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['cname'], 'required'],
            [['cname'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'cid' => 'ID',
            'cname' => '文章类型',
        ];
    }
    
    public function getCategory()
    {
        return $this->hasMany(Category::className(), ['cid' => 'cid']);
    }
    //获得文章类型总数
    public function getArticlesCount()
    {
        
        return Category::find()->where(['cid' => $this->cid])->count();
    }
    
}
