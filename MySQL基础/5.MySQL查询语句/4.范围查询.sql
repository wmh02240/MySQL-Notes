# in (1,3,8)表示在一个非连续的范围内
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
    # 查询年龄为18,34的人信息
    select name from studuent where age = 18 or age = 34;
    select name from studuent where age = 18 or age = 34 or age = 12;
    select name, age  from studuent where age in (12, 18, 34);

# not in不非连续的范围内
    # 不是年龄为18， 34的人信息
    select name, age from studuent where age not in (12, 18, 34);


# between ... and ...表示在什么范围之内  属于连续问题查询
    # 在什么范围
    select name, age from studuent where age between 12 and 34;

    # 不再范围
    select name, age from studuent where age not between 12 and 34;
    select name, age from studuent where not age between 12 and 34;       # not ... between ... and 是一种语法

    select name, age from studuent where age not (between 12 and 34);       # 语法错误


# 判断空 is null
    # 判断身高为空
    select name from studuent where age is null;

# 判断非空 is not null
    select name from studuent where age is not null;

