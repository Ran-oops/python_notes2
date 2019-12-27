
-- 进入mongo
mongo

-- 进入 py5 数据库,如果不存在创建
> use py5
switched to db py5
-- 查看当前所在库 db
> db
py5
-- 如果创建的库里面没有数据.,不显示
> show dbs;
admin    0.000GB
local    0.000GB
py       0.000GB
py4      0.000GB
python4  0.000GB

-- 在当前库中创建一个user集合(表) 进行数据的添加
> db.user.insert({"name":"zhangsan","age":20})
WriteResult({ "nInserted" : 1 })

-- 查看当前库中所以集合 (表)
> show tables;
user


-- 查看user集合中的所有文档  
> db.user.find()
{ "_id" : ObjectId("5a17978a2cb6a23073dc4737"), "name" : "zhangsan", "age" : 20 }
> db.user.insert({"name":"lisi","age":20,"email":"lisi@qq.com"})
WriteResult({ "nInserted" : 1 })

> db.user.find()
{ "_id" : ObjectId("5a17978a2cb6a23073dc4737"), "name" : "zhangsan", "age" : 20 }
{ "_id" : ObjectId("5a1797e32cb6a23073dc4738"), "name" : "lisi", "age" : 20, "email" : "lisi@qq.com" }
> 



>db.col.insert({title: 'MongoDB 教程', 
    description: 'MongoDB 是一个 Nosql 数据库',
    by: '菜鸟教程',
    url: 'http://www.runoob.com',
    tags: ['mongodb', 'database', 'NoSQL'],
    likes: 100
})



插入文档你也可以使用 db.col.save(document) 命令。
如果不指定 _id 字段 save() 方法类似于 insert() 方法。
如果指定 _id 字段，则会更新该 _id 的数据
ab = ({
	_id : ObjectId("5a17b8f80db5700d39d9e990"),
	name:"zhangsan",
	age:22,
	sex:"女"
	})
db.col.save(ab)



-- update 
-- update col set title = "MongoDB" where title='MongoDB 教程'
-- 注意 一下语句在mongo中默认只修改第一条符合要求的数据
>db.col.update({'title':'MongoDB 教程'},{$set:{'title':'MongoDB'}})

-- ,{multi:true} 设置参数为true 即可修改符合要求的全部数据
>db.col.update({'title':'MongoDB 教程'},{$set:{'title':'MongoDB'}},{multi:true})



-- save方法
db.col.save({
	"_id" : ObjectId("5a17b8820db5700d39d9e98f"),
	"title" : "MongoDB ok",
	"description" : "MongoDB 是一个 Nosql 数据库"	
})



db.col.insert({
	"_id" :222,
	"title" : "MongoDB ok",
	"description" : "MongoDB 是一个 Nosql 数据库",
	"by" : "菜鸟教程",
	"url" : "http://www.runoob.com",
	"tags" : [
		"mongodb",
		"database",
		"NoSQL"
	],
	"likes" : 100
})


users = (
	[
		{username:'xiongda',age:25,email:'xiongda@qq.com',classid:6},
		{username:'xionger',age:24,email:'xionger@qq.com',classid:5},
		{username:'zhangsan',age:20,email:'zhangsan@qq.com',classid:1},
		{username:'lisi',age:20,email:'lisi@qq.com',classid:2},
		{username:'wangwu',age:22,email:'wangwu@qq.com',classid:3},
		{username:'zhaoliu',age:22,email:'zhaoliu@qq.com',classid:4},
		{username:'tianqi',age:21,email:'tianqi@qq.com',classid:5},
		{username:'wangba',age:23,email:'wangba@qq.com',classid:6},
		{username:'xiaojiu',age:26,email:'xiaojiu@qq.com',classid:1},
		{username:'张三',age:25,email:'张三@qq.com',classid:2},
		{username:'李四',age:28,email:'李四@qq.com',classid:3},
		{username:'王五',age:24,email:'王五@qq.com',classid:4},
		{username:'赵六',age:27,email:'赵六@qq.com',classid:5},
		{username:'田七',age:28,email:'田七@qq.com',classid:6},
		{username:'王八',age:22,email:'王八@qq.com',classid:1},
		{username:'小九',age:21,email:'小九@qq.com',classid:2},
		{username:'熊大',age:28,email:'熊大@qq.com',classid:3},
		{username:'熊二',age:27,email:'熊二@qq.com',classid:4}
	]
)


db.user.insert(users)

-- 只更新找到符合条件的第一条
db.user.update( { "classid" : { $gt : 5 } } , { $set : { "age" :99} } );

-- 找到符合要求的第一条数据 进行修改,如果没有找到也不做添加
db.user.update( { "classid" : { $gt : 6 } } , { $set : { "age" : 90 } },{upsert:false});
db.user.update( { "classid" : { $gt : 6 } } , { $set : { "age" : 90 } },false);

-- 找到符合要求的第一条数据 进行修改,如果没有就进行添加
db.user.update( { "classid" : { $gt : 6 } } , { $set : { "age" : 90 } },{upsert:true});
db.user.update( { "classid" : { $gt : 6 } } , { $set : { "age" : 100 } },true);



                                                     ,false(upsert) ,true(multi)
-- 全部更新： 找到符合条件的全部更新,如果没有符合条件的不会进行添加数据  
-- 如果符合条件的数据中没有对应字段,就会添加字段和数据
db.user.update( { "classid" : { $gt : 5 } } , { $set : { "age" : 90,"num" : 1 } },false,true );




如果能找到第一个符合条件的数据 就进行修改  如果没有找到符合条件的就是进行添加数据
db.col.update( { "count" : { $lt : 2 } } , { $set : { "test5" : "OK"} },true,false );


找符合条件的所有数据进行修改.,如果没有符合条件的数据 就进行添加
db.col.update( { "count" : { $lt : 5 } } , { $set : { "test6" : "OK"} },true,true );


-- 全部更新：
db.user.update( { "num" : { $eq : 1 } } , { $inc : { "num" : 2} },false,true );




-- remove() 删除
-- 找到符合 num = 3 的所以数据 进行删除
db.user.remove({ num : 3 })

-- 找到符合要求的第一条数据进行删除
db.user.remove({ age : 20 },1)

-- justOne 只能设置为true或者1    最终只删除了一个
db.user.remove({ age : 20 },2) 



-- find() 查询所以符合条件的数据 findOne() 获取第一个符合条件的数据 

-- select * from user where username = '熊二'
db.user.find({ username : "熊二"});


db.user.save({ 
	"_id" : ObjectId("5a17c5430db5700d39d9e9a4"), 
	"username" : "熊二", "age" : 26,
 	"email" : "熊二@qq.com",
  	"classid" : 4 
})


-- select * from user where username = '熊二' and age = 27
db.user.find({ username : "熊二", age:27})
> db.user.find({ username : "熊二", age:27})
{ "_id" : ObjectId("5a17c5240db5700d39d9e992"), "username" : "熊二", "age" : 27, "email" : "熊二@qq.com", "classid" : 4 }


-- 
> db.user.find({ age : { $lte:25 } }).pretty()


db.user.find( { $or : [{username:'熊二'},{username:'熊大'}] } )
> db.user.find( { $or : [{username:'熊二'},{username:'熊大'}] } )
{ "_id" : ObjectId("5a17c5240db5700d39d9e992"), "username" : "熊二", "age" : 27, "email" : "熊二@qq.com", "classid" : 4 }
{ "_id" : ObjectId("5a17c5430db5700d39d9e9a3"), "username" : "熊大", "age" : 28, "email" : "熊大@qq.com", "classid" : 3 }
{ "_id" : ObjectId("5a17c5430db5700d39d9e9a4"), "username" : "熊二", "age" : 26, "email" : "熊二@qq.com", "classid" : 4 }



db.user.find({"age": {$gt:26}, $or: [{"username": "熊二"},{"username": "熊大"}]}).pretty()


-- 限制返回数据字段 只要 _id 和 username  如果有一些数据存在_id字段,但是不存在username字段,也在当前返回的数据结果中

db.user.find({},{"_id":1,"username":1}).pretty()


-- 修改一个数据

db.user.save({
	"_id" : ObjectId("5a17c5240db5700d39d9e992"),
	"username" : 2,
	"age" : 27,
	"email" : "熊二@qq.com",
	"classid" : 4
})

-- 查询
db.user.find()

-- 查询username字段类型为2(字符串)
db.user.find({username : {$type:2}})

-- 查询username字段类型为1(数字类型)
> db.user.find({username : {$type:1}}).pretty()
{
	"_id" : ObjectId("5a17c5240db5700d39d9e992"),
	"username" : 2,
	"age" : 27,
	"email" : "熊二@qq.com",
	"classid" : 4
}


db.user.find(
	{
		username : {$type:2}
	}

)



