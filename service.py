import os
os.environ['DJANGO_SETTINGS_MODULE'] = 'sendcoder.settings'
import django.conf
import django.contrib.auth
import django.core.handlers.wsgi
from django.core.wsgi import get_wsgi_application
import django.db


import tornado.httpserver
import tornado.ioloop
import tornado.web
import tornado.wsgi
import tornado.websocket




class LogShow(tornado.websocket.WebSocketHandler):
    def open(self, *args, **kwargs):
        print('start to open')
    def on_message(self, message):
        print(message)
        self.write_message('logs....')
    def on_close(self):
        pass







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
    server.listen(9000, address='10.10.11.19')
    tornado.ioloop.IOLoop.instance().start()