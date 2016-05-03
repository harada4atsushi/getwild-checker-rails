class TopsController < ApplicationController
  def show
    @training_set = TrainingSet.new
  end

  def judge
    training_set = TrainingSet.new(training_set_params)
    training_set.save
    @training_set = TrainingSet.new

    output = `python learning/main_predict.py "#{training_set.text}"`
    is_getwild = output.strip.last.to_i
    Rails.logger.debug("output: #{output}")
    Rails.logger.debug("result: #{is_getwild}")

    if !$?.success?
      @result = "診断に失敗しました"
    elsif is_getwild == 0
      @result = "「#{training_set.text}」はGetWildではありません。"
    elsif is_getwild == 1
      @result = "「#{training_set.text}」はGetWildです。"
    end

    render :show
  end

  private
    def training_set_params
      params.require(:training_set).permit(:text)
    end
end
