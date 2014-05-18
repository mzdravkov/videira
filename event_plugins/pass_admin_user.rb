class Test < Plugman::PluginBase
  def initialize
  end

  def on_deploy tenant
    plugin = """
      if User.table_exists?
        unless User.find_by_email('#{tenant.user.email}')
          User.create({email: '#{tenant.user.email}', password: '#{tenant.user.encrypted_password}'})
        end
      end
    """
    File.open(File.join(ENV['tenants_plugins_dir'], tenant.name, "add_admin.rb"), "w") do |f|
      f.write(plugin)
    end
  end
end
