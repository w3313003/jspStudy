-- DDL 是数据定义语言的缩写，简单来说，就是对数据库内部的对象进行创建、删除、修改的操作语言
-- 创建表
CREATE TABLE IF NOT EXISTS user (
  id int(11) NOT NULL AUTO_INCREMENT,
  username VARCHAR(45) DEFAULT NULL,
  phone VARCHAR(11) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB;

-- 删除表/数据库
DROP TABLE tablename ;
DROP DATABASE dbname;

-- 查看表信息
DESC tablename;
-- 查看表结构
SHOW CREATE TABLE tablename;
-- 修改表结构
ALTER TABLE tablename MODIFY `fileds` property;

-- （ADD|DROP|CHANGE|MODIFY）
-- 增加表字段
ALTER TABLE tablename ADD COLUMN `fileds` property [AFTER `otherFileds`];
-- 删除表字段
ALTER TABLE tablename DROP COLUMN `fileds`;
-- 表字段改名（属性）属性必须
ALTER TABLE tablename CHANGE COLUMN `oldname` `newname` proerty [FRIST|AFTER `otherFileds`]
-- 修改字段属性
ALTER TABLE tablename modify column count int(12) [FRIST|AFTER `otherFileds`];

-- 数据表改名
ALTER TABLE tablename rename newname;





-- DML: 是指对数据库中表记录的操作，主要包括表记录的插入（insert）、更新（update）,删除（delete）和查询（select)

-- 插入数据(可一次性插入多条记录)
INSERT INTO tablename (fileds, fileds, fileds) VALUES (value ,value ,value)(value ,value ,value)(value ,value ,value);

-- 更新数据
UPDATE tablename SET filed1=value1, field2.=value2 .... [WHERE CONDITION];/*eg: UPDATE goods SET count = 2 WHERE id = 1*/
-- 多表更新
UPDATE table1 a, table2 b, SET a.filed=x, b.filed=x WHERE a.pro=b.pro;
-- eg: UPDATE goods a, user b SET a.count=1, b.count=2 where a.myphone=b.phone;


-- 删除数据
DELETE FROM tablename [where condition];
-- 删除多表数据
DELETE a, b FROM user a, goods b WHERE a.count = b.count and a.count = 22;


-- 查询数据
-- 1.基础查询
  SELECT * / fileds FROM tablename;
-- 2. 查询不重复字段的记录
  SELECT DISTINCT fileds from tablename;
-- 3. 条件查询
  SELECT * / fileds FROM tablename WHERE CONDITION;
-- 4.排序和限制
  SELECT * FROM tablename [WHERE CONDITION] [ORDER BY filed [DESC|ASC], filed2 [DESC|ASC]] LIMIT[offset, row_count];
  /*
    默认为ASC（升序）可以指定多个排序字段，如果只有一个排序字段，则这些字段相同的记录将会无序排列
    所以可用其他排序字段继续排列
    offset默认为0；
  */
-- 5.聚合
  SELECT [filed....], fun_name() FROM tablename [WHERE CONDITION] [GROUP BY filed..... [WITH ROLLUP]] [HAVING WHERE_CONDITION]
  /*
    fun_name()聚合函数名 比如sum求和，count计数，max最大值， min最小值
    GROUP BY 表示进行聚合分类的字段
    WITH ROLLUP 是可选语法，表明是否对分类聚合后的结果进行再汇总
    HAVING 关键字表示对分类后的结果再进行条件的过滤。
    having 和where 的区别在于having 是对聚合后的结果进行条件的过滤，而where 是在聚
    合前就对记录进行过滤
   */
-- eg: SELECT type, SUM(user.count) as totalCount FROM user GROUP BY type ORDER BY count DESC;
-- group by 分组() 聚合函数 聚合出相同type数据的count总和
  SELECT type, SUM(user.count) as totalCount FROM user GROUP BY type  with rollup;
-- 6. 多表连接(连表查询)
/*
  表连接分为内连接和外连接，它们之间的最主要区别是內连接仅选出两张表中
  互相匹配的记录，而外连接会选出其他不匹配的记录。
 */
-- 内连接
  SELECT filed FROM table1 a, table2 b WHERE CONDITION;
-- 外连接 分为左连接和右连接
/*
  左连接：包含所有的左边表中的记录甚至是右边表中没有和它匹配的记录
  右连接：包含所有的右边表中的记录甚至是左边表中没有和它匹配的记录
 */
SELECT username, phone, `desc` FROM user a LEFT JOIN goods b ON a.phone = b.myphone;
SELECT username, phone, `desc` FROM user a RIGHT JOIN goods b ON a.phone = b.myphone;

-- 7. 子查询
/*
  当我们查询的时候，需要的条件是另外一个select 语句的结果。
  用于子查询的关键字主要包括in、not in、=、!=、exists、not exists
 */
SELECT * FROM tablename WHERE filed in(select filed from dept)

-- 8. 记录联合
-- 将两个表的数据按照一定的查询条件查询出来后，将结果合并到一起显示出来
-- UNION 和UNION ALL 的主要区别是UNION ALL 是把结果集直接合并在一起，而UNION 是将
-- UNION ALL 后的结果进行一次DISTINCT，去除重复记录后的结果。
  SELECT fields FROM table1 UNION SELECT fields FROM table2