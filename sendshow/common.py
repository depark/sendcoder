import paramiko,os
from stat import *


class remote():

    def __init__(self,host,username,password,port):
        self.host=host
        self.username = username
        self.password = password
        self.port = port

        n = paramiko.Transport((self.host,self.port))
        n.connect(username=self.username,password=self.password)
        self.sftp = paramiko.SFTPClient.from_transport(n)


    def connect(self):
        self.t=paramiko.SSHClient()
        self.t.set_missing_host_key_policy(paramiko.AutoAddPolicy())
        self.t.connect(hostname=self.host,username=self.username,password=self.password,port=self.port)

    def run(self,command):
        stdin,stdout,stderr = self.t.exec_command(command)
        out = stdout
        err = stderr
        if out:
            return stdout
        if err:
            return stderr

    def get_all_files(self,remote_dir):
        all_files = list()


        if remote_dir[-1] == '/':
            remote_dir = remote_dir[0:-1]

        files = self.sftp.listdir_attr(remote_dir)
        for x in files:

            filename = remote_dir + '/' + x.filename

            if S_ISDIR(x.st_mode):
                all_files.extend(self.get_all_files(filename))
            else:
                all_files.append(filename)
        return all_files

    def get_all_local_files(self,local_dir):
        local_files = []
        for root,file,files in os.walk(local_dir):
            for f in files:
                local_files.append(os.path.join(root,f))
        return local_files


    def put(self,localpath,remotepath):
        localfiles = self.get_all_local_files(localpath)
        for  x in localfiles:
            n=x.replace(localpath,remotepath).replace('\\','/')
            path = os.path.dirname(n)
            try:
                self.sftp.stat(path)
            except IOError as e:
                self.sftp.mkdir(path)
            self.sftp.put(x,n)


    def get(self,localpath,remotepath):
        remote_file = self.get_all_files(remotepath)
        for x in remote_file:
            a=x.replace(remotepath,localpath).replace('/','\\')
            path = os.path.dirname(a)
            if not os.path.exists(path):
                os.makedirs(path)
            self.sftp.get(x,a)
