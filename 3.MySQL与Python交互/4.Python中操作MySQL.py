from pymysql import *


# pymysql操作数据库流程：开始-创建connection-获取cursor-mysql语句-关闭cursor-关闭connection-结束

def main():
    #创建connection连接  连接对象
    conn = connect(host = "localhost", port = 3306, user = 'root', password = 'qwe123123', database = 'jingdong', charset = 'utf8')

    #获取Cursor对象  游标对象
    cs1 = conn.cursor()
    count = cs1.execute('select id, name from goods where id > 4')
    print("打印受影响的行数：", count)

    # print(cs1.fetchall())
    # print(cs1.fetchmany(2))
    for i in range(count):
        #获取查询的结果
        result = cs1.fetchone() #返回一个元组  fetchmany()和fetchall()返回的结果是元组套元组
        print(result)

    cs1.close()
    conn.close()

if __name__ == '__main__':
    main()
