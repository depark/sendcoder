import paramiko
from sendshow.models import *
from paramiko.ssh_exception import AuthenticationException,SSHException,NoValidConnectionsError
from socket import timeout
from time import sleep
import sys,os
import configparser
from sendcoder.settings import BASE_DIR
from sendshow.common import *
import threading


conf = configparser.ConfigParser()
conf.read(os.path.join(BASE_DIR,'config.conf'))
localpath = 'f:\\saas\\'
coderemotepath = '/root/saaS/'
sendremotepath = '/home/ssic/saas2017-4-1/saaS/'





def transport(server):
    localfile = localpath+server
    code = coderemotepath+server
    send = sendremotepath+server
    h = Host.objects.get(ip='172.16.1.242')
    t_put = remote(host='172.16.1.242',username=h.username,password=h.password,port=h.port)
    t_get = remote(host='192.168.1.193',username='root',password='123456',port=22)

    #全部发布
    if server == 'all':
        print('start to transfer '+coderemotepath+'>>>>'+localpath)
        t_get.get(localpath=localpath, remotepath=coderemotepath)


        print('start to transfer '+localpath+'>>>>'+sendremotepath)
        t_put.put(localpath=localpath,remotepath=sendremotepath)
    else:
        #发布应用
        print(code + '>>>>' + localfile)
        t_get.get(localpath=localfile,remotepath=code)

        print(localfile+' >>>>>'+send)
        t_put.put(localpath=localfile,remotepath=send)

    print(server+'  代码上传成功')

#执行命令
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
    #print(command)
    try:
        t=paramiko.SSHClient()
        t.set_missing_host_key_policy(paramiko.AutoAddPolicy())
        t.connect(hostname=server,username=user,password=password,port=port,timeout=3)
        stdin, stdout, stderr = t.exec_command(command,get_pty=False)
        out = stdout.readlines()
        err = stderr.readlines()
        status = 0
        if err:
            result = err
            print(result)
        else:
            result = out
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
    print('start to handle '+sername)
    transport(sername)
    print('开始执行部署脚本')
    result = run(command=re+sername,server='172.16.1.242')
    if result['status'] == 0:
        print('部署脚本执行成功')
    else:
        print('部署失败  '+result['result'])
    #result = {'status':0,'result':'ok'}
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



