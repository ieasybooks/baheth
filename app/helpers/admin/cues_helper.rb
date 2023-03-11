module Admin
  module CuesHelper
    include Pagy::Frontend
    include ::UrlUtilities

    def open_medium_button(cue)
      link_to(
        '<i class="bi bi-box-arrow-up-left"></i>'.html_safe,
        add_param(cue.medium.link, 't', cue.start_time.to_i),
        class: 'btn btn-sm btn-outline-primary',
        target: '_blank',
        rel: 'noopener'
      )
    end

    def previous_cue_button(cue)
      previous_cue = cue.previous_cue

      if previous_cue
        link_to(
          '<i class="bi bi-arrow-right"></i>'.html_safe,
          admin_cue_path(previous_cue),
          class: 'btn btn-sm btn-outline-primary'
        )
      else
        ''
      end
    end

    def next_cue_button(cue)
      next_cue = cue.next_cue

      if next_cue
        link_to(
          '<i class="bi bi-arrow-left"></i>'.html_safe,
          admin_cue_path(next_cue),
          class: 'btn btn-sm btn-outline-primary'
        )
      else
        ''
      end
    end
  end
end
