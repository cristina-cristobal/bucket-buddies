class Step < ApplicationRecord
  belongs_to :like

  def start_time=(params)
    super(DateTime.new(*params.sort.to_h.values))
  end

  def end_time=(params)
    super(DateTime.new(*params.sort.to_h.values))
  end

end
