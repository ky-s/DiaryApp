using Genie.Router
using DiariesController

route("/") do
  serve_static_file("welcome.html")
end

route("/diaries", DiariesController.index, named = :index_diaries)
# route("/diaries/show", DiariesController.show, named = :show_diary)
route("/diaries/new", DiariesController.new, named = :new_diary)
route("/diaries/create", DiariesController.create, method = POST, named = :create_diary)
route("/diaries/edit", DiariesController.edit, named = :edit_diary)
route("/diaries/update", DiariesController.update, method = POST, named = :update_diary)
# route("/diaries/destroy", DiariesController.update, method = POST, named = :destroy_diary)
