class Like < ApplicationRecord
  belongs_to :user
  belongs_to :goal


  #convert params from date_select to DateTime
  def timeline=(params)
    byebug
    DateTime.new(*params.values)
  end

  #convert timeline params from date select to integers
  def timeline_params_to_i(params)
    params.values.map { |v| v.to_i }

  end
end
