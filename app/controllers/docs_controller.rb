class DocsController < ApplicationController
    def index
    end
    
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
        end
        
        def doc_params
            params.require(:doc).permit(:title, :content)
        end    

end
