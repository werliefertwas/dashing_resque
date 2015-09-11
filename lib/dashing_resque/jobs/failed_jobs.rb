module DashingResque
  module Jobs
    module FailedJobs
      extend DashingResque::Job

      def self.data
        queues = Resque.redis.smembers('queues').sort

        failure_queues = queues.map do |queue|
          [queue, Resque::Failure.failure_queue_name(queue)]
        end.to_h

        items = queues.map do |queue|
          {
            queue: queue,
            value: Resque.redis.llen(failure_queues[queue]).to_i
          }
        end

        { items: items }
      end
    end
  end
end
