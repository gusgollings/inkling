require File.dirname(__FILE__) + '/../spec_helper'

describe Inkling::FoldersController do

  let(:folder) {Inkling::Folder.new :name => "folder1"}

  it "should create a new folder" do
    post 'create', {:folder => {:name => "folder1"}}
    Inkling::Folder.should_receive(:new).with(:name => "folder1").and_return
  end
end
