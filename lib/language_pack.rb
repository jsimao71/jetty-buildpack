require "pathname"
require "language_pack/web_xml_config"
require "language_pack/package_fetcher"
require "language_pack/java"
require "language_pack/jetty_web"
require "language_pack/spring"
require "language_pack/grails"
require "language_pack/play"
require "language_pack/xml_wrapper"

# General Language Pack module
module LanguagePack

  # detects which language pack to use
  # @param [Array] first argument is a String of the build directory
  # @return [LanguagePack] the {LanguagePack} detected
  def self.detect(*args)
    Dir.chdir(args.first)

    puts "LanguagePack detect"
    pack = [ JettyWeb, Java ].detect do |klass|
      klass.use?
    end

    #puts "Pack: #{pack}"

    pack ? pack.new(*args) : nil
  end

end


