<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>全部文章</title>
  <link rel="stylesheet" href="../static/css/bulma.min.css">
  <script src="../static/js/jquery-3.6.1.min.js"></script>

<body>
  <section class="section">
<div class="container">
    <div class="columns">
      <div class="column is-1"></div>
      <div class="column is-7">
        <div class="block">
          <p class="title">全部文章</p>
          <aside class="menu">
            <ul class="menu-list">
            %for article in articles:
              <li><a href="edit/{{article["id"]}}">{{article["name"]}}</a></li>
            %end
            </ul>
          </aside>
        </div>
      </div>
      
      <div class="column is-4">
        <a class="button is-info" href="../upload">添加文章</a>
      </div>
      </div>
    </div>
  </div>
  </section>
  <script>

  </script>
</body>
</html>