module UsersHelper
  def get_user_kind_display_name(kind)
    if kind == "admin"
      return "管理者"
    else
      return "一般ユーザー"
    end
  end
end
