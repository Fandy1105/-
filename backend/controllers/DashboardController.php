<?php

namespace backend\controllers;

use common\models\User;
use common\models\Post;
use common\models\Comment;
use common\models\Adminuser;
use common\models\Categoryname;
use common\models\Category;


class DashboardController extends \yii\web\Controller
{
    public function actionIndex()
    {
        // 使用 ActiveRecord 
        // 获取用户总数
        $userCount = User::find()->count();
        
        // 获取帖子总数
        $postCount = Post::find()->count();
        
        // 获取评论总数
        $commentCount = Comment::find()->count();
        
        //获取管理员总数
        $adminuserCount = Adminuser::find()->count();
        
        // 准备用于图表的数据
        $data = [
            ['name' => '用户总数', 'value' => $userCount],
            ['name' => '帖子总数', 'value' => $postCount],
            ['name' => '评论总数', 'value' => $commentCount],
            ['name' => '管理员总数', 'value' => $adminuserCount],
        ];
        
        $dataJson = json_encode(array_values($data)); // 转换为 JSON 
        
        // 获取文章分类统计数据
        $categoryData = [];
        $categories = Categoryname::find()->all();
        
        foreach ($categories as $category) {
            $count = $category->getArticlesCount(); // 使用模型方法获取文章数量
            $categoryData[] = ['name' => $category->cname, 'value' => $count];
        }
        
        $categoryDataJson = json_encode(array_values($categoryData)); // 转换为 JSON
        // 将数据传递给视图
        return $this->render('index', [
            'data'=>$data,
            'dataJson'=>$dataJson,
            'categoryData'=>$categoryData,
            'categoryDataJson' => $categoryDataJson,
        ]);
    }
}