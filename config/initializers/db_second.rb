DB_SECOND = YAML::load(ERB.new(File.read(Rails.root.join("config","database_second.yml"))).result)[Rails.env]
