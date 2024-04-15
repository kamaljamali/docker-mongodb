use admin;
db.createUser({    user: "kamal",    pwd: "pa3word!123",        roles: [ { role: "clusterAdmin", db: "admin" },{ role: "userAdminAnyDatabase", db: "admin" } ]});
db.auth('kamal', 'pa3word!123');
use MyDatabase;
db.createUser({    user: "admindb",    pwd: "123456",        roles: [ { role: "readWrite", db: "MyDatabase" } ]});
use amax;
db.createUser({    user: "admindb",    pwd: "123456",        roles: [ { role: "readWrite", db: "amax" } ]});
