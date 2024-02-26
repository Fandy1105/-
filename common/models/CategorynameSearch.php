<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\Categoryname;

/**
 * CategorynameSearch represents the model behind the search form about `common\models\Categoryname`.
 */
class CategorynameSearch extends Categoryname
{
    
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['cid'], 'integer'],
            [['cname'], 'safe'],
            
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Categoryname::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => ['pageSize'=>10],
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'cid' => $this->cid,
        ]);

        $query->andFilterWhere(['like', 'cname', $this->cname]);
        
        //增加数据库表category和categoryname的关联，统计文章类型总数
        $query->joinWith('category', false, 'LEFT JOIN');
        $query->groupBy('Categoryname.cid');
        $query->select(['Categoryname.*', 'articlesCount' => 'COUNT(category.id)']);
        
        
        //增加按类型总数升降序的排法
        $dataProvider->sort->attributes['articlesCount'] = [
            'asc' => ['articlesCount' => SORT_ASC],
            'desc' => ['articlesCount' => SORT_DESC],
        ];
        
        

        return $dataProvider;
    }
}
