use admin
db.createUser({
    "user": "admin",
    "pwd": "admin.",
    "roles": [ "root" ]
});
db.auth("admin", "admin.");

use mobigen
db.createUser({
    "user": "mobigen",
    "pwd": "mobigenUI.",
    "roles": [
        { "role": "dbOwner", "db": "mobigen" }
    ]
});
