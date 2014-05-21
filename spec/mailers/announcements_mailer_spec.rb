require "spec_helper"

describe AnnouncementsMailer do
  describe "announcement_alert" do
    let(:mail) { AnnouncementsMailer.announcement_alert }

    it "renders the headers" do
      mail.subject.should eq("Announcement alert")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
