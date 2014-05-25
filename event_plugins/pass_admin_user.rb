class Test < Plugman::PluginBase
  def initialize
  end

  def on_deploy tenant
    plugin = """
PlugMan.define :admin_user do
  author 'Llama'
  version '0.0.1'
  extends ({})
  requires [:main, :user_profile, :rolify]
  extension_points []
  params()

  def start
    Thread.new do
      loop do
        break if User.table_exists? and defined?(Profile) and Profile.table_exists?
      end
      user = User.create(email: 'qj@qj.qj', password: 'qjqjqjqj')
      profile = Profile.new(first_name: 'First Name', last_name: 'Last Name', country: 'Country')
      user.profile = profile
      user.profile.save
      user.save
    end
    true
  end
end"""
    File.open(File.join(ENV['tenants_plugins_dir'], tenant.name, "add_admin.rb"), "w") do |f|
      f.write(plugin)
    end
  end
end
