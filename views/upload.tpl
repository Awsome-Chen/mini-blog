<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>上传文章</title>
  <link rel="stylesheet" href="../static/css/bulma.min.css">
  <script src="../static/js/jquery-3.6.1.min.js"></script>

<body>
  <section class="section">
<div class="container">
    <div class="columns">
      <div class="column is-2"></div>
      <div class="column is-8">
        <div class="block">
          <p class="title">上传文章</p>
          <div class="block">
            <input class="input" type="text" placeholder="输入文章标题" id="name">
          </div>
          <div class="block">
            <textarea class="textarea" placeholder="输入文章内容" rows="20" id="content"></textarea>
          </div>
          <div class="block">
            <textarea class="textarea" placeholder="输入我的留言" rows="2" id="messgae"></textarea>
          </div>
        </div>
        <div class="block">
          <button class="button is-primary" onclick="upload()">提交文章</button>
        </div>
      </div>
      
      <div class="column is-2"></div>
    </div>
  </div>
  </section>
  <script>
      function upload(){
        name = $("#name").val();
        content = $("#content").val();
        message = $("#message").val();
        $.ajax({
          type: "POST",
          dataType: false,
          url: "/action" ,
          data: {"action":"upload","name":name,"content":content,"message":message},
          success: function (result) {
              alert("上传成功");
              $(window).attr("location","/edit");
          },
          error : function(error) {
              alert("上传失败");
          }
        });
      }
  </script>
</body>
</html>