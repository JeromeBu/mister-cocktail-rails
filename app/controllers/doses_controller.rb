class DosesController < ApplicationController

  before_action :find_cocktail, only: [:new, :create]
  before_action :find_dose, only: [:destroy, :update, :edit]

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail

    # Test ajaxify

    if @dose.save
      respond_to do |format|
        format.html { redirect_to cocktail_path(@cocktail) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'cocktails/show' }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    end

    # ligne to put back if not working:

    # if @dose.save
    #   redirect_to cocktail_path(@cocktail)
    # else
    #   render 'cocktails/show'
    # end
  end

  def edit
  end

  def update
    if @dose.update(dose_params)
      redirect_to cocktail_path(@cocktail)
    else
      render :edit
    end
  end

  def destroy
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def find_dose
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
  end

  def dose_params
    params.require(:dose).permit(:ingredient_id, :description)
  end
end
