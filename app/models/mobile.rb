class Mobile < ApplicationRecord
  belongs_to :mobile_brand, optional: true
  has_one :review
  validates :image, presence: true

  ratyrate_rateable "original_score"

  scope :with_ratings, ->{includes(:rate_average_without_dimension).order("rating_caches.avg desc")}

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  ATTRIBUTES_PARAMS = [:name, :description, :network_technology,
    :launch_announced, :launch_status, :body_dimensions, :body_weight,
    :body_sim, :display_type, :display_size, :display_resolution,
    :display_multitouch, :platform_os, :platform_chipset, :image,
    :platform_CPU, :platform_GPU, :memory_cardslot, :memory_internal,
    :camera_primary, :camera_features, :camera_video, :camera_secondary,
    :sound_alerttypes, :sound_loudspeakers, :sound_35mmjack, :comms_wlan,
    :comms_bluetooth, :comms_gps, :comms_nfc, :comms_radio, :comms_usb,
    :features_sensors, :features_messaging, :features_browser, :features_java,
    :features_misc, :battery, :misc_colors, :mobile_brand_id]
end
