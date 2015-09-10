# DashingResque

This gem provides widgets and jobs to displayed queued/failed Resque jobs in Dashing.

## Installation

Add this line to your application's `Gemfile`:

```ruby
gem 'dashing_resque'
```

Add this to your `config.ru`:

```ruby
require 'dashing_resque'
require 'sinatra'
DashingResque.init
```

Require the scripts in your `application.coffee`:

```coffee
#= require dashing_resque/assets/widgets
```

Require the styles in your `application.css`:

```scss
//=require dashing_resque/assets/widgets
```

Schedule the jobs in `jobs/resque.rb`

```ruby
DashingResque::Jobs::FailedJobs.schedule '30s', first_in: 0
DashingResque::Jobs::QueuedJobs.schedule '30s', first_in: 0
```

Use the widgets in your dashboard:

```html
<li data-row="1" data-col="1" data-sizex="1" data-sizey="1">
  <div data-id="resque_queued_jobs" data-view="ResqueList" data-title="Queued Resque Jobs" data-total-prefix="Total: "></div>
</li>

<li data-row="1" data-col="2" data-sizex="1" data-sizey="1">
  <div data-id="resque_failed_jobs" data-view="ResqueList" data-title="Failed Resque Jobs" data-total-prefix="Total: "></div>
</li>
```

## Configuration

Configure the redis url in `config/resque.html`:

```yaml
development:
  redis_url: redis://localhost:6379
production:
  redis_url: redis://someotherhost:6379
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/werliefertwas/dashing_resque.
