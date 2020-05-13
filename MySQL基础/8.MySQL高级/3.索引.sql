# 索引是一种特殊的文件(InnoDB数据表上的索引是表空间的一个重要组成部分),它们包含着对数据表里所有记录的引用指针.加快数据库的查询速度

create table test_index(title varchar(10));

select count(*) from test_index;

# 开始运行时间监测
set profiling = 1;
select * from test_index where title = 'haha-99999';

# 查看执行时间
show profiles;

# 为表test_index的title字段创建索引title_index
create index title_index on test_index(title(10));

# 执行查询语句
select * from test_index where title = 'haha-99999';

show profiles;

#查看索引
show index from test_index;
show index  from goods;

# 创建索引
#     如果指定字段是字符串 需要指定长度 建议长度和创建字段的数据长度一致
#     字段类型如果不是字符串 可以不填写长度
#     create index 索引名称 on 表名(字段名称(长度))

# 删除索引
#     drop index 索引名称 on 表名;