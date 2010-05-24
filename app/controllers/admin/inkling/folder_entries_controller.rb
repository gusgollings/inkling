class Admin::Inkling::FolderEntriesController < Admin::Inkling::BaseController

  before_filter :get_root

  def index
    @content_types = Inkling::Content::Types.listed
    @folder_entry = Inkling::FolderEntry.new
  end

  def update_tree
    new_parent_id = params[:new_parent]
    child_id = params[:child]
    new_parent = Inkling::FolderEntry.find(new_parent_id)
    child = Inkling::FolderEntry.find(child_id)
    child.move_to_child_of new_parent
  end

  private
  def get_root
    @root = Inkling::Folder.find_by_name("/").folder_entry
  end
end
