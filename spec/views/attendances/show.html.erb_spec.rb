require 'rails_helper'

RSpec.describe "attendances/show", type: :view do
  before(:each) do
    @attendance = assign(:attendance, Attendance.create!(
      :user_id => 1,
      :in_time => "In Time",
      :out_time => "Out Time",
      :project_name => "Project Name",
      :place => "Place",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/In Time/)
    expect(rendered).to match(/Out Time/)
    expect(rendered).to match(/Project Name/)
    expect(rendered).to match(/Place/)
    expect(rendered).to match(/MyText/)
  end
end
