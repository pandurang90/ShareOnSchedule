module LinkedinsHelper
  def check(linkedin)
    if !linkedin.is_shared 
      "Not yet Shared" 
    else 
      "Shared" 
    end
  end
end