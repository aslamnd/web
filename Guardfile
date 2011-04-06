group 'all' do
  guard 'ego' do
     watch(%r{Guardfile})
  end

  guard 'shell' do
    watch(%r{db/schema.rb}) do
      `rake db:test:prepare`
    end
  end

  guard 'bundler' do
    watch(%r{Gemfile})
  end
end

group 'backend' do
  guard 'spork', cucumber: false, wait: 60 do
    watch('config/application.rb')
    watch('config/environment.rb')
    watch(%r{^config/environments/.*\.rb$})
    watch(%r{^config/initializers/.*\.rb$})
    watch('spec/spec_helper.rb')
    watch('spec/factories/*.rb')
  end

  # https://github.com/guard/guard-cucumber
  guard 'cucumber', cli: "FAILFAST=true" do
    watch(%r{features/.+\.feature})
    watch(%r{features/support/.+})          { 'features' }
  end

  # https://github.com/guard/guard-rspec
  guard 'rspec', version: 2, cli: '--color --format documentation --fail-fast --drb' do
    watch(%r{spec/(.*)_spec.rb})
    watch(%r{spec/spec_helper.rb})                       { "spec" }
    
    watch(%r{app/(.*)\.rb})                              { |m| "spec/#{m[1]}_spec.rb" }
    watch(%r{config/routes.rb})                          { "spec/routing" }
    watch(%r{app/controllers/application_controller.rb}) { "spec/controllers" }
    watch(%r{spec/factories\.rb})                        { "spec/models" }
  end
end

group 'frontend' do
  guard 'compass' do
    watch(%r{src/(.*)\.s[ac]ss})
  end

  guard 'livereload' do
    watch(%r{app/.+\.(erb|haml)})
    watch(%r{app/helpers/.+\.rb})
    watch(%r{public/.+\.(css|js|html)})
    watch(%r{config/locales/.+\.ym})
  end

  guard 'passenger', ping: 'foo' do
    watch(%r{lib/.*\.rb})
    watch(%r{config/.*\.rb})
  end
end
