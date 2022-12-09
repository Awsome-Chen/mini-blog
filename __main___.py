from bottle import run,route,install,static_file,template,request
from bottle_sqlite import SQLitePlugin
from markdown import markdown

plugin = SQLitePlugin(dbfile="tmp/articles.db")
install(plugin)

@route("/article/<id:int>")
def article(db,id):
    fetch = db.execute("SELECT ARTICLE_NAME,CONTENT,MESSAGE,LABEL1,LABEL2,LABEL3,LABEL4,LABEL5 FROM ARTICLES WHERE ARTICLE_ID = ?;",(id,)).fetchone()
    article_name = fetch[0]
    md_content = fetch[1]
    html_content = markdown(md_content)
    message = fetch[2]
    labels = []
    for i in range(3,6):
        if fetch[i] != None:
            labels.append(fetch[i])
    article = {"content":html_content,"article_name":article_name,"message":message,"labels":labels}
    return template("content.tpl",article=article)

@route("/static/<path:path>")
def static(path):
    return static_file(path,root="static")

@route("/")
def index(db):
    fetch = db.execute("SELECT ARTICLE_ID,ARTICLE_NAME FROM ARTICLES;").fetchall()
    articles = []
    for article in fetch:
        article_id = article[0]
        article_name = article[1]
        _article = {"name":article_name,"id":article_id}
        articles.append(_article)
    return template("index.tpl",articles=articles)

@route("/post",method=["post"])
def post(db):
    content = request.forms["content"]
    article_name = request.forms["article_name"]
    message = request.forms["message"]
    label1 = request.forms["label1"]
    label2 = request.forms["label2"]
    label3 = request.forms["label3"]
    db.execute("INSERT INTO ARTICLES(CONTENT,ARTICLE_NAME,MESSAGE,LABEL1,LABEL2,LABEL3) VALUES(?,?,?,?,?,?)",(content,article_name,message,label1,label2,label3))


run(port=80,debug=True,host="0.0.0.0")