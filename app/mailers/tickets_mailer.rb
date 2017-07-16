class TicketsMailer < ApplicationMailer
  def buy_ticket(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: user.email, subject: 'You have bought the ticket')
  end

  def cancel_ticket(user, ticket)
    @user = user
    @ticket = ticket
    @route_name = @ticket.route_name
    mail(to: user.email, subject: 'You have cancelled the ticket')
  end
end
