class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(params.require(:schedule).permit(:title, :start_day, :end_day, :all_day, :memo))
    if @schedule.save
      flash[:notice] = "ユーザーを新規登録しました"
      redirect_to :schedules
    else
      render "new"
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

   def update
      @schedule = Schedule.find(params[:id])
      if @schedule.update(params.require(:schedule).permit(:title, :start_day, :end_day, :all_day, :memo))
        flash[:notice] = "スケジュールを更新しました"
        redirect_to :schedules
      else
        flash[:notice] = "スケジュールを更新できませんでした"
        render "edit"
      end
    end


    def destroy
      @schedule = Schedule.find(params[:id])
      @schedule.destroy
      flash[:notice] = "ユーザーを削除しました"
      redirect_to :schedules
    end
end