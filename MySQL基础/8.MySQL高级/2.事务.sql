# 所谓事务，即一个操作序列,即这些操作要么都执行 要么都不执行 是一个不可分割的工作单元.


# 开启事务
begin;
# 或者
start transaction


# python中默认已经开启了事务,必须commit之后数据才可以提交

# mysql命令行工具执行完语句之后自动进行了commit,但是一旦开启了事务,不提交,数据就不会写入数据库,同时该条记录处于上锁状态,其他用户此时对这条记录进行操作的话会处于等待状态,
# 必须进行提交之后另一个用户才可以对此字段进行操作,这也是隔离性的体现,保证数据的安全.


# 原子性:保证了操作要么成功,要么不成功.
# 一致性:保证了数据在commit之前不会因为系统等其他外部因素造成数据错误
# 隔离性:一个SQL语句的执行不会影响另一个SQL语句的执行.
# 持久性:一旦事务提交,则会永久保存在数据库中.

