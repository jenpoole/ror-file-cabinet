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
    
    # update an existing document
    def update
        # if document is sucessfully updated, redirect to the document
        if @doc.update(doc_params)
            redirect_to @doc
        # if document is not updated, render form again to edit document
        else
            render 'edit'
        end    
    end
    
    # find document by its id and edit its contents
    def edit
    end
 
    # find document by its id and delete it, then redirect to all documents index
    def destroy
        @doc.destroy
        redirect_to docs_path
    end
    
    private
    
        def find_doc
            @doc = Doc.find(params[:id])
        end
        
        def doc_params
            params.require(:doc).permit(:title, :content)
        end    

end
