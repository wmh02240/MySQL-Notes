#聚合函数：一些普通的函数得出的一些结论，不允许与其他字段混合使用, 想要用就要使用分组, 分组和聚合函数一起使用
    # 求总数
        # count
        # 查询男性有多少人
        select * from studuent where gender = 1;
        select count(*) from studuent where gender = 1;
        select count(*) as 男性人数 from studuent where gender = 1;

    # 求最大值
        # max
        # 查询最大年龄
        select * from studuent;
        select max(age) as 最大值 from studuent;

    # 最小值
        # min 秋女性年龄最小值
        select min(age) as 最小值 from studuent where gender = 2;

    # 求和
        # sum
        # 求所有年龄总和
        select sum(age) as 和 from studuent;

    # 求平均值
        # avg
        select sum(age)/count(*) as 均值 from studuent;
        select avg(age) as 最大值 from studuent;

    # 四舍五入
        # round(123.232221133, 4)
        select round(avg(age), 2) as 四舍五入 from studuent;

        # 经验：语言里面小数是由误差的，例如银行当中，但是整数没有
        # 举例：3.14 我们乘以100变成整数。

# 分组  分组和聚合函数一起使用，否则分组就没啥意义
    # group by
    # 按照性别分组，查询所有的性别
    select gender from studuent group by gender;   # 先分组，再从组内取数据

    # 计算每种性别的人数
    select gender, count(*) from studuent group by gender;  # count(*)表示对分组的计算个数  count(*)指从分组内计算个数


    # 按照性别分组
    select gender, group_concat(name, id, height, cls_id) from studuent group by gender;

    # 计算男性的人数
    select gender, count(*) from studuent where gender = 1;
    select gender, count(*) from studuent where gender = 1 group by gender;
        +--------+----------+
        | gender | count(*) |
        +--------+----------+
        | 男     |        3 |
        +--------+----------+
        1 row in set (0.00 sec)

    # group_concat(...) 显示的内容
    select gender, group_concat(name, age, id), count(*) from studuent where gender = 1 group by gender;
        +--------+---------------------------------+----------+
        | gender | group_concat(name, age, id)     | count(*) |
        +--------+---------------------------------+----------+
        | 男     | 小黄172,十一1516,十二1817       |        3 |
        +--------+---------------------------------+----------+
        1 row in set (0.00 sec)

    select gender, group_concat(name, "_", age, " ", id), count(*) from studuent where gender = 1 group by gender;
        +--------+---------------------------------------+----------+
        | gender | group_concat(name, "_", age, " ", id) | count(*) |
        +--------+---------------------------------------+----------+
        | 男     | 小黄_17 2,十一_15 16,十二_18 17       |        3 |
        +--------+---------------------------------------+----------+
        1 row in set (0.00 sec)

    # hanving  where是对原表的数据进行判断
    # having表示对分组进行条件判断,是进行分组之后在判断
    # 查询平均年年龄超过18岁的性别以及姓名  hanving avg(age)>18
        select gender, group_concat(name), avg(age), count(*) from studuent group by gender having count(*) > 3;
        select gender, group_concat(name), avg(age) from studuent group by gender having avg(age) > 11;