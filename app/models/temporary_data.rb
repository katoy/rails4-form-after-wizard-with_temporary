# -*- coding: utf-8 -*-

class TmpValidator < ActiveModel::Validator
  def validate(record)
    if record.data[:password]
      if record.data[:password].blank?
        record.errors[:base] << "#{I18n.t :'view.password'}#{I18n.t :'errors.messages.blank'}"
      elsif record.data[:password] !=  record.data[:password_confirmation]
        record.errors[:base] << format("#{I18n.t :'view.password'} #{I18n.t :'errors.messages.confirmation'}",
                                       attribute: "#{I18n.t :'view.password_confirmation'}")
      end
    end
  end
end

class TemporaryData < ActiveRecord::Base
  serialize :data
  before_create :set_default_expires_at

  scope :unexpired, lambda { where("expires_at > ?", Time.current) }
  scope :expired, lambda { where("expires_at < ?", Time.current) }

  # validates data[:password], presence: true
  # validates :password, confirmation: true
  validates_with TmpValidator

  def self.delete_expired
    expired.delete_all
  end

  def self.not_expired
    unexpired
  end

  # --- email
  def email
    self.data[:email]
  end
  def email=(v)
    self.data[:email] = v
  end
  # --- name
  def name
    self.data[:name]
  end
  def name=(v)
    self.data[:name] = v
  end
  # --- date_of_birth
  def date_of_birth
    self.data[:date_of_birth]
  end
  def date_of_birth=(v)
    self.data[:date_of_birth] = v
  end
  # --- bio
  def bio
    self.data[:bio]
  end
  def bio=(v)
    self.data[:bio] = v
  end

  # --- twitter_username
  def twitter_username
    self.data[:twitter_username]
  end
  def twitter_username=(v)
    self.data[:twitter_username] = v
  end

  # --- github_username
  def github_username
    self.data[:github_username]
  end
  def github_username=(v)
    self.data[:github_username] = v
  end

  # --- website
  def website
    self.data[:website]
  end
  def website=(v)
    self.data[:website] = v
  end

  private

  def set_default_expires_at
    self.expires_at = Time.current + 48.hours if expires_at.nil? || expires_at < Time.current
  end
end
