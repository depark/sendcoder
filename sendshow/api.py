import paramiko
from sendshow.models import *
from paramiko.ssh_exception import AuthenticationException,SSHException,NoValidConnectionsError
from socket import timeout

def run(command,server):
    se = Host.objects.get(ip=server)
    user = se.username
    password = se.password
    port = se.port
    print(command)
    try:
        t=paramiko.SSHClient()
        t.set_missing_host_key_policy(paramiko.AutoAddPolicy())
        t.connect(hostname=server,username=user,password=password,port=port,timeout=3)
        stdin, stdout, stderr = t.exec_command(command)
        out = stdout.read()
        err = stderr.read()
        if err:
            status = 1
            result = 'error!!!'+server + str(err)
        else:
            status = 0
            result = server+' success '
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



def Release(sername):
    re = 'bash /opt/software/test.sh '
    result = run(command=re+sername,server='192.168.1.27')
    return result


def restart_server(server):
    restart_app = '/usr/local/tomcat/bin/shutdown.sh;/usr/local/tomcat/bin/startup.sh'
    start_app = '/usr/local/tomcat/bin/startup.sh'
    restart_ser = 'pkill tmux; tmux new-session -d -s dubbo "java -jar /root/*.jar"'
    se = Host.objects.get(ip=server)
    print('type is '+str(se.type))
    #应用
    if se.type == 0:
        if se.status != 2:
            result = run(command=start_app,server=server)
        else:
            result = run(command=restart_app,server=server)
    else:
            result = run(command=restart_ser,server=server)

    return result



