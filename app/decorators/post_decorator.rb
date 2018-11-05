class PostDecorator < Draper::Decorator
  delegate_all

  def user_name
		user.name
	end
end