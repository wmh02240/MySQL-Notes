# limit start, count --直接限制查询出来的个数
# 带一个参数的LIMIT指定从查询结果的首行开始，唯一的参数表示返回的行数，即“LIMIT n”与“LIMIT 0,n”等价。带两个参数的LIMIT可以返回从任何一个位置开始的指定的行数。返回第一行时，位置偏移量是0。因此，“LIMIT 1, 1”将返回第二行，而不是第一行。
# MySQL 8.0中可以使用“LIMIT 4 OFFSET 3”，意思是获取从第5条记录开始后面的3条记录，和“LIMIT 4,3;”返回的结果相同。

    # 查询前五个数据
    select * from studuent limit 5;  # 只显示前两个
    select * from studuent order by age desc limit 5;

    # 限制查询的个数
    select * from studuent limit 7, 4;  # 开始第一个为0   规律：limit (第N页-1)*每页的个数, 每页的个数;
#         +----+--------+------+--------+--------+--------+-----------+
#         | id | name   | age  | height | gender | cls_id | is_delete |
#         +----+--------+------+--------+--------+--------+-----------+
#         |  9 | 小一   |   10 | 188.00 | 女     |      9 |           |
#         | 10 | 小二   |   15 | 182.00 | 中性   |      9 |           |
#         | 11 | 小三   |   18 | 184.00 | 女     |      6 |           |
#         | 12 | 小四   |   19 | 185.00 | 保密   |      4 |           |
#         +----+--------+------+--------+--------+--------+-----------+
#         4 rows in set (0.00 sec)

    # 注意：limit必须放在最后。
    # 顺序为where order by limit
    select * from studuent where  gender = 2 order by height desc limit  0, 2