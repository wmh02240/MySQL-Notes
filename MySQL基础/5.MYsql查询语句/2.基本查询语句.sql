# 查询
    # 查询所有字段
    select * from studuent;

    # 查询指定字段
    select id, name from studuent;

    # 使用as给字段起别名
    select name as 姓名, age as 年龄 from studuent;

    # select 表明.字段 ..... from 表名;
    select studuent.name, studuent.age from studuent;

    # 可以通过as给表其别名
    # select 别名.字段 .... from 表名 as 别名;
    select studuent.name, studuent.age from studuent;
    select s.name, s.age from studuent as s;

    # 消除重复行
    # distinct 字段
    select distinct gender from studuent;

    