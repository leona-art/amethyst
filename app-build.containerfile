

#### 前半はビルド用ステージ
FROM node:18-slim AS build-node

ARG _PUBLIC_SUPABASE_URL
ENV PUBLIC_SUPABASE_URL ${_PUBLIC_SUPABASE_URL}

ARG _PUBLIC_SUPABASE_ANON_KEY
ENV PUBLIC_SUPABASE_ANON_KEY ${_PUBLIC_SUPABASE_ANON_KEY}

WORKDIR    /DIR_FOR_BUILD
COPY       ./app .
RUN        npm install && npm run build

#### 後半は起動用ステージ
FROM node:18-slim
WORKDIR    /DIR_FOR_RUN
COPY       --from=build-node /DIR_FOR_BUILD/package.json .
COPY       --from=build-node /DIR_FOR_BUILD/build ./build
RUN        npm install --omit=dev
# ↑ --produnction よりこちらが推奨になった模様
ENV        PORT 3000
# ↑ ポートを変更したい場合は指定。3000のままで良いなら不要
EXPOSE 3000
CMD        ["node","build"]