<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>CHJ个人归档</title>
    <link rel="stylesheet" href="static/css/bulma.min.css">
    <script src="static/js/jquery-3.6.1.min.js"></script>
    <style>
      * {
        font-family: 'Times New Roman', Times, serif;
      }
    </style>
  </head>
  <body>

<section class="section">

  <div class="container is-max-desktop">
    <div class="container">
      <div class="columns">
        <div class="column is-8">
          <p class="title">CHJ个人归档</p>
        </div>
        <div class="column is-4">
          <div class="block">
            <input class="input" type="text" id="search">
          </div>
        </div>
    </div>
  </div>

  <div class="container">
    <div class="columns">
      <div class="column is-8">
        <p class="subtitle">
          所有内容
        </p>
        %for article in articles:
        <p class="article"><a href="article/{{article["id"]}}">{{article["name"]}}</a></p>
        %end
      </div>
      <div class="column is-4">
        <div class="notification">
          <b class="subtitle">Keenager</b>
          <a>chenhanjiang@stu.cqut.edu.cn</a>
          <p><i>在涅贵不缁，暖暖内含光。</i></p>
          <p>我在这里放了我的摘抄和一些思考。留给我自己和我的朋友。</p>
        </div>
      </div>
    </div>
  </div>
    
  </div>


</section>
  <script>
  $(document).ready(
      function(){
        $(document).keyup(function(){
          $(".article").show();
          $(".article").filter(
            function(){
             return !$(this).text().includes($("#search").val());
            }
          ).hide();
        });
        
      }
    );
  </script>
  </body>
</html>