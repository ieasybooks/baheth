require 'pagy/extras/bootstrap'
require 'pagy/extras/i18n'
require 'pagy/extras/meilisearch'
require 'pagy/extras/overflow'
require 'pagy/extras/trim'

Pagy::DEFAULT[:items] = 20
Pagy::DEFAULT[:overflow] = :last_page
Pagy::DEFAULT[:steps] = { 0 => [1, 0, 0, 1], 540 => [1, 2, 2, 1], 720 => [1, 4, 4, 1] }

Pagy::I18n.load(locale: 'ar')
