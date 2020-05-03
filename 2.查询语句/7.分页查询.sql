# limit start, count --直接限制查询出来的个数
    # 查询前五个数据
    select * from studuent limit 21;  # 只显示前两个
    select * from studuent order by age desc limit 5;
    # 限制查询的个数
    select * from studuent limit 16, 4;  # 从第八个开始， 开始第一个为0   规律：limit (第N页-1)*每页的个数, 每页的个数;
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