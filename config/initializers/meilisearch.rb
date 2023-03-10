MeiliSearch::Rails.configuration = {
  meilisearch_url: ENV['MEILISEARCH_HOST'] || 'http://meilisearch:7700',
  meilisearch_api_key: ENV['MEILISEARCH_KEY'] || 'LOCAL_TEST_KEY',
  timeout: 5,
  max_retries: 2
}
