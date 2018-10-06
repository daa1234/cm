SELECT * FROM baby91_systemuser u  
SELECT * FROM baby91_user u WHERE u.loginName = 'admin'
##将数据库的系统登陆用户数据都转移到systemUser表中
insert into oscloud_test.baby91_systemuser 
(id,createDate,updateDate,systemRoleId,age,deleteFlag,email,gender,identityNo,imgUrl,loginName,mobile,nickName,password,pinyinRealName,realName
,status,roleType)
select
u.id AS id,u.createDate AS createDate,u.updateDate AS updateDate,u.roleId AS systemRoleId,u.age AS age,u.deleteFlag AS deleteFlag,
u.email AS email,u.gender AS gender,u.identityNo AS identityNo,
u.imgUrl AS imgUrl,u.loginName AS loginName,u.mobile AS mobile,u.nickName AS nickName,u.password AS password,
u.pinyinRealName AS pinyinRealName ,u.realName AS realName,u.status AS status,u.role AS roleType
from 91baby_testdb.baby91_user u where u.loginName = 'admin'