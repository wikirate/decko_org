namespace :deploy do
  desc "Set www-data permissions on config.ru / log"
  after :updated, :deploy_chown do
    on roles(:app) do
      execute :sudo, "/opt/bin/deploy_chown", release_path
    end
  end

  desc "decko updates"
  after :deploy_chown, :decko_updates do
    on roles(:app) do
      within release_path do
        execute :bundle, :exec, :decko, :update
      end
    end
  end

  desc "cache_and_machines"
  after :published, :clear_caches do
    on roles(:app) do
      within release_path do
        execute :bundle, :exec, :rake, "decko:reset_cache"
        execute :bundle, :exec, :rake, "card:refresh_machine_output"
      end
    end
  end
end
