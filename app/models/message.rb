class Message < ApplicationRecord
  after_create :send_to_firebase

  def send_to_firebase
    FIREBASE.push("message", { :id => self.id, :body => self.body, :'.priority' => 1, :timestamp => self.created_at })
  end
end
