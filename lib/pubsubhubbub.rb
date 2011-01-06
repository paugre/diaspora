#   Copyright (c) 2010, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.


class PubSubHubbub

  H = {"User-Agent" => "PubSubHubbub Ruby", "Content-Type" => "application/x-www-form-urlencoded"}

  def initialize(hub, options={})
      @headers = H.merge(options[:head]) if options[:head]
      @hub = hub.kind_of?(URI) ? hub : URI::parse(hub)
    end

    def publish(feed)
      RestClient.post @hub, :headers => H, 'hub.url' => feed, 'hub.mode' => 'publish'
    end
end

