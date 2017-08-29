import os,django,time
os.environ['DJANGO_SETTINGS_MODULE'] = 'sendcoder.settings'
django.setup()
import django.conf
import django.contrib.auth
import django.core.handlers.wsgi
from django.core.wsgi import get_wsgi_application
import django.db
from sendshow.models import *
from sendmo.api import *

import tornado.httpserver
import tornado.ioloop
import tornado.web
import tornado.wsgi
import tornado.websocket
from datetime import datetime


def getlog(host):
    cmd = "tail -f /usr/local/tomcat2/logs/catalina.out"

    t = paramiko.SSHClient()
    t.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    t.connect(hostname=host.ip, username=host.username, password=host.password, port=host.port, timeout=3)
    stdin, stdout, stderr = t.exec_command(cmd)
    text = stdout.readline()
    return text
clients = []
class LogShow(tornado.websocket.WebSocketHandler):
    def open(self, *args, **kwargs):
        clients.append(self)
        self.id = self.get_argument('id','')
        print('start to open  '+self.id)

    def on_message(self, message):
        host = Host.objects.get(id=self.id)
        print(host)
        print(message)
        while True:

            if message.split() == 'exit':
                self.write_message('tuichu')
                break
            elif message.split() == 'start':
                sleep(3)
                text=getlog(host)
                print(text)
                TIME = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
                if text:
                        self.write_message(TIME+'  '+text)



    def on_close(self):
        clients.remove(self)
        self.close()
        print('websocket close')



if __name__ == '__main__':

    wsgi_app = tornado.wsgi.WSGIContainer(get_wsgi_application())

    setting = {
    #'cookie_secret': 'DFksdfsasdfkasdfFKwlwfsdfsa1204mx',
    'template_path': os.path.join(os.path.dirname(__file__), 'templates'),
    'static_path': os.path.join(os.path.dirname(__file__), 'static'),
    'debug': False,
}
    tornado_app = tornado.web.Application(
    [
        (r'/logshow/', LogShow),
        (r"/static/(.*)", tornado.web.StaticFileHandler,
         dict(path=os.path.join(os.path.dirname(__file__), "static"))),
        (r'.*', tornado.web.FallbackHandler, dict(fallback=wsgi_app)),
    ], **setting)

    server = tornado.httpserver.HTTPServer(tornado_app)
    server.listen(9000, address='0.0.0.0')
    tornado.ioloop.IOLoop.instance().start()