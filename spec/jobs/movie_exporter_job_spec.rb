require 'rails_helper'

RSpec.describe MovieExporterJob, type: :job do
  describe "#perform_later" do
    it "exports cvs with movies" do
      ActiveJob::Base.queue_adapter = :test
      expect {
        MovieExporterJob.perform_later('export')
      }.to have_enqueued_job
    end
  end
end
