<?php
/* @var $this yii\web\View */
/* @var $userCount int */
/* @var $postCount int */
/* @var $commentCount int */
/* @var $adminuserCount int */

use yii\helpers\Html;
use yii\web\JsExpression;

$this->title = '后台数据统计：';
$this->params['breadcrumbs'][] = $this->title;

// 注册 ECharts JS 库，依靠Jquery实现
$this->registerJsFile('https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js', ['depends' => [\yii\web\JqueryAsset::class]]);

// 注册用于渲染 ECharts 图表的 JS 代码,柱状图
$this->registerJs(new JsExpression("
    var myChart = echarts.init(document.getElementById('main'));
    var option = {
        title: { text: '系统后台统计' },
        tooltip: {},
        legend: { data: ['数量'] },
        xAxis: { data: ".json_encode(array_keys($data))." },
        yAxis: {},
        series: [{ name: '数量', type: 'bar', data: $dataJson }]
    };
    myChart.setOption(option);
"));

//注册用于渲染 ECharts 图表的 JS 代码,饼状图
$this->registerJs(new JsExpression("
    var myChart = echarts.init(document.getElementById('pie'));
    var option = {
        title: {
            text: '系统后台统计',
            left: 'center'
        },
        tooltip: {
            trigger: 'item'
        },
        legend: {
            orient: 'vertical',
            left: 'left'
        },
        series: [
            {
                name: '数量',
                type: 'pie',
                radius: '50%',
                data: $dataJson,
                emphasis: {
                    itemStyle: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    };
    myChart.setOption(option);
"));
//用于显示文章分类情况的柱状图
$this->registerJs(new JsExpression("
    var myChart = echarts.init(document.getElementById('categorybar'));
    var option = {
        title: { text: '文章分类统计' },
        tooltip: {},
        legend: { data: ['数量'] },
        xAxis: { data: ".json_encode(array_keys($categoryData))." },
        yAxis: {},
        series: [{ name: '数量', type: 'bar', data: $categoryDataJson }]
    };
    myChart.setOption(option);
"));
//用于显示文章分类情况的饼状图
$this->registerJs(new JsExpression("
    var myChart = echarts.init(document.getElementById('categorypie'));
    var option = {
        title: {
            text: '文章分类统计',
            left: 'center'
        },
        tooltip: {
            trigger: 'item'
        },
        legend: {
            orient: 'vertical',
            left: 'left'
        },
        series: [
            {
                name: '数量',
                type: 'pie',
                radius: '50%',
                data: $categoryDataJson,
                emphasis: {
                    itemStyle: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    };
    myChart.setOption(option);
"));

?>
<div class="dashboard-view">
	<h1><?= Html::encode($this->title) ?></h1>
	
	<div style="display: flex; justify-content: space-around; align-items: center;">
    	<div id="main" style="width: 600px; height:400px;"></div>
    	<div id="pie" style="width: 500px; height:400px;"></div>
    </div>
    <div style="display: flex; justify-content: space-around; align-items: center;">
    	<div id="categorybar" style="width: 600px; height:400px;"></div>
    	<div id="categorypie" style="width: 500px; height:400px;"></div>
    </div>
    
</div>

