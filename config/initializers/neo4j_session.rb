neo4j_config = YAML.load_file(File.expand_path('../../database.yml', __FILE__))
neo4j_env    = neo4j_config[ENV['RACK_ENV']]
neo4j_host   = "http://#{neo4j_env['host']}:#{neo4j_env['port']}"

Neo4j::Session.open(:server_db, neo4j_host)
