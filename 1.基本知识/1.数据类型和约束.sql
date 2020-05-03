# 数据类型  详见：https://blog.csdn.net/anxpp/article/details/51284106
    # 使用原则：够用就行,节省空间
    # 常用数据类型：
    #     整型：int bit
    #     小数：decimal    decimal(5,2)表示共存5位数,小数位占2位
    #     字符串：varchar char  varchar表示可变长字符串     char表示不变字符串例如char(3) 如果为'ab'则为‘ab ’
    #     字符串text：表示存储大字符串，当字符串大于4000时推荐使用
    #     日期类型：data time datatime
    #     枚举类型：enum
    #     对于图像、视频、音频文件一般存储于服务器上,然后在表中存储文件的路径

# 约束
    # 主键：primary key :物理上存储的顺序
    # 非空：not null
    # 唯一：unique:此字段的值不能重复
    # 默认：default
    # 外键：foreign key  外健是指存储一个表主键值的字段  能起到一定的约束作用  但是不是外键越多越好  会降低查询效率