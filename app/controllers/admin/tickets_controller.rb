class Admin::TicketsController < Admin::BaseController
  before_action :authenticate_user!
  before_action :find_ticket, only: [:show, :edit, :update, :destroy]

  def index
    @tickets = Ticket.all
  end

  def show
    @train = @ticket.train
  end

  def new
    @ticket = Ticket.new
  end

  def edit; end
  
  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      redirect_to admin_ticket_path(@ticket)
    else
      render :new
    end
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to admin_ticket_path(@ticket)
    else
      render :edit
    end
  end

  def destroy
    @ticket.destroy
    redirect_to admin_tickets_path
  end

  private

  def ticket_params
    params.require(:ticket).permit(:number, :fio, :passport_data, :first_station_id, :last_station_id, :train_id, :user_id)
  end

  def find_ticket
    @ticket = Ticket.find(params[:id])
  end
end
