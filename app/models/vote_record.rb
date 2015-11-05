class VoteRecord < ActiveRecord::Base
belongs_to :voter
end
  def self.record_one_vote(poll, voter, vote_value)
    some_vote = find_by_poll_id_and_voter_id(question.id, voter.id)
    if some_vote == nil
      new_vote = VoteRecord.new
      new_vote.voter_id = voter.id
      new_vote.poll_id = poll.id
      #logger.log "Voter #{voter.id} answering #{vote_value} to question #{question.id}"
      if vote_value == "yes"
        new_vote.is_yes = 1
      elsif vote_value == "no"
        new_vote.is_yes = 0
        # otherwise, value is NULL (for abstention)
      end
      new_vote.save
    end
  end

  def self.record_votes(votes, voter)
    return if votes == nil
    votes.each do |q_id, vote_value|
      if (p = Poll.find(p_id)) != nil && vote_value != "no_vote"
        record_one_vote(p, voter, vote_value)
      end
    end
  end