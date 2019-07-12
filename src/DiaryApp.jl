module DiaryApp

using Genie, Genie.Router, Genie.Renderer, Genie.AppServer

function main()
  Base.eval(Main, :(const UserApp = DiaryApp))

  include("../genie.jl")

  Base.eval(Main, :(const Genie = DiaryApp.Genie))
  Base.eval(Main, :(using Genie))
end

main()

end
