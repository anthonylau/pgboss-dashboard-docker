# https://github.com/timgit/pg-boss/blob/master/packages/dashboard/README.md
# DATABASE_URL: postgres://user:pass@db:5432/mydb
# PGBOSS_SCHEMA: pgboss
# PORT: 3000

FROM node:24-alpine3.22 AS build

ARG PGBOSS_DASHBOARD_VERSION=latest

WORKDIR /app
RUN npm install @pg-boss/dashboard@${PGBOSS_DASHBOARD_VERSION}

FROM gcr.io/distroless/nodejs24-debian13

WORKDIR /app/node_modules/@pg-boss/dashboard
COPY --from=build /app/node_modules /app/node_modules

USER nonroot

ENV PORT=3000
EXPOSE 3000
CMD ["build/server/index.js"]
