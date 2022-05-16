# frozen_string_literal: true

class OrderMailer < ApplicationMailer
  default from: 'kitten@example.com'

  def complete_order
    @user = params[:user]
    mail(to: @user.email, subject: 'Order successfully created!')
  end
end
