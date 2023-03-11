class PostsController < ApplicationController
  before_action :set_q, only: [:index, :search]

  def index
    @posts = Post.all.order(created_at: :desc)

    #投稿一覧画面で新規投稿を行うので、formのパラメータ用にPostオブジェクトを取得
    @post = current_user.posts.new

    @result_posts = @q.result.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    #投稿詳細に関連付けてあるコメントを全取得
    @comments = @post.comments
    #投稿詳細に関連付けてある「いいね！」を全取得
    @likes = @post.likes
    #投稿詳細画面でコメントの投稿を行うので、formのパラメータ用にCommentオブジェクトを取得
    @comment = current_user.comments.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(create_params)
    if @post
      flash[:notice] = "投稿が完了しました"
      #コメント送信後は、一つ前のページへリダイレクトさせる。
      redirect_back(fallback_location: root_path)
    else
      #同上
      redirect_back(fallback_location: root_path)
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(update_params)
      flash[:notice] = "編集が完了しました"
      redirect_to post_path(@post.id)
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
  end

  #ransack
  # def search
  #   @results= @q.result
  # end

  private

  def create_params
    params.require(:post).permit(:content, :user_id)
  end

  def update_params
    params.require(:post).permit(:content)
  end

  #ransack
  def set_q
    @q = Post.ransack(params[:q])
  end
end
