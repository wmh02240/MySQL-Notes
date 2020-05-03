# 登陆数据库
#     mysql -uroot -p我的密码;

# 退出数据库
    # exit/quit/ctrl+d

# 显示时间
    select now();
# 显示版本
    select version();

# 创建数据库
    create database python_test char set = utf8;

# 查看创建数据库的语句
    show create database python_test;

# 删除数据库
    drop database python_test;

# 使用数据库
    use python_test;

# 查看当前使用数据库
    select database();


