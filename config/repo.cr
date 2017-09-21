require "yaml"

pg_url = ENV["DATABASE_URL"]?
unless pg_url
  yaml = YAML.parse(File.read("config/database.yml"))
  settings = yaml["pg"]
  pg_url = settings["database"].to_s
end

Query = Crecto::Repo::Query

module Repo
  extend Crecto::Repo

  config do |c|
    c.adapter = Crecto::Adapters::Postgres # Crecto::Adapters::Mysql -or- Crecto::Adapters::SQLite3
    c.uri = pg_url
  end
end

Crecto::DbLogger.set_handler(STDOUT)
