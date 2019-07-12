# Diary application

## setup
```
julia

julia>] # switch to pkg> mode
pkg> add https://github.com/genieframework/Genie.jl
pkg> add https://github.com/genieframework/SearchLight.jl
pkg> add Nullables
```

## DB setup
```
bin/repl

julia> using SearchLight
julia> SearchLight.Configuration.load_db_connection() |> SearchLight.Database.connect!
julia> SearchLight.db_init()
julia> SearchLight.Migration.last_up()
```

## boot Server
```
bin/server
```

access to localhost:8000/tasks
