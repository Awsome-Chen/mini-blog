<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{{!article["article_name"]}}</title>
    <link rel="stylesheet" href="../static/css/bulma.min.css">
    <style>
      @font-face{
        font-family: 'kai';
        src: url('../static/fonts/求福.ttf');
      }
      * {
        font-family: 'Times New Roman', Times, serif;
      }
      li {
        color: hsl(217, 71%, 53%);
      }
      strong{
        font-family: 'kai';
        font-size: x-large;
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
              <div class="block">
                <b class="title">{{article["article_name"]}}</b>
              </div>
              <div class="block">
                {{!article["content"]}}
              </div>
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
            <h3><i>留言</i></h3>
            <p>{{article["message"]}}</p>
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