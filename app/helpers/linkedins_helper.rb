module LinkedinsHelper
  def status(linkedin)
    if !linkedin.is_shared 
      "Not yet Shared" 
    else 
      "Shared" 
    end
  end
end