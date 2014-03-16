class Test < Plugman::PluginBase
  def initialize
  end

  def on_deploy tenant
    p "Llama!"
    p tenant.user
  end
end
