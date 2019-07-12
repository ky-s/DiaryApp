module CreateTableDiaries

import SearchLight.Migrations: create_table, column, primary_key, add_index, drop_table

function up()
  create_table(:diaries) do
    [
      primary_key()
      column(:date, :date)
      column(:weather, :string)
      column(:note, :text)
    ]
  end

  add_index(:diaries, :date)
end

function down()
  drop_table(:diaries)
end

end
