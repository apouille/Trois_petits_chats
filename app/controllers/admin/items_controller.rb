class Admin::ItemsController < AdminController
  def index
    @items = Item.all.order(:id).reverse
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(title: params[:title],
                       description: params[:description],
                       price: params[:price],
                       author: params[:author],
                       view: params[:view],
                       dimension: params[:dimension],
                       image_url: params[:image_url]
                       )
    @item.item_picture.attach(params[:item_picture])

    if @item.save # essaie de sauvegarder en base @item
      redirect_to admin_item_path(@item.id), :success => "Item créé !"
    else
      render 'new'
    end
  end

  def update
    @item = Item.find(params[:id])
    item_params = params.permit(:title, :description, :price, :image_url, :author, :view, :dimension)

    if params[:item_picture] != nil
      @item.item_picture.attach(params[:item_picture])
    end

      if @item.update(item_params)
        redirect_to admin_item_path(@item.id), :notice => "Item mis à jour"
      else
        render :show
      end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to admin_items_path
  end

end
