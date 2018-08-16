# frozen_string_literal: true

Vagrant.configure('2') do |config|
  config.vm.box = 'omu/debian-stable-server'

  config.vm.provider 'lxc' do |provider|
    provider.customize 'cgroup.memory.limit_in_bytes', '2048M'
  end

  config.vm.network 'forwarded_port', guest: 3000, host: 3000

  config.vm.provision 'shell', inline: <<-SHELL
  cd /vagrant && export $(<.env.dev)

  systemctl enable postgresql
  systemctl start postgresql

  sudo -u postgres psql <<<"CREATE USER $RDS_USERNAME WITH ENCRYPTED PASSWORD '$RDS_PASSWORD';"
  sudo -u postgres psql <<<"ALTER ROLE $RDS_USERNAME LOGIN CREATEDB SUPERUSER;"

  gem install bundler foreman

  bundle install --deployment

  bundle exec rake db:create
  bundle exec rake db:migrate
  bundle exec rake db:seed

  foreman export -p3000 --app xokul --user op --env .env.dev systemd /etc/systemd/system/

  systemctl enable xokul.target
  systemctl start xokul.target
  SHELL
end
