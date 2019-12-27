> doc = ({
	"_id" : ObjectId("5a17c5430db5700d39d9e9a3"),
	"username" : "熊大",
	"age" : 50,
	"email" : "熊大@qq.com",
	"classid" : 3
}
)


db.user.update({'uname':'admins'},{$set:{'uname':'aabbccdd'}})



--  limit方法 指定取出的数据数量
db.user.find().limit(5)


db.user.find({},{"username":1}).limit(5)


-- skip方法 指定跳过多少条数据
db.user.find({},{"username":1}).limit(2).skip(3)
db.user.find({},{"username":1}).skip(3).limit(2)


-- sort 方法 按指定字段进排序 ,其中 1 为升序排列，而-1是用于降序排列。
db.user.find({},{"username":1,"classid":1,"age":1,_id:0}).sort({"classid":-1})

db.user.find({},{"username":1,"classid":1,"age":1,_id:0}).sort({"age":-1})



-- MongoDB 排序 count()方法

db.user.count()



abc = ([
		{
		   title: 'MongoDB Overview', 
		   description: 'MongoDB is no sql database',
		   by_user: 'runoob.com',
		   url: 'http://www.runoob.com',
		   tags: ['mongodb', 'database', 'NoSQL'],
		   likes: 100
		},
		{
		   title: 'NoSQL Overview', 
		   description: 'No sql database is very fast',
		   by_user: 'runoob.com',
		   url: 'http://www.runoob.com',
		   tags: ['mongodb', 'database', 'NoSQL'],
		   likes: 10
		},
		{
		   title: 'Neo4j Overview', 
		   description: 'Neo4j is no sql database',
		   by_user: 'Neo4j',
		   url: 'http://www.neo4j.com',
		   tags: ['neo4j', 'database', 'NoSQL'],
		   likes: 750
		}
	])

-- db.user.aggregate([{$group : {_id : "$by_user", num_tutorial : {$sum : 1}}}])

-- select by_user, count(*) from mycol group by by_user


db.user.aggregate([{$group : {_id : "$classid", num : {$avg : "$age"}}}])


db.user.aggregate([{$group : {_id : "$classid", num_tutorial : {$min : "$age"}}}])



-- 查询索引
db.user.getIndexes()

-- 添加普通索引
db.user.ensureIndex({"username":1})


--  分析
db.user.find({"username":'张三'}).explain()


-- 删除索引
db.user.dropIndex({"username":1})


-- 使用索引时的查询
db.user.find({"username":'张三'}).explain()
{
	"queryPlanner" : {
		"plannerVersion" : 1,
		"namespace" : "py5.user",
		"indexFilterSet" : false,
		"parsedQuery" : {
			"username" : {
				"$eq" : "张三"
			}
		},
		"winningPlan" : {
			"stage" : "FETCH",
			"inputStage" : {
				"stage" : "IXSCAN",
				"keyPattern" : {
					"username" : 1
				},
				"indexName" : "username_1",
				"isMultiKey" : false,
				"multiKeyPaths" : {
					"username" : [ ]
				},
				"isUnique" : false,
				"isSparse" : false,
				"isPartial" : false,
				"indexVersion" : 2,
				"direction" : "forward",
				"indexBounds" : {
					"username" : [
						"[\"张三\", \"张三\"]"
					]
				}
			}
		},
		"rejectedPlans" : [ ]
	},
	"serverInfo" : {
		"host" : "yc-virtual-machine",
		"port" : 27017,
		"version" : "3.4.9",
		"gitVersion" : "876ebee8c7dd0e2d992f36a848ff4dc50ee6603e"
	},
	"ok" : 1
}

-- 没有索引时的查询
db.user.find({"username":'张三'}).explain()
{
	"queryPlanner" : {
		"plannerVersion" : 1,
		"namespace" : "py5.user",
		"indexFilterSet" : false,
		"parsedQuery" : {
			"username" : {
				"$eq" : "张三"
			}
		},
		"winningPlan" : {
			"stage" : "COLLSCAN",
			"filter" : {
				"username" : {
					"$eq" : "张三"
				}
			},
			"direction" : "forward"
		},
		"rejectedPlans" : [ ]
	},
	"serverInfo" : {
		"host" : "yc-virtual-machine",
		"port" : 27017,
		"version" : "3.4.9",
		"gitVersion" : "876ebee8c7dd0e2d992f36a848ff4dc50ee6603e"
	},
	"ok" : 1
}



--  退出mongo命令行 进行 数据备份
mongodump -d py5 -o /home/yc/data/


-- 删除库
db.dropDatabase()


-- 回复数据库 
mongorestore -d py5 /home/yc/data/py5
