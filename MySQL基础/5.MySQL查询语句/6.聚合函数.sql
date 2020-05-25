#聚合函数：一些普通的函数得出的一些结论，不允许与其他字段混合使用, 想要用就要使用分组, 分组和聚合函数一起使用
    # 求总数
        # count
        # 查询男性有多少人
        select count(name), avg(height) from studuent;
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
# GROUP BY关键字通常和集合函数一起使用，比如MAX()、MIN()、COUNT()、SUM()、AVG()。
# 例如，要返回每个水果供应商提供的水果种类，这时就要在分组过程中用到COUNT()函数，把数据分为多个逻辑组，并对每个组进行集合计算。

    # 按照性别分组，查询所有的性别
    select gender, count(gender) from studuent group by gender;   # 先分组，再从组内取数据

    # 计算每种性别的人数
    select gender, count(*) from studuent group by gender;  # count(*)表示对分组的计算个数  count(*)指从分组内计算个数

    desc studuent;
    # 按照性别分组
    select gender, count(gender), group_concat(name, ' ', id, ' ', height, ' ', cls_id) from studuent group by gender;

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
    #在MySQL中，可以在GROUP BY子句中使用GROUP_CONCAT()函数，将每个分组中各个字段的值显示出来。
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

    # where是对原表的数据进行判断
    # having表示对分组进行条件判断,是进行分组之后在判断
    # 查询平均年年龄超过18岁的性别以及姓名  hanving avg(age)>18
        select gender, group_concat(name) from studuent group by gender having avg(age)>8;
        select gender, group_concat(name), avg(age), count(*) from studuent group by gender having count(*) > 3;
        select gender, group_concat(name), avg(age) from studuent group by gender having avg(age) > 11;

    #在GROUP BY子句中使用WITH ROLLUP
    #使用WITH ROLLUP关键字之后，在所有查询出的分组记录之后增加一条记录，该记录计算查询出的所有记录的总和，即统计记录数量。
    select gender, group_concat(name), count(name) from studuent group by gender with rollup having avg(age)>8;
    #由结果可以看到，通过GROUP BY分组之后，在显示结果的最后面新添加了一行，该行Total列的值正好是上面所有数值之和。

# 多字段分组
# 使用GROUP BY可以对多个字段进行分组，GROUP BY关键字后面跟需要分组的字段，MySQL根据多字段的值来进行层次分组，分组层次从左到右，即先按第1个字段分组，
# 然后在第1个字段值相同的记录中再根据第2个字段的值进行分组，以此类推。

    select gender, cls_id, group_concat(name, ' ', cls_id) from studuent group by gender, cls_id;


# GROUP BY和ORDER BY一起使用
# 某些情况下需要对分组进行排序，在前面的介绍中，ORDER BY用来对查询的记录排序，如果和GROUP BY一起使用可以完成对分组的排序。
    select gender, group_concat(name, age, height) from studuent group by gender having avg(age)>8 order by count(height);
# GROUP BY子句按订单号对数据进行分组，SUM()函数便可以返回总的订单价格，HAVING子句对分组数据进行过滤，使得只返回总价格大于100的订单，最后使用ORDER BY子句排序输出。
# 当使用ROLLUP时，不能同时使用ORDER BY子句进行结果排序，即ROLLUP和ORDER BY是互相排斥的。