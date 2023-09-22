class NameAble
  def correct_name
    raise NotImplementdError.new('method should be implemented in concrete class')
  end
end