class DocsController < ApplicationController
    before_action :find_doc, only: [:show, :edit, :update, :destroy]
    
    # display all documents by newest created
    def index
        @docs = Doc.all.order("created_at DESC")
    end
    
    # find document by its id and display its title & contents
    def show
    end
    
    # create new document with its parameters title & content
    def create
        @doc = Doc.new(doc_params)
        
        # if document is sucessfully saved, redirect to the new document
        if @doc.save
            redirect_to @doc
        # if document is not saved, render form again to create new document
        else   
            render 'new'
        end    
    end
    
    # new document view
    def new
        @doc = Doc.new
    end
    
    def update
    end
    
    def edit
    end
 
    def destroy
    end
    
    private
    
        def find_doc
            @doc = Doc.find(params[:id])
        end
        
        def doc_params
            params.require(:doc).permit(:title, :content)
        end    

end
