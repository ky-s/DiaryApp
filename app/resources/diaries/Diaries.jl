module Diaries

using SearchLight, Nullables, SearchLight.Validation, DiariesValidator
using Dates

export Diary

mutable struct Diary <: AbstractModel
  ### INTERNALS
  _table_name::String
  _id::String
  _serializable::Vector{Symbol}

  ### FIELDS
  id::DbId
  date::Date
  weather::String
  note::String

  ### VALIDATION
  # validator::ModelValidator

  ### CALLBACKS
  # before_save::Function
  # after_save::Function
  # on_save::Function
  # on_find::Function
  # after_find::Function

  ### SCOPES
  # scopes::Dict{Symbol,Vector{SearchLight.SQLWhereEntity}}

  ### constructor
  Diary(;
    ### FIELDS
    id = DbId(),
    date = Date(now()),
    weather = "",
    note = "",

    ### VALIDATION
    # validator = ModelValidator([
    #   ValidationRule(:title, DiariesValidator.not_empty)
    # ]),

    ### CALLBACKS
    # before_save = (m::Todo) -> begin
    #   @info "Before save"
    # end,
    # after_save = (m::Todo) -> begin
    #   @info "After save"
    # end,
    # on_save = (m::Todo, field::Symbol, value::Any) -> begin
    #   @info "On save"
    # end,
    # on_find = (m::Todo, field::Symbol, value::Any) -> begin
    #   @info "On find"
    # end,
    # after_find = (m::Todo) -> begin
    #   @info "After find"
    # end,

    ### SCOPES
    # scopes = Dict{Symbol,Vector{SearchLight.SQLWhereEntity}}()

  ) = new("diaries", "id", Symbol[],                                                ### INTERNALS
          id, date, weather, note                                                       ### FIELDS
          # validator,                                                                  ### VALIDATION
          # before_save, after_save, on_save, on_find, after_find                       ### CALLBACKS
          # scopes                                                                      ### SCOPES
          )
end

end
