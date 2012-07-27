require 'sequel'

Sequel.migration do
  up do

    puts("Adding table forks")

    create_table :forks do
      foreign_key :forked_project_id, :projects, :null => false
      foreign_key :forked_from_id, :projects, :null => false
      DateTime :created_at, :null => false,
               :default => Sequel::CURRENT_TIMESTAMP
      String :ext_ref_id, :null => false, :size => 24, :default => "0"
      primary_key([:fork_id, :forked_from_id])
    end

  end

  down do

    puts("Droping table forks")
    drop_table :forks

  end
end