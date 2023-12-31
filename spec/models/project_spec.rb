#遅延ステータス
describe "late status" do
  # 締切日が過ぎていれば遅延していること
  it "is late when the due date is past today" do
    project = FactoryBot.create(:project_due_yesterday)
    expect(project).to be_late
  end
  
  # 締切日が今日ならスケジュールどおりであること
  it "is on time when the due date is today" do
    project = FactoryBot.create(:project_due_today)
    expect(project).to_not be_late
  end
  
  # 締切日が未来ならスケジュールどおりであること
  it "is on time when the due date is in the future" do
    project = FactoryBot.create(:project_due_tomorrow)
    expect(project).to_not be_late
  end
end
