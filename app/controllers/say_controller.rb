class SayController < ApplicationController
  def hello
  	@time = Time.now.strftime("%H:%M:%S");
  end;

  def goodbye
	@files = Dir.glob('*');
  end;
end
