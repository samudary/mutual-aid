 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/submission_responses", type: :request do
  # SubmissionResponse. As you add validations to SubmissionResponse, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      SubmissionResponse.create! valid_attributes
      get submission_responses_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      submission_response = SubmissionResponse.create! valid_attributes
      get submission_response_url(submission_response)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_submission_response_url
      skip # TODO
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      submission_response = SubmissionResponse.create! valid_attributes
      get edit_submission_response_url(submission_response)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new SubmissionResponse" do
        expect {
          post submission_responses_url, params: { submission_response: valid_attributes }
        }.to change(SubmissionResponse, :count).by(1)
      end

      it "redirects to the created submission_response" do
        post submission_responses_url, params: { submission_response: valid_attributes }
        expect(response).to redirect_to(submission_response_url(SubmissionResponse.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new SubmissionResponse" do
        expect {
          post submission_responses_url, params: { submission_response: invalid_attributes }
        }.to change(SubmissionResponse, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post submission_responses_url, params: { submission_response: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested submission_response" do
        submission_response = SubmissionResponse.create! valid_attributes
        patch submission_response_url(submission_response), params: { submission_response: new_attributes }
        submission_response.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the submission_response" do
        submission_response = SubmissionResponse.create! valid_attributes
        patch submission_response_url(submission_response), params: { submission_response: new_attributes }
        submission_response.reload
        expect(response).to redirect_to(submission_response_url(submission_response))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        submission_response = SubmissionResponse.create! valid_attributes
        patch submission_response_url(submission_response), params: { submission_response: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested submission_response" do
      submission_response = SubmissionResponse.create! valid_attributes
      expect {
        delete submission_response_url(submission_response)
      }.to change(SubmissionResponse, :count).by(-1)
    end

    it "redirects to the submission_responses list" do
      submission_response = SubmissionResponse.create! valid_attributes
      delete submission_response_url(submission_response)
      expect(response).to redirect_to(submission_responses_url)
    end
  end
end