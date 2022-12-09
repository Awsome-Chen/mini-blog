<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{{!article["article_name"]}}</title>
    <link rel="stylesheet" href="../static/css/bulma.min.css">
    <style>
      * {
        font-family: 'Times New Roman', Times, serif;
      }
      li {
        color: hsl(217, 71%, 53%);
      }
    </style>
  </head>
<body>
  <section class="section">
    <div class="container">
      <div class="columns">
      <div class="column is-8">
        <div class="columns">
          <div class="column is-1">
            <a href="/">主页</a>
          </div>
          <div class="column is-11">
            <div class="container">
              <div class="content">
                <b class="title">{{article["article_name"]}}</b>
                {{!article["content"]}}
              </div>
            </div>
          </div>

        </div>
      </div>
      <div class="column is-4">
        <div class="columns">
          <div class="column is-4">
          </div>
          <div class="column is-8">
            <div class="content">
            <h3><i>标签</i></h3>
            <ul>
            %for label in article["labels"]:
              <li>{{label}}</li>
            %end
            </ul>
            <h3><i>留言</i></h3>
            <p>{{article["message"]}}<br><i>留言引注</i></p>
            </div>
        </div>
      </div>
      <div class="column is-6">
      </div>
    </div>
      </div>
    </div>
  </section>
  </body>
</html>