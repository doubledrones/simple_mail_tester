#!/usr/bin/env ruby

require_relative 'config'

require 'pony'

CONFIG.each do |key, config|
  
  puts config[:description]

  pony = Pony.mail(
    :from    => config[:from],
    :to      => config[:tested_email],
    :subject => 'Test',
    :body    => 'Delivered.',
    :via     => :smtp,
    :via_options => {
      :address              => config[:smtp_server],
      :port                 => config[:smtp_port],
      :enable_starttls_auto => true,
      :user_name            => config[:smtp_username],
      :password             => config[:smtp_password],
      :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
    }
  )

  puts pony.inspect

end
