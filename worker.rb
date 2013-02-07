class ResqueTestWorker
  @queue = :test_queue

  def self.perform
    50.times do
      puts "Real time:      : #{Time.now.to_s}"
      puts "Cache faker time: #{CacheFaker.get_cache.inspect}"
      puts "Ram eater:      : #{CacheFaker.get_ram_eater.size}"
      puts
      sleep 10
    end
  end
end
