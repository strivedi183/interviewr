CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                               # required
    :aws_access_key_id      => ENV['AWSKEY'],                       # required
    :aws_secret_access_key  => ENV['AWSSEC'],                       # required
    :region                 => ENV['S3_REGION']                 # optional, defaults to 'us-east-1'
  }
  # config.fog_directory  = 'temp-cm'                               # required
  config.fog_public     = false                                     # optional, defaults to true
  # config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  # config.asset_host   = 'https://assets.example.com'              # optional, defaults to nil
end

CarrierWave.configure {|config| config.fog_directory = ENV['S3INTERVIEW_T']} if Rails.env.development?
CarrierWave.configure {|config| config.fog_directory = ENV['S3INTERVIEW_T']} if Rails.env.test?
CarrierWave.configure {|config| config.fog_directory = ENV['S3INTERVIEW_P']} if Rails.env.production?