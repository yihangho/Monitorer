desc "Performs polling."
task :poll => :environment do
  Site.all.each do |site|
    response = nil
    time_taken = nil

    begin
      Timeout::timeout(5) do
        time_taken = Benchmark.measure do
          response = RestClient.get(site.url)
        end
      end

      site.polls.create(:status_code => response.code, :load_time => time_taken.real)
    rescue
      site.polls.create(:status_code => -1, :load_time => -1)
    end
  end
end
