require 'spec_helper'

RSpec.describe ProjectsController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }

  before do
    sign_in(user)
  end

  it "" do

  end

  context "standard users" do
    { new: :get,
      create: :post,
      edit: :get,
      update: :put,
      destroy: :delete }.each do |action, method|
        it "cannot access the #{action} action" do
          sign_in(user)
          send(method, action, params: { id: FactoryGirl.create(:project) })
          expect(response).to redirect_to(root_path)
          expect(flash[:alert]).to eql("You must be an admin to do that.")
        end
      end
  end

  it "it cannot access the show action without permission" do
    project = FactoryGirl.create(:project)
    get :show, params: { id: project.id }

    expect(response).to redirect_to(projects_path)
    expect(flash[:alert]).to eql("The project you were looking for could not be found.")
  end
end


