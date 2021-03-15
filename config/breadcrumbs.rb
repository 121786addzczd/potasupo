crumb :root do
  link "トップページ", root_path
end

crumb :user_sign_in do
  link "ログイン", user_session_path
  parent :root
end

crumb :spots do
  link "スポット一覧", spots_path
  parent :root
end

crumb :new_spots do
  link "新しいスポット登録", new_spot_path
  parent :root
end

crumb :edit_spots do
  link "スポット編集", edit_spot_path
  parent :show_spot
end

crumb :show_spot do |spot|
  spot = Spot.find(params[:id])
  link "#{spot.name}", spot_path(spot)
  parent :spots
end

crumb :user_registration do
  link "新規登録", user_registration_path
  parent :root
end

crumb :coporation do
  link "運営会社", page_path('coporation')
  parent :root
end

crumb :terms do
  link "利用規約", page_path('terms')
  parent :root
end

crumb :praivacy do
  link "プライバシー", page_path('praivacy')
  parent :root
end

crumb :question do
  link "よくある質問", page_path('question')
  parent :root
end

crumb :index_contacts do
  link "お問い合わせ一覧", contacts_path
  parent :root
end

crumb :contact do
  link "お問い合わせ", new_contact_path
  parent :root
end

crumb :thanks do
  link "フォーム送信完了", thanks_contacts_path
  parent :contact
end


crumb :informations do
  link "お知らせ", informations_path
  parent :root
end

crumb :new_informations do
  link "お知らせを入力", new_information_path
  parent :informations
end


# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).