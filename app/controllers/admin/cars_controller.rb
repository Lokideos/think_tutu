class Admin::CarsController < Admin::BaseController
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  before_action :set_train, only: [:create, :new]

  def index
    @cars = Car.all
  end

  def show; end

  def new
    @car = Car.new
  end

  def edit; end

  def create
    @car = @train.cars.new(car_params)

    if @car.save
      redirect_to admin_train_path(@train)
    else
      render :new
    end
  end

  def update
    if @car.update(car_params)
      redirect_to admin_car_path(@car)
    else
      render :edit
    end
  end

  def destroy
    @car.destroy

    redirect_to admin_cars_path
  end

  private

  def car_params
    params.require(:car).permit(:number, :top_seats, :bottom_seats, :side_top_seats, :side_bottom_seats, :seat_only_places, :type)
  end

  def set_car
    @car = Car.find(params[:id])
  end

  def set_train
    @train = Train.find(params[:train_id])
  end
end
