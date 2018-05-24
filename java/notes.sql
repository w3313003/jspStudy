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
  SELECT fields FROM table1 UNION SELECT fields FROM table2;


-- DCL 语句   DCL 语句主要是DBA 用来管理系统中的对象权限时所使用

/*
  ·整数类型·                     字节                           最小值                                 最大值
    TINYINT                       1                           有符号-128，无符号0                      127/255
    SMALLINT                      2                            -32768/0                               32767/65535
    MEDIUMINT                     3                           -8388608 / 0                            8388607 / 1677215
    INT(INTEGER)                  4                           -2147483648 / 0                         2147483647 / 4294967295
    BIGINT                        8                           -9223372036854775808/0                  9223372036854775807/18446744073709551615
  ·浮点数类型·
    FLOAT                         4                            ±1.175494351E-38                       ±3.402823466E+38
    DOUBLE                        8                            ±2.2250738585072014E-308               ±1.7976931348623157E+308
  ·定点数类型·
  DECIMAL(m,d)                  M+2                                 最大取值范围与DOUBLE 相同，给定DECIMAL 的有效取值范围由M 和D决定
    DEC                                                               M，表示的是数据的长度(整数位)。 D，表示的是小数点后的长度（小数位）
                                                                      eg:将类型为DECIMAL(6，2)的3.1415插入数据库 显示结果为：3.14
  ·位类型·
    BIT                              1~8                              BIT(1)                                   BIT(64)


整数类型描述符:
  zerofill(填充0)
  UNSINGED(无符号)
  AUTO_INCREMENT (自动递增)
 */


/*
  日期和时间类型                     字节                            最小值                                   最大值
    DATE                              4                             1000-01-01                               9999-12-31
    DATETIME                          8                           1000-01-01 00:00:00                       9999-12-31 23:59:59
    TIMESTAMP                         4                           19700101080001                             2038 年的某个时刻
    TIME                              3                             -838:59:59                               838:59:59
    YEAR                              1                             1901                                        2155
  如果要用来表示年月日，通常用DATE 来表示。
  如果要用来表示年月日时分秒，通常用DATETIME 表示。
  如果只用来表示时分秒，通常用TIME 来表示。
  如果需要经常插入或者更新日期为当前系统时间，则通常使用TIMESTAMP 来表示。TIMESTAMP 值返回后显示为“YYYY-MM-DD HH:MM:SS”格式的字符串，显示宽度固定
  为19 个字符。如果想要获得数字值，应在TIMESTAMP列添加+0
  如果只是表示年份，可以用YEAR 来表示，它比DATE 占用更少的空间
 */
/*
  字符串类型                           字节                            描述及存储需求
  CHAR（M）                             M                            M 为0～255 之间的整数
  VARCHAR（M）                                                       M 为0～65535 之间的整数，值的长度+1 个字节
  TINYBLOB                                                           允许长度0～255 字节，值的长度+1 个字节
  BLOB                                                               允许长度0～65535 字节，值的长度+2 个字节
  MEDIUMBLOB                                                         允许长度0～167772150 字节，值的长度+3 个字节
  LONGBLOB                                                           允许长度0～4294967295 字节，值的长度+4 个字节
  TINYTEXT                                                           允许长度0～255 字节，值的长度+2 个字节
  TEXT                                                               允许长度0～65535 字节，值的长度+2 个字节
  MEDIUMTEXT                                                         允许长度0～167772150 字节，值的长度+3 个字节
  LONGTEXT                                                           允许长度0～4294967295 字节，值的长度+4 个字节
  VARBINARY（M）                                                     允许长度0～M 个字节的变长字节字符串，值的长度+1 个字节
  BINARY（M）                                                        允许长度0～M 个字节的定长字节字符串

    CHAR 列的长度固定为创建表时声明的长度，长度可以为从0～255 的任何值；
  而VARCHAR 列中的值为可变长字符串，长度可以指定为0～255 （5.0.3 以前）或者65535 （5.0.3
  以后）之间的值
  在检索的时候，CHAR 列删除了尾部的空格，而VARCHAR 则保留这些空格。

 */


/*
  常用函数
--   字符串
  CONCAT(S1,S2,…Sn)                 连接S1,S2,…Sn 为一个字符串
  INSERT(str,x,y,instr)             将字符串str 从第x 位置开始，y 个字符长的子串替换为字符串instr
  LOWER(str) 将字符串str 中所有字符变为小写
  UPPER(str) 将字符串str 中所有字符变为大写
  LEFT(str ,x) 返回字符串str 最左边的x 个字符
  RIGHT(str,x) 返回字符串str 最右边的x 个字符
  LPAD(str,n ,pad) 用字符串pad 对str 最左边进行填充，直到长度为n 个字符长度
  RPAD(str,n,pad) 用字符串pad 对str 最右边进行填充，直到长度为n 个字符长度
  LTRIM(str) 去掉字符串str 左侧的空格
  RTRIM(str) 去掉字符串str 行尾的空格
  REPEAT(str,x) 返回str 重复x 次的结果
  REPLACE(str,a,b) 用字符串b 替换字符串str 中所有出现的字符串a
  STRCMP(s1,s2) 比较字符串s1 和s2
  TRIM(str) 去掉字符串行尾和行头的空格
  SUBSTRING(str,x,y) 返回从字符串str x 位置起y 个字符长度的字串

-- 数值函数
  ABS(x) 返回x 的绝对值
  CEIL(x) 返回大于x 的最大整数值
  FLOOR(x) 返回小于x 的最大整数值
  MOD(x，y) 返回x/y 的模
  RAND() 返回0 到1 内的随机值
  ROUND(x,y) 返回参数x 的四舍五入的有y 位小数的值
  TRUNCATE(x,y) 返回数字x 截断为y 位小数的结果

 */