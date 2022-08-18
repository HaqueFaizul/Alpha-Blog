class ArticlesController < ApplicationController

	before_action	:get_article, only:[:show,:edit,:update,:destroy]

	def home
		
	end
	def index
		@article=Article.all
	end

	def about

	end
	def show
		#@article=Article.find(params[:id])
	end

	def new
		@article=Article.new
	end

	def edit
		#@article=Article.find(params[:id])
	end

	def create
		#render plain: params[:article]
		@article=Article.new(get_param)
		#render plain: @article.inspect
		if @article.save
			flash[:notice]="Successfully Created the article"
			redirect_to article_path(@article)
		else
			render 'new'
		end
	end

	def update
		#@article=Article.find(params[:id])
		if @article.update(get_param)
			flash[:notice]="Successfully updated the article"
			redirect_to article_path(@article)
		else
			render 'edit'
		end
	end
	def destroy
		#@article=Article.find(params[:id])
		@article.destroy
		redirect_to articles_path
	end

	private

	def get_article
		@article=Article.find(params[:id])
	end

	def get_param
		params.require(:article).permit(:title,:description)
	end
end
#CRUD operation for Article: