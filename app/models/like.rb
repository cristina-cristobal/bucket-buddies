class Like < ApplicationRecord
  belongs_to :user
  belongs_to :goal


  #convert params from date_select :timeline to DateTime
  def timeline=(params)
    DateTime.new(*params.values)
  end

end
