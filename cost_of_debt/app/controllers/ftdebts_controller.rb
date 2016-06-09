class FtdebtsController < ApplicationController
  def index
    @ftdebts = current_user.ftdebts
  end

  def show
    @ftdebt = Ftdebt.find(params[:id])
  end

  def new
    @ftdebt = Ftdebt.new
  end

  def create
    @ftdebt = Ftdebt.new
    @ftdebt.accountname = params[:accountname]
    @ftdebt.debt_apr = params[:debt_apr]
    @ftdebt.debt_balance = params[:debt_balance]
    @ftdebt.debt_term = params[:debt_term]
    @ftdebt.user_id = params[:user_id]

    if @ftdebt.save
      redirect_to "/ftdebts", :notice => "Ftdebt created successfully."
    else
      render 'new'
    end
  end

  def edit
    @ftdebt = Ftdebt.find(params[:id])
  end

  def update
    @ftdebt = Ftdebt.find(params[:id])

    @ftdebt.accountname = params[:accountname]
    @ftdebt.debt_apr = params[:debt_apr]
    @ftdebt.debt_balance = params[:debt_balance]
    @ftdebt.debt_term = params[:debt_term]
    @ftdebt.user_id = params[:user_id]

    if @ftdebt.save
      redirect_to "/ftdebts", :notice => "Ftdebt updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @ftdebt = Ftdebt.find(params[:id])

    @ftdebt.destroy

    redirect_to "/ftdebts", :notice => "Ftdebt deleted."
  end
end
