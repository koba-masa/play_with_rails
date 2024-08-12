# frozen_string_literal: true

class FogVerification
  def upload!(filename, body)
    directory = s3_client.directories.new(key: 'play-with-rails')
    directory.files.create(key: "#{Rails.env}/fog_verification/#{filename}", body:)
  end

  private

  def s3_client
    @s3_client ||= Fog::Storage.new(
      provider: 'AWS',
      aws_access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID'),
      aws_secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
      endpoint: ENV.fetch('AWS_ENDPOINT'),
      path_style: true,
    )
  end
end
