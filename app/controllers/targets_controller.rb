# typed: strict
# frozen_string_literal: true

class TargetsController < ApplicationController
  before_action :set_target, only: [:show, :edit, :update, :destroy]

  # GET /targets or /targets.json
  sig { void }
  def index
    @targets = T.let(Target.all, T.nilable(ActiveRecord::Relation))
  end

  # GET /targets/1 or /targets/1.json
  sig { void }
  def show
  end

  # GET /targets/new
  sig { void }
  def new
    @target = Target.new
  end

  # GET /targets/1/edit
  sig { void }
  def edit
  end

  # POST /targets or /targets.json
  sig { void }
  def create
    @target = Target.new(target_params)

    respond_to do |format|
      if @target.save
        format.html { redirect_to target_url(@target), notice: "Target was successfully created." }
        format.json { render :show, status: :created, location: @target }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @target.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /targets/1 or /targets/1.json
  sig { void }
  def update
    respond_to do |format|
      if T.must(@target).update(target_params)
        format.html { redirect_to target_url(@target), notice: "Target was successfully updated." }
        format.json { render :show, status: :ok, location: @target }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: T.must(@target).errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /targets/1 or /targets/1.json
  sig { void }
  def destroy
    T.must(@target).destroy!

    respond_to do |format|
      format.html { redirect_to targets_url, notice: "Target was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  sig { void }
  def set_target
    @target = T.let(Target.find(params[:id]), T.nilable(Target))
  end

  # Only allow a list of trusted parameters through.
  sig { returns(ActionController::Parameters) }
  def target_params
    params.require(:target).permit(:name, :program_url)
  end
end
