import paramiko
from sendshow.models import *
from paramiko.ssh_exception import AuthenticationException,SSHException,NoValidConnectionsError
from socket import timeout
from time import sleep
import sys


def run(command,server):
    try:
        se = Host.objects.get(ip=server)
    except Host.DoesNotExist as e:
        data = {'status': 1, 'result': '无法获取 {0} 用户名和密码'.format(server)}
        return data
        sys.exit()
    user = se.username
    password = se.password
    port = se.port
    print(command)
    try:
        t=paramiko.SSHClient()
        t.set_missing_host_key_policy(paramiko.AutoAddPolicy())
        t.connect(hostname=server,username=user,password=password,port=port,timeout=3)
        stdin, stdout, stderr = t.exec_command(command,get_pty=False)
        out = stdout.read()
        err = stderr.read()
        status = 0
        if err:
            result = server+' success  Warning  '+str(err)
        else:
            result = server+' success'
    except SSHException as e:
        status = 1
        result = server+' 用户名或密码错误'
    except AuthenticationException as e:
        status = 1
        result = server + ' 用户名或密码错误'
    except timeout as e:
        status = 1
        result = server + ' 连接超时'
    except NoValidConnectionsError as e:
        status = 1
        result = server + ' 端口错误'
    data = {'status':status,'result':result}
    return data


#发布
def Release(sername):
    re = 'bash /home/ssic/saas2017-4-1/bushu.sh '
    #re = 'bash /opt/software/test.sh '
    print(re+sername)
    result = run(command=re+sername,server='172.16.1.242')
    return result

#重启应用
def restart_server(server):
    #/usr/local/tomcat7/bin/shutdown.sh
    restart_app = 'pkill -9 java;/usr/local/tomcat7/bin/startup.sh'
    start_app = '/usr/local/tomcat7/bin/startup.sh'
    restart_ser = 'pkill tmux; tmux new-session -d -s dubbo "java -jar /root/*.jar"'
    se = Host.objects.get(ip=server)
    #应用
    if se.type == 0:
        if se.status != 2:
            result = run(command=start_app,server=server)
        else:
            result = run(command=restart_app,server=server)
    else:
            result = run(command=restart_ser,server=server)

    return result



