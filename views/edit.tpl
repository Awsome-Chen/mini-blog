<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>编辑文章</title>
  <link rel="stylesheet" href="../static/css/bulma.min.css">
  <script src="../static/js/jquery-3.6.1.min.js"></script>

<body>
  <section class="section">
<div class="container">
    <div class="columns">
      <div class="column is-2"></div>
      <div class="column is-8">
        <div class="block">
          <p class="title">编辑文章</p>
          <div class="block">
            <input class="input" type="text" placeholder="输入文章标题" value="{{article["article_name"]}}" id="name">
          </div>
          <div class="block">
            <textarea class="textarea" placeholder="输入文章内容" rows="25" id="content">{{!article["content"]}}</textarea>
          </div>
          <div class="block">
            <textarea class="textarea" placeholder="输入我的留言" rows="2" id="message">{{article["message"]}}</textarea>
          </div>
        </div>
        <div class="block">
          <button class="button is-info" onclick="edit()">提交修改</button>
          <button class="button is-danger" onclick="_delete()">删除文章</button>
        </div>
      </div>
      
      <div class="column is-2"></div>
    </div>
  </div>
  </section>
  <script>
    url = window.location.pathname.split("/");
    id = url[url.length-1];
    function _delete(){
        $.ajax({
          type: "POST",
          dataType: false,
          url: "/action" ,
          data: {"action":"delete","id":id},
          success: function (result) {
              alert("删除成功");
              $(window).attr("location","/edit");
          },
          error : function(error) {
              alert("删除失败");
          }
        });
    }

    function edit(){
        name = $("#name").val();
        content = $("#content").val();
        message = $("#message").val();
        $.ajax({
          type: "POST",
          dataType: false,
          url: "/action" ,
          data: {"action":"edit","id":id,"name":name,"content":content,"message":message},
          success: function (result) {
              alert("编辑操作执行成功");
              $(window).attr("location","/edit");
          },
          error : function(error) {
              alert("编辑失败");
          }
        });
      }

  </script>
</body>
</html>