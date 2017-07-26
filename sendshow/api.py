import paramiko
from sendshow.models import *
from paramiko.ssh_exception import AuthenticationException,SSHException


def run(t,command):
    stdin, stdout, stderr = t.exec_command(command)
    err = stderr.read()
    if len(err) > 0:
        result = '重启失败' + str(err)
    else:
        result = '重启成功'

    return result



def restart_server(server):
    restart_app = '/usr/local/tomcat/bin/shutdown.sh;/usr/local/tomcat/bin/startup.sh'
    restart_ser = 'pkill tmux; tmux new-session -d -s dubbo "java -jar /root/*.jar"'
    se = Host.objects.get(ip=server)
    user = se.username
    password = se.password
    port = se.port
    try:
        t=paramiko.SSHClient()
        t.set_missing_host_key_policy(paramiko.AutoAddPolicy())
        t.connect(hostname=server,username=user,password=password,port=port)
        #应用
        if se.type == 0:
            result = run(t=t,command=restart_app)
        else:
            result = run(t=t,command=restart_ser)
    except AuthenticationException as e:
        result = '错误用户名/密码'
    except SSHException as e:
        result = '错误用户名/密码'
    return result



