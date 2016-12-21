class BorrowedBook < ActiveRecord::Base
	belongs_to :user
	belongs_to :book
	validate :check_date




  def check_date
    # You can now check the "due" field here. For example, if you only want to allow due
    # dates today and later:
    if returnDate!=nil && returnDate > Date.today 
        errors.add(:returnDate, "can only be today or less.")
    end
    if dueDate < Date.today 
      errors.add(:dueDate, "can only be today or later.")
  	elsif borrowDate < Date.today 
  	  errors.add(:borrowDate, "can only be today or later.")

  elsif dueDate < borrowDate
    errors.add(:dueDate, "can only be greater than or equal to borrowDate")
    end
  end

end
