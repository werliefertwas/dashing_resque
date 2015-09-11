module DashingResque
  module Jobs
    module FailedJobs
      extend DashingResque::Job

      class << self
        def data
          queues = Resque.redis.smembers('queues').sort

          items = failure_queues(queues).map do |queue|
            {
              queue: queue,
              value: Resque.redis.llen(failure_queues[queue]).to_i
            }
          end

          { items: items }
        end

        private

        def failure_queues(queues)
          queues.map do |queue|
            [queue, Resque::Failure.failure_queue_name(queue)]
          end.to_h
        end
      end
    end
  end
end
