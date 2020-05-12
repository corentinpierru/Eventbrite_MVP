class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]
  def index
    @event = Event.all
  end

  def new

  end

  def show
    @event = Event.find(params['id'])
  end
  
  def create
    puts "$" * 60
    puts params
    puts "$" * 60
    @event_new = Event.new(start_date: params['start_date'], duration: params['duration'], title: params['title'], description: params['description'], price: params['price'], location: params['location'], administrator: current_user)
    a = @event_new.save
    puts "$" * 60

    if @event_new.save
      redirect_to root_path
    else
      flash[:danger]
      render :new
    end
  end
end
