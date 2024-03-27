### This section is for authentication
### 👉 go to cert folder and run cert.sh in terminal
```bash
./cert.sh
```
Note: after instruction create a file with name key.key with owner 999
Note: go back folder with-security

### 👉 Step 1: Start all of the containers
```bash
docker stack deploy -c docker-compose-sec.yaml mongo
or 
./deploy-sec.sh
```

### 👉 Step 2: Initialize the replica sets (config servers and shards)
```bash
docker exec -it mongo_configsvr01 sh -c "mongosh < /scripts/init-configserver.js"
docker exec -it mongo_shard01-a sh -c "mongosh < /scripts/init-shard01.js"
docker exec -it mongo_shard02-a sh -c "mongosh < /scripts/init-shard02.js"
```
### 👉 Step 3: Initializing the router
Note: Wait 5 second
```bash
docker exec -it mongo_router01 sh -c "mongosh < /scripts/init-router.js"
```

### This section is for authentication
### 👉 Step 1: connect to mongo router and add username and password
Note: if you test connect to your mongos router and return error authentication please run below command.
```bash
docker exec -it mongo_router01 sh -c "mongosh < /scripts/add-user-admin.js"
```

### 👉 Step 4: Enable sharding and setup sharding-key
```bash
docker exec -it mongo_router01 mongosh --port 27017
use admin
db.auth("kamal","pa3word!123")
sh.enableSharding("MyDatabase")
db.adminCommand( { shardCollection: "MyDatabase.MyCollection", key: { oemNumber: "hashed", zipCode: 1, supplierId: 1 } } )
exit
```

### 👉 Step 5: Verify
```bash
docker exec -it mongo_shard-01-node-a bash -c "echo 'rs.status()' | mongosh --port 27017" 
docker exec -it mongo_shard-02-node-a bash -c "echo 'rs.status()' | mongosh --port 27017" 
```
### 👉 Step 6: check database
```bash
docker exec -it mongo_router01 mongosh --port 27017
use MyDatabase
db.stats()
db.MyCollection.getShardDistribution()
exit
```
