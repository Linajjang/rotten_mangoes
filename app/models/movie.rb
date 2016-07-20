class Movie < ApplicationRecord
  mount_uploader :image, ImageUploader
  
  has_many :reviews

      validates :title,
        presence: true

      validates :director,
        presence: true

      validates :runtime_in_minutes,
        numericality: { only_integer: true }

      validates :description,
        presence: true

      validates :image,
        presence: true

      validates :release_date,
        presence: true

      validate :release_date_is_in_the_past

      def review_average
        reviews.sum(:rating_out_of_ten)/reviews.size unless reviews.empty?
      end

      protected

      def release_date_is_in_the_past
        if release_date.present? && release_date > Date.today
          errors.add(:release_date, "should be in the past") 
        end
      end

    end
