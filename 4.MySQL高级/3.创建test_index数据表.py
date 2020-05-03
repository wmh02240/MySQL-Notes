from pymysql import connect


def main():
    #创建connection连接  连接对象
    conn = connect(host = "localhost", port = 3306, user = 'root', password = 'qwe123123', database = 'jingdong', charset = 'utf8')

    #获取Cursor对象  游标对象
    cs1 = conn.cursor()
    for i in range(100000):
        count = cs1.execute("insert into test_index values ('haha-%d')" % i)
    conn.commit()

    cs1.close()
    conn.close()

if __name__ == '__main__':
    main()