module DashingResque
  module Job
    def schedule(interval, options = {})
      rufus_opts = options.reverse_merge(first_in: 0)
      SCHEDULER.every(interval, **rufus_opts) do
        send_event("resque_#{ancestors.first.name.demodulize.underscore}", **data)
      end
    end
  end
end
