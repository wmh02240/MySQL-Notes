# 视图：简单来说，视图就是一条select语句执行之后返回的结果值,所以在创建视图的时候基本工作就落在这条SQL查询语句上.
# 视图是对若干张基本表的引用,它是一张虚表,是查询语句执行的结果,不存储具体的数据(基本表数据发生了改变视图也会跟着改变)
# 视图只用于查询数据,方便查询


use jingdong;

select * from goods as g left join goods_cates as c on g.cate_id = c.id left join goods_brands as b on g.brand_id = b.id;
select g.*, c.name, b.name from goods as g left join goods_cates as c on g.cate_id = c.id left join goods_brands as b on g.brand_id = b.id;

# 创建视图 目的是方便茶数据
# create view 视图名称(推荐以v开头) as SQL查询语句
create view v_goods_info as select g.*, c.name as cate_name, b.name as brand_name from goods as g left join goods_cates as c on g.cate_id = c.id left join goods_brand as b on g.brand_id = b.id;

show tables;

select * from v_goods_info limit 5;

update v_goods_info set name = "笔记本" where id = 5; #视图只能进行方便查询 不可用于增删改

#删除视图
# drop view  视图名


# 视图的作用:
# 1.提高了重用性,就像一个函数
# 2.对数据库重构,却不影响程序的运行
# 3.提高了安全性能,可以对不同用户
# 4.让数据更加清晰
