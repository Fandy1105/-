<?php

namespace backend\controllers;

use Yii;
use common\models\Post;
use common\models\PostSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use common\models\Category;

/**
 * PostController implements the CRUD actions for Post model.
 */
class PostController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],  

        	'access' =>[
        				'class' => AccessControl::className(),
        				'rules' =>
        				[
        						[
        								'actions' => ['index', 'view'],
        								'allow' => true,
        								'roles' => ['?'],
        						],
        				[
        				'actions' => ['view', 'index', 'create','update','delete'],
        				'allow' => true,
        				'roles' => ['@'],
        			],
        		],
        		],        		
        ];
    }

    /**
     * Lists all Post models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new PostSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Post model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Post model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Post();
        
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            $categoryModel = new Category();
            $categoryModel->id = $model->id;  
            $categoryModel->cid = $model->category_id; // 从表单获取分类 ID
            $categoryModel->save();
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing Post model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        
        // 尝试找到与该文章相关联的现有 Category 记录
        $categoryModel = Category::findOne(['id' => $model->id]);
        
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            // 如果没有找到现有的 Category 记录，则创建一个新的
            if ($categoryModel === null) {
                $categoryModel = new Category();
                $categoryModel->id = $model->id; // 设置文章 ID
            }
            
            // 从表单获取的分类 ID
            $categoryModel->cid = $model->category_id;
            
            // 保存 Category 模型，处理可能的错误
            if (!$categoryModel->save()) {
                // 处理错误，例如记录错误信息或向用户显示错误
                Yii::$app->session->setFlash('error', '无法保存分类信息。');
            }
            
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }
    

    /**
     * Deletes an existing Post model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Post model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Post the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Post::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
