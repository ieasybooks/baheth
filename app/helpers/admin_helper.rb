module AdminHelper
  def tags_to_links(record)
    record.tag_list.map do |tag|
      link_to(tag, controller: "admin/#{record.class.to_s.downcase.pluralize}", action: :index, tag:)
    end
  end
end
