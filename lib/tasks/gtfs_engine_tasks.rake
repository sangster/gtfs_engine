require 'colorize'

namespace :gtfs_engine do
  desc 'Update sources'
  task :update, [:name] => :environment do |_, args|
    GtfsReader.config do
      skip_parsing true
      verbose true
    end

    if args.name
      GtfsReader.update args.name
    else
      GtfsReader.update_all!
    end
  end

  namespace :sets do
    desc 'List the data sets for each source'
    task list: :environment do
      GtfsEngine::DataSet.distinct.pluck(:name).each do |name|
        list_source_data_sets name
      end
    end

    desc 'Delete a data set and all the models from it'
    task :delete, [:name, :etag] => :environment do |_, args|
      set = GtfsEngine::DataSet.find_by name: args.name, etag: args.etag
      name, etag = [args.name.to_s.light_blue, args.etag.yellow]

      if set
        set.delete
        puts "Destroyed #{name} data set with etag #{etag}"
      else
        error = 'Error:'.red
        puts "#{error} Could not find #{name} data set with etag #{etag}"
      end
    end

    desc 'Count the number of models in a data set'
    task :count, [:name, :etag] => :environment do |_, args|
      set = GtfsEngine::DataSet.find_by name: args.name, etag: args.etag
      name, etag = [args.name.to_s.light_blue, args.etag.yellow]
      puts "Model count for #{name} data set with etag #{etag}"

      width = model_lists.inject(0) {|max, n| [max, n.to_s.length].max }
      model_lists.each do |list|
        count = set.send(list).count
        puts "\t#{list.to_s.rjust(width).yellow}: #{count}"
      end
    end
  end
end

def list_source_data_sets(name)
  puts name.underline.green

  sets = GtfsEngine::DataSet.where(name: name).order :created_at
  if sets.count == 0
    puts "\tnone".light_black
  else
    sets.each do |s|
      puts "\t#{s.etag.light_blue}: #{s.created_at.to_s.cyan} (#{s.url.yellow})"
    end
  end
end

def model_lists
  @model_lists ||= begin
    has_many = GtfsEngine::DataSet.reflect_on_all_associations(:has_many)
    has_many.collect &:name
  end
end
