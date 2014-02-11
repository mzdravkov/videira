# This migration comes from beyond (originally 20140205145109)
class AddArchiveToPlugins < ActiveRecord::Migration
  def change
    add_attachment :beyond_plugins, :archive
  end
end
