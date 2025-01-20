class Produto < ApplicationRecord
    has_many_attached :images

    def images_urls
        images.map do |image|
          Rails.application.routes.url_helpers.url_for(image) if image.present?
        end.compact
    end
end
