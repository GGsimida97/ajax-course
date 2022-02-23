<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>dom对象转为jquery对象</title>
    <script type="text/javascript" src="js/jquery-3.6.0.js"></script>
    <script type="text/javascript">
        function btnClick() {
            //获取dom对象
            var obj = document.getElementById("btn1");
            //使用dom的value属性，获取值
            alert("使用dom对象的value属性：" + obj.value);
            //把dom对象转为jquery对象，为了使用jquery库中的函数
            //var $jobj = $(obj);
            var $jobj = $("#btn1");
            //调用jquery中的val()函数，获取value值
            alert("使用jquery对象的val()方法：" + $jobj.val());
        }

        //jquery中给dom对象绑定事件
        $(function () {
            //当页面的dom对象加载后，给对象绑定事件，因为此时button对象已经在内存中创建好了，可以使用了
            $("#btn2").click(
                function () {
                    //alert("btn2按钮被单击了");
                    var $jObj = $("div:eq(1)");
                    $jObj.css("background", "red");
                })
            $("#btn3").click(function () {
                //获取select选中的值
                var $obj = $("select>option:selected");
                alert($obj.val());
            })
            $("#btn4").click(function () {
               //改变第一个button的背景颜色
                var $obj = $(":button:first");
                $obj.css("background", "blue");
            })
            $("#btn5").click(function () {
                //循环遍历普通数组，即非dom数组
                var arr = [1,2,3];
                $.each(arr,function (index,element) {
                    alert("循环变量：" + index + "===数组成员：" + element);
                })
            })
            $("#btn6").click(function () {
                //循环遍历json数组
                var json = {"name":"张三","age":20};
                $.each(json,function (index,element) {
                    alert("index是key：" + index + "===element是value：" + element);
                })
            })
            $("#btn7").click(function () {
                //循环遍历jquery对象，jquery对象就是dom数组
               $(":button").each(function (i,n) {
                  alert("i:" + i + "==n:" + n.value);
               })
            })
        })

    </script>
</head>
<body>
<input type="button" id="btn1" value="我是第一个按钮" onclick="btnClick()"/>
<br/>
<input type="button" id="btn2" value="我是第二个按钮"/>
<br/>
<input type="button" id="btn3" value="我是第三个按钮"/>
<br/>
<input type="button" id="btn4" value="我是第四个按钮"/>
<br/>
<input type="button" id="btn5" value="循环非dom数组"/>
<br/>
<input type="button" id="btn6" value="循环json数组"/>
<br/>
<input type="button" id="btn7" value="循环jquery对象"/>
<div>我是第一个div</div>
<div>我是第二个div</div>
<select>
    <option value="java">我是java语言</option>
    <option value="go" selected>我是go语言</option>
    <option value="c++">我是c++语言</option>
</select>
</body>
</html>
