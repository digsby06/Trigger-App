class SectionDecorator < Draper::Decorator
  delegate_all

  def render
    h.render partial: raw_event, locals:{section: object}
  end

  def raw_event
    object.event.downcase.delete(' ')
  end
  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end
