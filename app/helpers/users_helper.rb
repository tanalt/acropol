module UsersHelper
  def show_act
    show_act=User.where("activity>'#{Time.now-60*20}'")
    return show_act
  end
end
