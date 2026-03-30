# pgboss-dashboard-docker

A ready-to-use Docker image for hosting the [pg-boss Dashboard](https://github.com/timgit/pg-boss/tree/master/packages/dashboard) — a web-based UI for monitoring and managing [pg-boss](https://github.com/timgit/pg-boss) job queues.

The image is built on a minimal [distroless](https://github.com/GoogleContainerTools/distroless) base, runs as a non-root user, and supports both `linux/amd64` and `linux/arm64` platforms.

## Quick Start

```bash
docker run -d \
  -p 3000:3000 \
  -e DATABASE_URL=postgres://user:password@host:5432/mydb \
  anthonylau/pgboss-dashboard
```

Then open http://localhost:3000 in your browser.

## Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `DATABASE_URL` | PostgreSQL connection string(s) for your pg-boss database. Supports multiple pipe-separated connections, optionally named: `Production=postgres://prod/db\|Staging=postgres://stage/db` | `postgres://localhost/pgboss` |
| `PGBOSS_SCHEMA` | Schema name(s) where pg-boss tables reside. For multiple databases, pipe-separate: `pgboss\|jobs` | `pgboss` |
| `PORT` | Port the dashboard listens on | `3000` |
| `PGBOSS_DASHBOARD_AUTH_USERNAME` | Basic auth username (optional, must be set with password) | — |
| `PGBOSS_DASHBOARD_AUTH_PASSWORD` | Basic auth password (optional, must be set with username) | — |

> **Note:** Both `PGBOSS_DASHBOARD_AUTH_USERNAME` and `PGBOSS_DASHBOARD_AUTH_PASSWORD` must be provided together. Setting only one will cause a startup error.

## Docker Compose

```yaml
services:
  pgboss-dashboard:
    image: anthonylau/pgboss-dashboard:latest
    ports:
      - "3000:3000"
    environment:
      - DATABASE_URL=postgres://user:password@db:5432/mydb
```

## Prerequisites

- A PostgreSQL database with pg-boss schema already set up (pg-boss v12.11+)
- If you need to initialize the schema, run the migration first:
  ```bash
  DATABASE_URL=postgres://user:password@host:5432/mydb npx -y pg-boss migrate
  ```

## Credits

This project packages the [pg-boss Dashboard](https://github.com/timgit/pg-boss/tree/master/packages/dashboard) by [timgit](https://github.com/timgit) into a Docker image for easier deployment. All credit for the dashboard itself goes to the pg-boss project and its contributors.

- **pg-boss**: https://github.com/timgit/pg-boss
- **pg-boss Dashboard README**: https://github.com/timgit/pg-boss/blob/master/packages/dashboard/README.md

## Links

- **Source Code**: https://github.com/anthonylau/pgboss-dashboard-docker
- **Docker Hub**: https://hub.docker.com/r/anthonylau/pgboss-dashboard
