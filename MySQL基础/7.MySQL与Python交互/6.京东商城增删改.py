from pymysql import *


# 增删改涉及到数据库的变更,查询不改变数据库

# pymysql中凡是涉及到数据库的增删改时,如果不输入commit,数据是不会插入表中,但是每次插入值之后（不提交）数据表的id字段(auto increament)还是增加的,通过show create table table名查看,目的是解决高并发
# 过程中的错误,实际应用中,数据库中值得插入属于高并发模式,哪个先抢到即先占领ID字段的值,防止后面多个插入进行提交之后造成的混乱错误.
# 不管是增删改哪一种，只要commit之后数据开始生效.
# 如果数据插入错误,可以采用回滚rollback函数实现,前提是不提交,只要一提交数据就生效,注意的是如果进行增删改操作,但是发现数据有误就不提交,且进行了rollback,如果再进行新的增删改操作并
# commit提交,因之前进行的错误增删改操作而造成的id字段增长不会倒回去,只能在之前的基础上继续增长.

class JD(object):
    def __init__(self):
        # 创建connection连接  连接对象
        self.conn = connect(host="localhost", port=3306, user='root', password='qwe123123', database='jingdong', charset='utf8')
        # 获取Cursor对象  游标对象
        self.cursor = self.conn.cursor()

    def __del__(self):
        # 关闭cursor对象
        self.cursor.close()
        self.conn.close()

    def execute_sql(self, sql):
        self.cursor.execute(sql)
        for temp in self.cursor.fetchall():
            print(temp)

    def show_all_items(self):
        sql = "select * from goods;"
        self.execute_sql(sql)

    def show_cates(self):
        sql = "select name from goods_cates;"
        self.execute_sql(sql)

    def show_brands(self):
        sql = "select name from goods_brand;"
        self.execute_sql(sql)

    def add_brands(self):
        item_name = input("输入新商品名称:")
        # sql = """inseart into good_brand (name) values ("%s") % item_name"""
        sql = "insert into goods_brand (name) values ('%s')" % item_name
        self.cursor.execute(sql)
        self.conn.commit()  #确定提交
        # self.conn.rollback() #回滚

    @staticmethod    #实例方法  不需要self
    def print_menu():
        print("--------------------京东--------------------")
        print("1:所有的商品")
        print("2:所有的商品分类")
        print("3:所有的商品品牌分类")
        print("4:添加商品品牌")
        num = input("请输入对应功能序号:")
        return num

    def run(self):
        while True:
            num = self.print_menu()
            if num == "1":
                #调用所有商品
                self.show_all_items()
            elif num == "2":
                self.show_cates()
            elif num == "3":
                self.show_brands()
            elif num == "4":
                self.add_brands()
            else:
                print("输入有误,请重新输入!")


# 面向对象的优点：能封装的尽量封装,调用者很简单,嵌套调方法也很容易,这些基本的方法放进一个基类中,通过类的继承，可以重新写一些新的方法。
def main():
    #创建一个京东商城对象
    jd = JD()
    #调用这个对象的run方法
    jd.run()

if __name__ == "__main__":
    main()