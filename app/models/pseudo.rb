class Pseudo < ApplicationRecord
  belongs_to :user
  has_one :currentuser, foreign_key:"pseuso_id", class_name:"User"
  def image=(uploaded_io)
  File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
  end
  write_attribute(:image, uploaded_io.original_filename)
  end
  def image
    read_attribute(:image)
  end
end
