class SayController < ApplicationController
  def hello
  	@time = Time.now.strftime("%H:%M:%S");
  	return @time;
  end

  def goodbye
  end
end
