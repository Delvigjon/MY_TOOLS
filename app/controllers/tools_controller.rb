class ToolsController < ApplicationController
  before_action :set_tool, only: [:show, :edit, :update, :destroy]

  def index
    @tools = Tool.all
  end

  def new
    @tool = Tool.new
  end

  def show
  end

  def create
    @tool = Tool.new(tool_params)
    @tool.user = current_user
    if @tool.save
      redirect_to tools_path, notice: "L'annonce a été créée avec succès."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @tool.update(tool_params)
      redirect_to @tool, notice: "L'annonce a été mise à jour avec succès."
    else
      render :edit
    end
  end

  def destroy
    @tool = Tool.find(params[:id])
    @tool.destroy
    redirect_to tools_path, notice: "L'annonce a été supprimée avec succès."
  end

  private

  def set_tool
    @tool = Tool.find(params[:id])
  end

  def tool_params
    params.require(:tool).permit(:name, :description, :city, :image)
  end
end
