module DiariesController

using Genie.Renderer
using Genie.Router
using SearchLight

using Diaries
using Dates

using ViewHelper

function index()
    # @params(:date)
    date = Date(now())
    fdom, ldom = firstdayofmonth(date), lastdayofmonth(date)
    # TODO: to Scope
    diaries = SearchLight.find_by(Diary, SQLWhereExpression("date <= ? AND date >= ?", [fdom, ldom]))
    ym = Dates.format(fdom, "yyyy年mm月")
    html!(:diaries, :index, diaries = sort(diaries, by = t -> t.date), dayrange = fdom:Day(1):ldom, ym = ym)
end

function new()
    html!(:diaries, :new, date = @params(:date))
end

function create()
    Diary(date = @params(:date), weather = @params(:weather), note = @params(:note)) |> save && redirect_to(:index_diaries, date = @params(:date))
end

end
