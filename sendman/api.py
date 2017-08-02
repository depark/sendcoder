




def gen_resource(obj):
    res = []
    for asset in obj:
        info = {'hostname': asset.hostname,
                'ip': asset.ip,
                'port': asset.port,
                'username': asset.username,
                'password':asset.password,
                # 'password': CRYPTOR.decrypt(role.password)
                }
        res.append(info)
    return res