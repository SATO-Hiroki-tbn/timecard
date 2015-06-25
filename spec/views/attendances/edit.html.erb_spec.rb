require 'rails_helper'

RSpec.describe "attendances/edit", type: :view do
  before(:each) do
    @attendance = assign(:attendance, Attendance.create!(
      :user_id => 1,
      :in_time => "MyString",
      :out_time => "MyString",
      :project_name => "MyString",
      :place => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit attendance form" do
    render

    assert_select "form[action=?][method=?]", attendance_path(@attendance), "post" do

      assert_select "input#attendance_user_id[name=?]", "attendance[user_id]"

      assert_select "input#attendance_in_time[name=?]", "attendance[in_time]"

      assert_select "input#attendance_out_time[name=?]", "attendance[out_time]"

      assert_select "input#attendance_project_name[name=?]", "attendance[project_name]"

      assert_select "input#attendance_place[name=?]", "attendance[place]"

      assert_select "textarea#attendance_description[name=?]", "attendance[description]"
    end
  end
end
