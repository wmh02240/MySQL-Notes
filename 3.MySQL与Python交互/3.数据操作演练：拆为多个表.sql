#一个表不方便管理
# 十分注意：通过另一个表的字段来存储一个表的主键的时候，两个字段的数据类型必须相同


# 创建goods_cates表并直接插入值
create table if not exists goods_cates(
    id int unsigned primary key auto_increment not null,
    name varchar(50) not null
)select cate_name as name from goods group by cate_name;

#间接插入值
insert into goods_cates (name) select cate_name from goods group by cate_name; #为指定字段插入值

select * from goods_cates;
# 同步表数据 通过goods_cate表来更新goods表
# 十分注意：通过另一个表的字段来存储一个表的主键的时候，两个字段的数据类型必须相同

select * from goods as g inner join goods_cates as c on g.cate_name = c.name;
update goods as g inner join goods_cates as c on g.cate_name = c.name set g.cate_name = c.id;

#增加产品类型
insert into goods_cates (name) values ('路由器'),('交换机'),('网卡');

select * from goods;
select * from goods_cates;


desc goods;
desc goods_cates;

alter table goods change cate_name cate_id int unsigned not null; #change表示重命名改动

# 给goods表cate_id 字段添加外健进行约束
alter table goods add foreign key (cate_id) references goods_cates(id);

# insert into goods (name, cate_id, brand_name, price) values ('LasterJet Pro P1606dn 黑白激光打印机', 12, 4, '1489');

# 创建商品品牌数据表  先查询紧接着插入  注意name值要一样
create table goods_brand(
    id int unsigned primary key not null auto_increment,
    name varchar(40) not null)select brand_name as name from goods group by brand_name;


select * from goods_brand;

# 同步数据
update goods as g inner join goods_brand as b on g.brand_name = b.name set g.brand_name = b.id;


desc goods;
# 修改表结构 g.brand_name与b.id字段的数据类型要一致
alter table goods change brand_name brand_id int unsigned not null;

# 可以同时修改多个字段
# alter table goods
# change brand_name brand_id int unsigned not null,
# change cate_name cate_id int unsigned not null;

# 设置外健
alter table goods add foreign key (brand_id) references goods_brand(id);

show create table goods;
# 在实际开发中很少使用外健  外健的使用会极大降低数据库的更新的效率  可以禁止使用外健  真正开发过程中约束可以通过语法逻辑进行控制

# 取消外健 首先获取外键约束的名称  通过show create table goods;来获取 然后通过获取的名称来删除外健  外健名称在show create table goods;生成的语句里面
alter table goods drop foreign key goods_ibfk_2;

select * from goods as g left join goods_cates as c on g.cate_id=c.id left join goods_brand as b on g.brand_id=b.id;
select g.*, c.name as cate_name, b.name as brand_name from goods as g left join goods_cates as c on g.cate_id=c.id left join goods_brand as b on g.brand_id=b.id order by price;

select * from goods;