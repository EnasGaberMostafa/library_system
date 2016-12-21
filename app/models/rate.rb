class Rate < ActiveRecord::Base
  belongs_to :book
  belongs_to :user

  def self.average_rate(id)
  	ActiveRecord::Base.connection.execute("SELECT AVG(val) FROM rates WHERE book_id = #{id}")
	end

	def self.find_user_rate(book_id, user_id)
		ActiveRecord::Base.connection.execute("SELECT val 
																					 FROM rates 
																					 WHERE user_id=#{user_id} AND book_id=#{book_id}")
	end

end
