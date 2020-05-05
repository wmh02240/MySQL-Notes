# 排序
    # order by 字段
    # asc 从小到达排序 即升序
    # desc 从大到小排序 即将序
    # 在排序过程中遇到相同值时会按照主键进行排序

    # 查询年龄到18～34之间的男性，按照年龄从小到达排序
    select * from studuent where (age between 12 and 23) and gender = 1 order by age desc;


    # order by 多个字段
    select * from studuent where (age between 12 and 23) and gender = 1 order by age desc, gender desc, height desc; # 在年龄相同的情况下按照性别按照升序的方式排序,如果前面排序字段都不相同则后面的字段不执行
    