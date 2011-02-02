# config/initializers/time_formats.rb
Time::DATE_FORMATS[:date] = ->(time) { time.strftime("%B #{time.day.ordinalize}, %Y") }
