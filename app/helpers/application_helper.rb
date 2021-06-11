module ApplicationHelper
  def photo(user)
    if user.photo.present?
      image_tag(user.photo.to_s, alt: user.username, class: "rounded")
    else
      image_tag('default_profile.jpg', alt: user.username, class: 'rounded', style: 'width: 50px; height: 40px')
    end
  end

  def cover_image(user)
    if user.cover_image.present?
      image_tag(user.cover_image.to_s, alt: user.username)
    else
      image_tag('default_cover.jpg', alt: user.username, class: 'w-100')
    end
  end

    def boostrap_class(alert)
      { success: 'alert-success',
      error: 'alert-danger',
      notice: 'alert-success',
      warning: 'alert-warning',
      danger: 'alert-danger',
      alert: 'alert-danger' }[alert.to_sym]
    end
    
      def flash_messages(_opts = {})
        flash.each do |msg_type, message|
          concat(content_tag(:div, message, class: "alert #{boostrap_class(msg_type.to_sym)} fade in") do
            concat(content_tag(:button, id: "close-button", class: "close", type: :button, data: { dismiss: 'alert' }, "aria-label" => :Close) do
              concat content_tag(:span, "&times;".html_safe, "aria-hidden" => true)
            end)
            concat message
          end)
        end
        nil
    end
end
