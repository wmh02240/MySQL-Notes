# SQL注入
# 此处商品名称输入为:'or 1=1 or '1时即可打印出所有数据
#                   'or 1=1 or'1或者 'or 1=1 or' 这里的两个单引号表示与'%s'的两个单引号进行配对 单引号双引号取决于input接受输入时的"%s"还是'%s'  select * from goods where name = ''or 1=1 or'1';
#                                                                                select * from goods where name = ""or 1=1 or "";

from pymysql import *


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

    def add_cates(self):
        cate_name = input("请输入商品名称:")
        sql = "insert into goods_cates (name) values ('%s')" % cate_name
        self.cursor.execute(sql)
        self.conn.commit()

    def add_brands(self):
        item_name = input("输入新商品品牌名称:")
        sql = "insert into goods_brand (name) values ('%s')" % item_name
        self.cursor.execute(sql)
        self.conn.commit()  #确定提交
        # self.conn.rollback() #回滚

    def get_info_by_name(self):
        find_name = input("请输入要查询的商品brand_id:")
        sql = """select * from goods where brand_id = '%s';""" % find_name
        print("——————————————>%s<-------------" % sql)
        self.execute_sql(sql)

    @staticmethod
    def print_menu():
        print("--------------------京东--------------------")
        print("1:所有的商品")
        print("2:所有的商品分类")
        print("3:所有的商品品牌分类")
        print("4:添加商品")
        print("5:添加商品品牌")
        print("6:根据名字查询一个商品")
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
                self.add_cates()

            elif num == "5":
                self.add_brands()

            elif num == "6":
                self.get_info_by_name()

            else:
                print("输入有误,请重新输入!")



def main():
    #创建一个京东商城对象
    jd = JD()
    #调用这个对象的run方法
    jd.run()

if __name__ == "__main__":
    main()

