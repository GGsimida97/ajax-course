<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>局部刷新-ajax</title>
    <script type = "text/javascript">
      //使用浏览器内存中的异步对象，代替浏览器发起请求。异步对象是由js创建和管理的
      function doAjax(){
        //1、创建异步对象
        var xmlHttp = new XMLHttpRequest();
        //2绑定事件
        xmlHttp.onreadystatechange = function (){
          //处理服务器端返回的数据，更新当前页面
          //alert("readState属性值====" + xmlHttp.readyState + "| status" + xmlHttp.status)
          if(xmlHttp.readyState == 4 && xmlHttp.status == 200){
           // alert(xmlHttp.responseText);
            var data = xmlHttp.responseText;
            //更新dom对象，更新页面数据
            document.getElementById("mydata").innerText = data;
          }
        }
        //3、初始请求数据
        //获取dom对象的value值
        var name =document.getElementById("name").value;
        var w =document.getElementById("w").value;
        var h =document.getElementById("h").value;

        //字符串拼接
        var param = "name=" + name + "&w=" + w + "&h=" +h;
        //alert("param=" + param);
        xmlHttp.open("get","bmiAjax?" + param,true);
        //4、发起请求
        xmlHttp.send();
      }

    </script>
  </head>
  <body>
  <p>局部刷新ajax-计算bmi</p>
  <div>
    姓名：<input type="text" id="name"/><br/>
    体重（kg）：<input type="text" id="w"/><br/>
    身高（m）：<input type="text" id="h"/><br/>
    <input type="button" value="计算bmi" onclick="doAjax()">
  </div>
  <br/>
  <div id="mydata">
    等待加载数据...
  </div>
  </body>
</html>
