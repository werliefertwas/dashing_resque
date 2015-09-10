module DashingResque
  module Jobs
    module QueuedJobs
      extend DashingResque::Job

      def self.data
        queues = Resque.redis.smembers('queues').sort

        items = queues.map do |queue|
          {
            queue: queue,
            value: Resque.redis.llen("queue:#{queue}").to_i
          }
        end

        { items: items }
      end
    end
  end
end
