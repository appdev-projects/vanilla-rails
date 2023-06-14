namespace :db do

desc "Dumps the database to db/APP_NAME.dump"
task :dump => :environment do
  cmd = nil
  with_config do |app, host, db, user|
    cmd = "pg_dump --host #{host} --username #{user} --verbose --clean --no-owner --no-acl --format=c #{db} > #{Rails.root}/#{app}.dump"
  end
  puts cmd
  exec cmd
end

private

  def with_config
    yield Rails.application.class.module_parent_name.underscore,
      ActiveRecord::Base.connection_config[:host],
      ActiveRecord::Base.connection_config[:database],
      ActiveRecord::Base.connection_config[:username]
  end

end
