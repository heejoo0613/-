class PostsController < ApplicationController
    before_action :authenticate_user!, except: [:index]
    before_action :find_post, only: [:show, :edit, :update, :destroy]
    before_action :admin_or_user, only: [:destroy]
    before_action :only_user, only: [:edit, :update]

    def index
      @posts = Post.paginate(:page => params[:page], :per_page => 10)
    end
      
    def new 
        @post = Post.new
    end
     
    def edit    
    end
      
    def show    
    end
     
    def create  
        @post = Post.new(post_params)
    
        if @post.save
        redirect_to @post
        else    
        render 'new' 
        end
    end

    def update  
    
        if @post.update(post_params)
            redirect_to @post  
        else 
            render 'edit'  
        end
    end

    private  
    def admin_or_user
        unless current_user.has_role?(:admin) or @post.user == current_user
          redirect_to :back
        end
    end
    
    def only_user
        unless @post.user == current_user
          redirect_to :back
        end
    end

    
        def find_post
           @post = Post.find(params[:id]) 
        end
    
        def post_params    
            params.require(:post).permit(:title, :content)
        end
end



