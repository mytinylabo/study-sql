# study-sql
[SQL 第2版 ゼロからはじめるデータベース操作](https://www.amazon.co.jp/dp/4798144452) を読むためのPostgreSQL環境です。

本ではWindows版をインストールしていますが、ポータブルにするためDocker化しました（実行環境をポータブルにしただけで、DBの実体ファイルはホストPCに永続化します）。

## 起動

```
git clone git@github.com:mytinylabo/study-sql.git
cd study-sql
docker-compose up -d
```

## CLIで接続

```
docker-compose exec db psql -U postgres
```

## Adminerで接続

ブラウザから`http://localhost:8080`を開き、以下の情報でログインする。

- データベース種類: PostgreSQL
- サーバ: db
- ユーザ名: postgres
- パスワード: example