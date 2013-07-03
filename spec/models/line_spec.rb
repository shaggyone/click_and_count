require 'spec_helper'

describe Line do
  it { should validate_presence_of :data }
  it { should allow_mass_assignment_of :data }
  it { should_not allow_mass_assignment_of :id }
  it { should_not allow_mass_assignment_of :created_at }
  it { should_not allow_mass_assignment_of :updated_at }
end
