create database jingdong char set = utf8;

use jingdong;

# 商品表
create table goods(
    id int unsigned primary key auto_increment not null,
    name varchar(150) not null,
    cate_name varchar(40) not null, #类别名
    brand_name varchar(50) not null, #品牌名
    price decimal(10,3) not null default 0,
    is_show bit not null default 1, #是否显示
    is_saleoff bit not null default 0 #是否售馨
);


# 订单表
create table orders(
    id int unsigned primary key  auto_increment not null ,
    order_data_time datetime not null ,
    customers_id int unsigned not null
);
# 设置外键
alter table orders add foreign key (customers_id) references customers(id);

# 顾客表
create table customers(
    id int unsigned primary key auto_increment not null ,
    name varchar(150) not null ,
    address varchar(150) not null ,
    tel varchar(20) not null ,
    passwd varchar(30) not null
);

# 订单详情表
create table order_detail(
    id int unsigned auto_increment primary key not null ,
    quality int unsigned not null ,
    order_id int unsigned not null ,
    good_id int unsigned not null
);
alter table order_detail add foreign key (order_id) references orders(id);
alter table order_detail add foreign key (good_id) references goods(id);

desc orders;

desc goods;

insert into goods values (0,'r510vc 15.6英寸笔记本','笔记本','华硕','3399',default,default),
                         (0,'y400n 14.0英寸笔记本电脑','笔记本','联想','4999',default,default),
                         (0,'g150th 15.6英寸笔记本','游戏本','雷神','8499',default,default),
                         (0,'x550cc 15.6英寸笔记本','笔记本','华硕','2799',default,default),
                         (0,'x240 超级本','超级本','联想','4880',default,default),
                         (0,'u330p 13.3英寸超级本','超级本','联想','4299',default,default),
                         (0,'svp13226scb 触控超级本','超级本','索尼','7999',default,default),
                         (0,'ipad mini 7.9英寸平板电脑','平板电脑','苹果','1998',default,default),
                         (0,'ipad air 9.7英寸平板电脑','平板电脑','苹果','3388',default,default),
                         (0,'ipad mini 配备retina显示屏','平板电脑','苹果','2788',default,default),
                         (0,'ideacentre c340 20英寸一体电脑','台式机','联想','3499',default,default),
                         (0,'vostro 3800-r1206 台式电脑','台式机','戴尔','2899',default,default),
                         (0,'imac me086ch/a 21.5英寸一体电脑','台式机','苹果','9188',default,default),
                         (0,'at7-7414lp 台式电脑 linux','台式机','苹果','3699',default,default),
                         (0,'z220sff f4f06pa工作站','服务器/工作站','惠普','4288',default,default),
                         (0,'powereedge ii服务器','服务器/工作站','戴尔','5388',default,default),
                         (0,'mac pro专业级台式电脑','服务器/工作站','苹果','28888',default,default),
                         (0,'hmz-t3w 头戴显示设备','笔记本配件','索尼','6999',default,default),
                         (0,'商务双肩背包','笔记本配件','索尼','99',default,default),
                         (0,'x3250 m4机架式服务器','服务器/工作站','ibm','6888',default,default),
                         (0,'商务双肩背包','笔记本配件','索尼','99',default,default);

select * from goods;

select * from goods where cate_name="超级本";

select * from goods where price < 3000;

# 显示种类
select distinct cate_name from goods;
# select distinct  cate_id from goods;
select cate_name from goods group by cate_name;


select cate_name, group_concat(name) from goods group by cate_name;

select round(avg(price), 4) from goods;


select cate_name, avg(price) from jingdong.goods group by cate_name;
select cate_name, avg(price), min(price), max(price), count(*), group_concat(name) from jingdong.goods group by cate_name;

# 查询所有价格大于平均价格的商品，并且按照降序排列
# 思路
select round(avg(price), 4) from goods;
select id, name, price from goods where price > 5570.5741;
select id, name, price from goods where price > (select round(avg(price), 4) from goods) order by price desc;


# 查询每种类型电脑中最贵的电脑信息
select cate_name, max(price), group_concat(cate_name, " ", name), count(*) from goods group by cate_name;  #说明：进行分组的时候使用group by,前面的select查询的信息必须要有进行分组的字段依据.
select * from goods group by cate_name;  #错误

#思路
select * from goods
    inner join
    (select cate_name, min(price) as min_price, max(price) as max_price, avg(price) as avg_price, count(*) from goods group by cate_name) as goods_new_info
    on goods.cate_name = goods_new_info.cate_name and goods.price = goods_new_info.max_price;

#左连接查询
select * from (select cate_name, max(price) as max_price from goods group by cate_name) as new_goods_info
    left join goods on new_goods_info.cate_name = goods.cate_name and new_goods_info.max_price = goods.price;

select * from (select cate_name, max(price) as max_price from goods group by cate_name) as new_goods_info
    right join goods on new_goods_info.cate_name = goods.cate_name and new_goods_info.max_price = goods.price;
