class ChangeUtiliesForProperties < ActiveRecord::Migration
change_table :properties do |t|  
        t.change :utilies, :date
    end
end
