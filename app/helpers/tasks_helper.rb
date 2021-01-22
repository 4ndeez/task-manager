module TasksHelper
  def concat_usernames(users)
    #User.all.pluck(:first_name, :last_name).map { |i| i.inject { |sum, n| sum + " #{n}" }}
    array = []
    users.map { |i| array << [i.first_name + ' ' + i.last_name, i.id] }
    array
  end
end
