<?php
namespace frontend\widgets\banner;
 
/**
 * 轮播图组件
 * Class
 * @package frontend\widgets\banner
 */
 
use yii\bootstrap\Widget;
 
class BannerWidget extends Widget
{
    public $items = [];
 
    /**
     * 初始化，如果items没有传值则使用默认设置banner
     */
    public function init()
    {
        if (empty($this->items)){
            $this->items = [
                [
                    'label'=>'demo1',
                    'image_url'=>'assets/image1.png',
                    'url'=>['site/index'],
                    'html'=>'',
                    'active'=>'active',
                ],
                [
                    'label'=>'demo2',
                    'image_url'=>'assets/image2.png',
                    'url'=>['site/index'],
                    'html'=>'',
                    'active'=>'',
                ],
                
            ];
        }
    }
 
    /**
     * 组件运行，把items数据渲染到组件views下的index
     * @return string
     */
    public function run()
    {
        $data['items'] = $this->items;
 
        return $this->render('index', ['data'=>$data]);
    }
}