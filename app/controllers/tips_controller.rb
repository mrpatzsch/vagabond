class TipsController < ApplicationController
  def index
    @tips = Tip.all 
    render json: @tips
  end

  def new
    @tip = Tip.new
    @user = current_user
  end

  def create
    @tip = Tip.new(tip_params)
    @user = User.find(params[:user_id])
    if @tip.save
      @user.tips << @tip
      redirect_to @user
    else
      render :new
    end
  end
  
  def show
    @tip = Tip.find(params[:id])
    user_id = @tip.user_id
    @user = User.find(user_id)
  end

  def edit
    @current_user = current_user
    if @current_user.id = params[:user_id]
      @tip = Tip.find(params[:id])
      puts @tip
    end
  end

  def update
    @tip = Tip.find(params[:id])
    if @tip.update(tip_params)
      redirect_to tip_path(@tip)
    else
      render :edit
    end
  end

  def destroy
    @tip = Tip.find(params[:id])
    @tip.delete
    redirect_to user_path
  end

  private
    def find_user
      @user = User.find(params[:user_id])
    end

    def find_tip
      @tip = Tip.find(params[:id])
    end
    
    def tip_params 
      params.require(:tip).permit(:title, :content)
    end
end
