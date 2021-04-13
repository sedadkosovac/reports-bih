class ReportItemsController < ApplicationController
  before_action :set_report
  before_action :set_report_item, only: %i[ show edit update destroy ]

  # GET /report_items or /report_items.json
  def index
    @report_items = @report.report_items.all
  end

  # GET /report_items/1 or /report_items/1.json
  def show
  end

  # GET /report_items/new
  def new
    @report_item = @report.report_items.build
  end

  # GET /report_items/1/edit
  def edit
  end

  # POST /report_items or /report_items.json
  def create
    @report_item = @report.report_items.build(report_item_params)

    respond_to do |format|
      if @report_item.save
        format.html { redirect_to report_report_items_path(@report), notice: "Report item was successfully created." }
        format.json { render :show, status: :created, location: @report_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @report_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /report_items/1 or /report_items/1.json
  def update
    respond_to do |format|
      if @report_item.update(report_item_params)
        format.html { redirect_to report_report_items_path(@report), notice: "Report item was successfully updated." }
        format.json { render :show, status: :ok, location: @report_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @report_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /report_items/1 or /report_items/1.json
  def destroy
    @report_item.destroy
    respond_to do |format|
      format.html { redirect_to report_report_items_path(@report), notice: "Report item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
   
    def set_report
      @report = Report.find(params[:report_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_report_item
      @report_item = @report.report_items.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def report_item_params
      params.require(:report_item).permit(:amount, :report_id)
    end
end
