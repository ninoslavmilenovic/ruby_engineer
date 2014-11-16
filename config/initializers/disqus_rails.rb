DisqusRails.setup do |config|
  config::SHORT_NAME    = "rubyengineer"
  config::SECRET_KEY    = ENV['RE_DISQUS_SECRET_KEY']
  config::PUBLIC_KEY    = "dHnVkGMDGdDES8jSAFMQsuoTeTYon8gTgcjMcIGTVw6MdTe3KsZPRh86Q7OWfkRC"
  config::ACCESS_TOKEN  = ENV['RE_DISQUS_ACCESS_TOKEN']
end
