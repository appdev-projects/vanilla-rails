class PiecesController < ApplicationController
  before_action :set_piece, only: %i[ show edit update destroy ]

  # GET /pieces or /pieces.json
  def index
    @pieces = Piece.all
  end

  # GET /pieces/1 or /pieces/1.json
  def show
  end

  # GET /pieces/new
  def new
    @piece = Piece.new
  end

  # GET /pieces/1/edit
  def edit
  end

  # POST /pieces or /pieces.json
  def create
    @piece = Piece.new(piece_params)

    respond_to do |format|
      if @piece.save
        format.html { redirect_to piece_url(@piece), notice: "Piece was successfully created." }
        format.json { render :show, status: :created, location: @piece }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @piece.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pieces/1 or /pieces/1.json
  def update
    respond_to do |format|
      if @piece.update(piece_params)
        format.html { redirect_to piece_url(@piece), notice: "Piece was successfully updated." }
        format.json { render :show, status: :ok, location: @piece }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @piece.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pieces/1 or /pieces/1.json
  def destroy
    @piece.destroy

    respond_to do |format|
      format.html { redirect_to pieces_url, notice: "Piece was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_piece
      @piece = Piece.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def piece_params
      params.require(:piece).permit(:pieceowner_id, :teamcolor, :piecetype, :points)
    end
end
