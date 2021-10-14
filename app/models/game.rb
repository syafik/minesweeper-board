# frozen_string_literal: true

class Game < ApplicationRecord
  default_scope { order(created_at: :desc) }

  has_many :mines
  validates :name, :width, :height, :email, :number_of_mines, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validate :max_number_of_mines
  before_create :build_mines

  private

  def max_number_of_mines
    return if width.nil? || height.nil? || number_of_mines.nil?

    errors.add(:number_of_mines, "too many mines") if (width * height) < number_of_mines
  end

  def build_mines
    boms = generate_random_mine
    boms.each do |mine|
      mines.build(x: mine.first, y: mine.last)
    end
  end

  def generate_random_mine
    boms = []
    while boms.size <= number_of_mines
      col = rand(1..width)
      row = rand(1..height)
      boms << [col, row]
      boms.uniq(&:first)
    end
    boms
  end
end

# == Schema Information
#
# Table name: games
#
#  id          :bigint           not null, primary key
#  name        :string
#  width       :integer
#  height      :integer
#  email       :string
#  number_of_mines       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
