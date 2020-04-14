namespace :crawl do
  task :cia_for, [:option, :foo, :bar] do |task, args|
    puts "work", args
    SearchTerms.update_with args
  end
end