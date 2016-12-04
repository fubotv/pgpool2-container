Pgpool2 Dockerfile
==================

This project can be used to deploy pgpool2 inside a Docker container for transparent failover between two postgresql hosts without requiring a floating IP address.

It's optimized to serve as a query result cache between KG-API and Postgres DB. Combined with read-only secondaries, this should provide a realiable and fast backend.

### Running the Container

Specify multiple Postgres servers, and bind pg-pool to port 9999 to avoid port-conflicts with locally running dbs.  
```sudo docker run --name pgpool2 -e PGPOOL_BACKENDS=1:127.0.0.1:5432,2:127.0.0.1:5433 -p 9999:5432/tcp fubotv/kg-pgpool```

### Configuration Environment Variables

**PCP_PORT** - The port used to listen for PCP commands. (default: 9898)

**PCP_USER** - The user allowed to execute PCP commands. (default: postgres)

**PCP_USER_PASSWORD** - The pcp user password. (default: bettervoice)

**PGPOOL_PORT** - The port used by pgpool2 to listen for client connections. (default: 5432)

**PGPOOL_BACKENDS** - A comma separated list of PostgeSQL server backends. The format for each backend is as follows: INDEX:HOST:PORT (default: 1:localhost:5432)
