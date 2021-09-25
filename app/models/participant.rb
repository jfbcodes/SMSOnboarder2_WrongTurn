class Participant < ApplicationRecord

  # Callbacks
  # =====================
  before_validation -> { self.authy_id = self.create_user_in_authy }
  after_create -> { self.send_code }

  def create_user_in_authy
    response = Authy::API.register_user(
      email: self.email,
      cellphone: self.phone,
    )
    return response['id']
  end

  def send_code
    Authy::API.request_sms(id: self.authy_id)
  end

end
