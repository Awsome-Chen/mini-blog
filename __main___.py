from bottle import run,get,post,install,static_file,template,request
from bottle_sqlite import SQLitePlugin
from markdown import markdown

plugin = SQLitePlugin(dbfile="tmp/articles.db")
install(plugin)

@get("/article/<id:int>")
def article(db,id):
    fetch = db.execute("SELECT NAME,CONTENT,MESSAGE FROM ARTICLES WHERE ID = ?;",(id,)).fetchone()
    article_name = fetch[0]
    md_content = fetch[1]
    html_content = markdown(md_content)
    message = fetch[2]
    article = {"content":html_content,"article_name":article_name,"message":message}
    return template("content.tpl",article=article)

@get("/static/<path:path>")
def static(path):
    return static_file(path,root="static")

@get("/")
def index(db):
    fetch = db.execute("SELECT ID,NAME FROM ARTICLES;").fetchall()
    articles = []
    for article in fetch:
        article_id = article[0]
        article_name = article[1]
        _article = {"name":article_name,"id":article_id}
        articles.append(_article)
    return template("index.tpl",articles=articles)

@get("/edit")
def edit(db):
    fetch = db.execute("SELECT ID,NAME FROM ARTICLES;").fetchall()
    articles = []
    for article in fetch:
        article_id = article[0]
        article_name = article[1]
        _article = {"name":article_name,"id":article_id}
        articles.append(_article)
    return template("articles.tpl",articles=articles)

@get("/edit/<id:int>")
def edit_article(db,id):
    fetch = db.execute("SELECT NAME,CONTENT,MESSAGE FROM ARTICLES WHERE ID = ?;",(id,)).fetchone()
    article_name = fetch[0]
    md_content = fetch[1]
    message = fetch[2]
    article = {"content":md_content,"article_name":article_name,"message":message}
    return template("edit.tpl",article=article)

@post("/action")
def action(db):
    _action = request.forms.action
    id = request.forms.id
    match _action:
        case "delete":
            db.execute("DELETE FROM ARTICLES WHERE ID=?;",(id,))
        case "edit":
            name = request.forms.name
            content = request.forms.content
            message = request.forms.message
            db.execute("UPDATE ARTICLES SET NAME=?,CONTENT=?,MESSAGE=? WHERE ID=?;",(name,content,message,id))
        case "upload":
            name = request.forms.name
            content = request.forms.content
            message = request.forms.message
            db.execute("INSERT INTO ARTICLES(NAME,CONTENT,MESSAGE) VALUES(?,?,?)",(name,content,message))

@get("/upload")
def add_article(db):
    return template("upload.tpl")

run(port=80,debug=True,host="0.0.0.0")