class MainController < ApplicationController
  def index
  	@events = Section.all
  	@audio = Audio.all
  	@main_section = Section.main_section.decorate if Section.main_section
    @second_section = Section.second_section.decorate if Section.second_section
    @third_section = Section.third_section.decorate if Section.third_section
    @no_sections_found = Section.main_section.nil?
  end
end
