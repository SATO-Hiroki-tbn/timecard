require 'rails_helper'

RSpec.describe "attendances/index", type: :view do
  before(:each) do
    assign(:attendances, [
      Attendance.create!(
        :user_id => 1,
        :in_time => "In Time",
        :out_time => "Out Time",
        :project_name => "Project Name",
        :place => "Place",
        :description => "MyText"
      ),
      Attendance.create!(
        :user_id => 1,
        :in_time => "In Time",
        :out_time => "Out Time",
        :project_name => "Project Name",
        :place => "Place",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of attendances" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "In Time".to_s, :count => 2
    assert_select "tr>td", :text => "Out Time".to_s, :count => 2
    assert_select "tr>td", :text => "Project Name".to_s, :count => 2
    assert_select "tr>td", :text => "Place".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
