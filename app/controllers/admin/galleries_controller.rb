class Admin::GalleriesController < Admin::AdminController
  include PermitConcern

  permit gallery: Gallery::PARAMS

  def index
    @entries =
      Gallery
        .where(user: current_user)
        .paginate(page: params.fetch(:page, 1), per_page: 2)

    respond_to do |f|
      f.html
    end
  end

  def edit
    @entry = Gallery.where(user: current_user).find(params[:id])

    respond_to do |f|
      f.html
    end
  end

  def new
    @entry = Gallery.new(user_id: current_user.id)

    respond_to do |f|
      f.html do
        render :edit
      end
    end
  end

  def create
    @entry = Gallery.new(permitted_params(:gallery).merge(user_id: current_user.id))

    respond_to do |f|
      f.html do
        if @entry.save
          flash[:notice] = t('saved')
          render :edit
        else
          flash[:notice] = t('msg.cant_create_collection')
          render :edit, status: :unprocessable_entity
        end
      end
    end
  end

  def update
    @entry = Gallery.where(user: current_user).find(params[:id])
    respond_to do |f|
      f.html do
        if @entry.update_attributes(permitted_params(:gallery))
          flash[:notice] = t('saved')
          render :edit
        else
          flash[:notice] = t('msg.cant_save_collection')
          render :edit, status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    @entry = Gallery.where(user: current_user).find(params[:id])

    respond_to do |f|
      f.html do
        if @entry.destroy
          flash[:notice] = t('msg.collection_destroyed')
          redirect_to action: :index
        else
          flash[:errors] = t('msg.cant_destroy_collection')
          render :edit, status: :unprocessable_entity
        end
      end
    end
  end
end
