module ApplicationHelper

  def yes_no(boolean)
    "<span class='#{ boolean ? "fa fa-check-circle has-text-success" : "fa fa-ban" }'></span>".html_safe
  end

  def edit_button(resource, button_text="Edit", icon_class="fa fa-edit")
    if resource && action_name != "edit"
      if resource.class.superclass != ApplicationRecord
        resource = resource.becomes(resource.class.superclass)
      end
      link_to(edit_polymorphic_path(resource),
              title: action_name + " " + controller_path,
              class: 'button edit-button') do
        "<span class='#{icon_class}'></span><span style='padding-left: 0.25em'> #{button_text}</span>".html_safe
      end
    end
  end

  def show_button(resource, button_text="Show", icon_class="fa fa-show", margin_class=nil)
    if resource && action_name != "show"
      if resource.class.superclass != ApplicationRecord
        resource = resource.becomes(resource.class.superclass)
      end
      link_to(polymorphic_path(resource),
              title: action_name + " " + controller_path,
              class: "button show-button #{margin_class}") do
        "<span class='#{icon_class}'></span><span style='padding-left: 0.25em'> #{button_text}</span>".html_safe
      end
    end
  end

  def view_account_button(record)
    if record && action_name != "edit"
      if record.class.superclass != ApplicationRecord
        record = record.becomes(record.class.superclass)
      end
      link_to(edit_polymorphic_path(record),
              title: action_name + " " + controller_path,
              class: 'button edit-button') do
        "<span class='fa fa-user-edit'></span><span style='padding-left: 0.25em'> Edit</span>".html_safe
      end
    end
  end
end
