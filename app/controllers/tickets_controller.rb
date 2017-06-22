class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_ticket, only: [:show, :edit, :update, :destroy]

  def index
    @tickets = current_user.tickets
  end

  def show
    @train = @ticket.train
  end

  def new
    @ticket = Ticket.new
  end

  def edit; end

  def create
    @ticket = current_user.tickets.new(ticket_params)

    if @ticket.save
      redirect_to @ticket
    else
      render :new
    end
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to @ticket
    else
      render :edit
    end
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_path
  end

  private

  def ticket_params
    params.require(:ticket).permit(:number, :fio, :passport_data, :departure_time, :first_station_id, :last_station_id, :train_id)
  end

  def find_ticket
    @ticket = Ticket.find(params[:id])
    redirect_to root_path, notice: "You don't have enough permissions to view this page" unless @ticket.user_id == current_user.id
  end
end
