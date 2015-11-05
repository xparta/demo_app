class Poll < ActiveRecord::Base
  belongs_to :poll
end

def self.open
    Polls.find(:all,
                  :conditions => ["start <= ? and end >= ?",
                                  Time.now, Time.now])
    if (votes_for_user = VoteRecord.find_all_by_voter_id voter_id) != nil
      done = Set.new
      votes_for_user.each { |v| done << v.poll_id }
      open.delete_if { |p| done.include? p.id }
    end
    open
  end