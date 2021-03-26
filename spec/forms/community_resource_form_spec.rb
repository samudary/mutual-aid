require 'rails_helper'

RSpec.describe CommunityResourceForm do
  let(:params) {{
    name: 'Free breakfast program',
    description: 'Feed the people!',
    publish_from: '1969-01-01',
    location: {
      city: 'Oakland',
      location_type: LocationType.first,
    },
    organization_attributes: {
      name: 'Black Panther Party',
    },
  }}

  describe 'creating a new community resource' do
    let(:community_resource) { CommunityResourceForm.build params }

    it 'populates a new community resource' do
      expect(community_resource.name).to eq 'Free breakfast program'
      expect(community_resource.description).to eq 'Feed the people!'
      expect(community_resource.publish_from).to eq Date.new(1969, 1, 1)
    end

    it 'populates an associated organization' do
      expect(community_resource.organization.name).to eq 'Black Panther Party'
    end

    it 'populates an associated location' do
      expect(community_resource.location.city).to eq 'Oakland'
    end

    context 'when location is omitted' do
      before { params.delete :location }

      it 'does not populate an associated location' do
        expect(community_resource.location).to be nil
      end
    end

    describe 'on save' do
      it 'persists the new community resource with new associated records' do
        expect { community_resource.save! }.to(
          change(CommunityResource, :count).by(1).and(
          change(Organization, :count).by(1)).and(
          change(Location, :count).by(1))
        )
      end

      context 'with validation errors' do
        before do
          params[:description] = ''
          params[:location].delete :location_type
          params[:organization_attributes][:name] = ''

          community_resource.save
        end

        it 'gathers errors from nested models' do
          expect(community_resource.errors.keys).to include(:description, :location, :"organization.name")
        end
      end
    end
  end

  describe 'updating an existing community resource' do
    let!(:existing) { CommunityResourceForm.build(params).tap{|o| o.save! } }

    let(:update_params) {{
      id: existing.id,
      name: 'new name',
      description: 'new description',
      publish_from: existing.publish_from.to_s,
      location: {
        city: 'new city',
        location_type: existing.location.location_type_id,
      },
      organization_attributes: {
        name: 'new org'
      },
    }}

    let(:community_resource) { CommunityResourceForm.build update_params }

    it 'applies updated attributes' do
      expect(community_resource.name).to eq 'new name'
      expect(community_resource.description).to eq 'new description'
      expect(community_resource.location.city).to eq 'new city'
      expect(community_resource.organization.name).to eq 'new org'
    end
  end
end
