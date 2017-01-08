require 'capybara'
require 'capybara/dsl'
require 'capybara-screenshot'
require 'capybara/poltergeist'
require 'digest/md5'

Capybara.default_driver = :poltergeist
Capybara.app_host = 'http://www.example.com'
Capybara.save_path = "screenshots"

class Screenshot
  include Capybara::DSL

  def initialize(url)
    @url = url
  end

  def snap
    visit @url
    saver = Capybara::Screenshot::Saver.new(
      Capybara,
      Capybara.page,
      false,
      image_name
    )
    saver.save
    saver.screenshot_path
  end

  def image_name
    Digest::MD5.hexdigest(@url.gsub("/", "-"))
  end
end
