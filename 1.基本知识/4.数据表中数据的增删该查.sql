# 数据表中数据的增删该查(C Create U Update R Retrieve D Delete)

    # 增加
        insert into classes values (0, "菜鸟班");  #枚举类型插入式可以相当于一个从1开始的列表

        #部分插入
        insert into studuent (name, gender) values ("小桥", 2);

        #多行插入
        insert into studuent (name, gender) values ("小桥", 2), ("大桥", 2);

    # 删除
        #物理删除(不推荐)
            delete from 表名 where 条件;
            delete from studuent where id > 3;

        #逻辑删除
            #用一个字段表示该条信息是否可用,例如给studuent表添加一个字段is_delete
            alter table studuent add is_delete bit default 0;
            update studuent set is_delete = 1 where id = 11;

    # 修改
        update studuent set gender = 1 where id = 2;
        update studuent set gender = 1, name = "西施" where id = 2;


    # 查询(重点)
        select * from studuent;
        select * from studuent where id > 3;
        select id, name, age, gender from studuent where gender = 2;
        select id, name as 姓名, age as 年龄, gender as 性别 from studuent where gender = 2; #字段的顺序也是查询结果显示的顺序


# 数据库引擎 InnoDB(支持事务处理,外键与行级锁)