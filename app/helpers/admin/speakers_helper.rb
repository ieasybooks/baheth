module Admin
  module SpeakersHelper
    include Pagy::Frontend

    def speakers_to_links(speakers)
      speakers.map { |speaker| link_to(speaker.name, admin_speaker_path(speaker)) }
    end
  end
end
