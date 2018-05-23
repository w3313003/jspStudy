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
-- 删除多条数据
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
--
SELECT * FROM user GROUP BY username;
-- group by 分组() 聚合函数
  SELECT type, SUM(user.count) as totalCount FROM user GROUP BY type;

-- 增加列
ALTER TABLE goods ADD COLUMN `desc` VARCHAR DEFAULT NULL AFTER myphone;