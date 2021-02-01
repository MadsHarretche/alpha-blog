class SourcesController < ApplicationController
  
  def show
    @source = Source.find(params[:id])
    
    
    
  end
  
  def index
  end
  
  def new
    @source_types = SourceType.all
    @source_type = SourceType.where(id: params[:source_type_id]).first
  end
  
  
  def edit
  end
  
  def create
    @source = Source.new(params.permit(:author_firstname, :author_middlename, :author_lastname, :book_title, :edition_number, :city_name, :publisher_name, :publication_year, :chapter, :page)) 
    
    if @source.save!
        flash[:notice] = "Source was created successfully!"
        
        render 'show'
      #Kan forkortes:
      #redirect_to (@article)
      else
        render 'home'
      end
  end
  
  
  def update
  end
  
  private 
    def initial
      author_firstname = author_firstname.initialize
    end
  
    
end
