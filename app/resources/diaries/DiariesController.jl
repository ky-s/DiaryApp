module DiariesController

using Genie.Renderer
using Genie.Router
using SearchLight

using Diaries
using Dates

using ViewHelper

function index()
    date = try
        year, month = parse.(Int, [@params(:year), @params(:month)])
        Date(year, month)
    catch
        Date(now())
    end
    fdom, ldom = firstdayofmonth(date), lastdayofmonth(date)
    # TODO: to Scope
    diaries_by_day = get_diaries_in_month(fdom, ldom)

    html!(:diaries, :index,
          diaries_by_day = diaries_by_day,
          dayrange       = fdom:Day(1):ldom,
          title          = Dates.format(date, "yyyy年m月"),
          prev_year      = year( date - Month(1)),
          prev_month     = month(date - Month(1)),
          next_year      = year( date + Month(1)),
          next_month     = month(date + Month(1)),
    )
end

function new()
    html!(:diaries, :new, date = @params(:date))
end

function create()
    date = Date(@params(:date))
    Diary(date = @params(:date), weather = @params(:weather), note = @params(:note)) |> save &&
        redirect_to(link_to(:index_diaries, year = year(date), month = month(date)))
end

function edit()
    date = Date(@params(:date))
    diary = SearchLight.find_one_by(Diary, SQLWhereExpression("date = ?", date)) |> get
    html!(:diaries, :edit, diary = diary)
end

function update()
    date = Date(@params(:date))
    diary = SearchLight.find_one!!(Diary, @params(:diary_id))
    diary.date    = date
    diary.weather = @params(:weather)
    diary.note    = @params(:note)
    save(diary) && redirect_to(link_to(:index_diaries, year = year(date), month = month(date)))
end

function get_diaries_in_month(fdom, ldom)
    diaries = SearchLight.find_by(Diary, SQLWhereExpression("date >= ? AND date <= ?", [fdom, ldom]), order = SQLOrder("date"))
    reduce((dict, d) -> merge(dict, Dict(d.date => d)), diaries, init = Dict{Date, Diary}())
end

end
