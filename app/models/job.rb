# == Schema Information
#
# Table name: jobs
#
#  id              :integer          not null, primary key
#  name            :string
#  status          :integer
#  description     :text
#  employment_type :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Job < ActiveRecord::Base
  enum status: [:active, :inactive]
  enum employment_type: [:full_time, :part_time]

  belongs_to :user

  validates_presence_of :name, :description, :status, :employment_type, :user_id

  def self.search(terms:)
    table = Job.arel_table
    clause = table[:name].matches("%#{terms}%")
    terms.split(' ').each do |term|
      clause = clause.or(table[:name].matches("%#{term}%"))
    end
    where(clause)
  end
end
