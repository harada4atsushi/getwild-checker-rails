class TrainingSetsController < ApplicationController
  before_action :set_training_set, only: [:destroy, :getwild, :not_getwild]

  def index
    @training_sets = TrainingSet.where('label is null')
  end

  def destroy
    @training_set.destroy
    redirect_to training_sets_url, notice: '削除しました'
  end


  def getwild
    if @training_set.update(label: 1)
      redirect_to training_sets_url, notice: '更新しました'
    end
  end

  def not_getwild
    if @training_set.update(label: 0)
      redirect_to training_sets_url, notice: '更新しました'
    end
  end

  private
    def set_training_set
      @training_set = TrainingSet.find(params[:id])
    end

    def training_set_params
      params.require(:training_set).permit(:text)
    end

end
