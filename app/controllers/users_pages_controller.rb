class UsersPagesController < ApplicationController
	before_filter :authorize_admin, only: [:admin_page]

	def home_page
		if params[:search]
   		values = { search: "%#{ params[:search] }%" }

	    conditions = %q{ books.title          LIKE :search
	                     OR books.author      LIKE :search}

	    @books = Book.where(conditions, values).order('created_at DESC')
	  else
	    @books = Book.order('created_at DESC')
  	    @mostBooks = Book.order('popularity DESC')
	  end
	end

	def admin_page
		
	end

	def user_page
		
	end

	private

	  def authorize_admin
      if current_user.nil? 
        redirect_to root_path
      elsif !current_user.admin?
        redirect_to root_path
      end
    end
end
