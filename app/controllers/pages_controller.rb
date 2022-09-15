class PagesController < ApplicationController

  def home
    @property = Property.new
  end

end
