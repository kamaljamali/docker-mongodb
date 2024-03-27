mkdir -p /server/mongo/mongodb_cluster_router01_db
mkdir -p /server/mongo/mongodb_cluster_router01_config
mkdir -p /server/mongo/mongodb_cluster_configsvr01_db
mkdir -p /server/mongo/mongodb_cluster_configsvr01_config
mkdir -p /server/mongo/mongodb_cluster_configsvr02_db
mkdir -p /server/mongo/mongodb_cluster_configsvr02_config
mkdir -p /server/mongo/mongodb_cluster_shard01_a_db
mkdir -p /server/mongo/mongodb_cluster_shard01_a_config
mkdir -p /server/mongo/mongodb_cluster_shard01_b_db
mkdir -p /server/mongo/mongodb_cluster_shard01_b_config
mkdir -p /server/mongo/mongodb_cluster_shard02_a_db
mkdir -p /server/mongo/mongodb_cluster_shard02_a_config
mkdir -p /server/mongo/mongodb_cluster_shard02_b_db
mkdir -p /server/mongo/mongodb_cluster_shard02_b_config
docker stack deploy -c docker-compose-new.yml mongo