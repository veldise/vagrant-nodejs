// select db
use admin

// create admin
db.createUser({
    user: "admin",
    pwd: "admin.",
    roles: [{
        role: "userAdminAnyDatabase",
        db: "admin"
    }]
});

// auth admin
db.auth("admin", "admin.");

// select db
use mobigen

// create monbigen
db.createUser({
    user: "mobigen",
    pwd: "mobigenUI.",
    roles: [{
        role: "dbOwner",
        db: "mobigen"
    }]
});
