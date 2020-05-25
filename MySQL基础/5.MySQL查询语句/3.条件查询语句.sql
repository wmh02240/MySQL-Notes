# 条件查询
    # 1. 比较运算符 > < >= <= !=
        # --select ... from 表名 where ...;
        select * from studuent where age > 18;  # 显示所有字段
        select name, gender, id from studuent where age > 18; # 显示选中的字段信息

    #2. 逻辑运算符
        # and
        # 18到28岁之间的学生信息
        select * from studuent where age > 18 and age < 28;

        select * from studuent where age > 18 and gender = "女";
        select * from studuent where age > 18 and gender = 2;

        # or
        select * from studuent where age > 18 or gender = 2;

        # not
        # 不在 18岁以上 并且是女性这个范围内的信息
        select * from studuent where not age > 18 or gender = 2;  # 仅仅对前一个条件起作用

        # 不在18岁以上的女性的这个范围内的信息
        select * from studuent where not (age > 18 or gender = 2); # not对后面和括号内的都起作用

        # 年龄不是小于或者等于18 并且是女性
        select * from studuent where not ( age < 18 or age = 18) and gender = 2;
        select * from studuent where not age <=18 and gender = 2;

    #3. 模糊查询（进行匹配 所以效率低）
        # like
            -- % 替换零个或者多个
            -- _ 替换一个

            # eg:查询姓名以小开头的信息
                select * from studuent where name like "小%";
                # 查询姓名当中有小的名字
                select * from studuent where name like "%小%";

            # eg:查询有两个字的名字
                select * from studuent where name like "小_";

            # eg:查询两个字以上的名字数据信息
                select * from studuent where name like "__%";

        # rlike (正则表达式)
            # 查询以小开始的信息
            select * from studuent where name rlike "^小.*";

            # 查询已小开始 九结束的信息
            select * from studuent where name rlike "^小*九$"
            select * from studuent where name regexp "^小*九$"

            select * from studuent where name regexp "一"



