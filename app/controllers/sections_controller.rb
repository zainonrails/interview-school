class SectionsController < ApplicationController
  def index
    @sections = Section.all
    @user_sections = current_user.sections
  end
end