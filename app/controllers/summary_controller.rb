class SummaryController < ApplicationController
  def index
  end

  def show
    @topic = Topic.find(params[:topic_id])
    @post = @topic.post.find(params[:post_id])
    @summary = @post.summary
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @summary = Summary.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @summary = Summary.new(params.require(:summary).permit(:description))
    @summary.post = @post
    if @summary.save!
      flash[:notice] = "Your summary was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving your post's summary."
      render :new
    end
  end
end
