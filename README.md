### 项目简介

把[flask-realworld-example-app](https://github.com/gothinkster/flask-realworld-example-app)整个服务进行docker化

### 项目启动

docker-compose启动, 包括前后端, 数据库等:
```bash
docker-compose up
```

往数据库建表:
```bash
docker-compose exec backend bash
```

你应该可以看到类似这样的输出:  
```bash
root@4442b7e7c03b:/app# 
```

然后执行建表脚本:  
```bash
root@4442b7e7c03b:/app# flask db init
root@4442b7e7c03b:/app# flask db migrate
root@4442b7e7c03b:/app# flask db upgrade
```

### 代码修改
原项目有个bug:
[Fix unique constraint on userprofile.user_id #29](https://github.com/gothinkster/flask-realworld-example-app/pull/29)  
这里把这个bug fix了.

### 服务简介

- frontend, 前端项目: http://localhost
- db, Postgresql数据库, 初始化时新建数据库`conduit`, 当前设置用户名为`postgres`, 密码为`pwd`
- pgadmin, PostgreSQL的Web管理界面: http://localhost:5050, 当前设置用户名为`admin`, 密码为`pwd`. 连接数据库, `Host name/address`设为`db`, `Port`为`5432`, `Username`为`postgres`, `Password`为`pwd`
- backend, 后端项目: http://localhost/api/
- proxy, 反向代理、负载均衡, [traefik](https://docs.traefik.io/), Dashboard界面: http://localhost:8090/dashboard
