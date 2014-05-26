
module Dictuby
  class Runner
    def self.execute args
      new(args).run
    end

    def initialize args
      @options = ArgsParser.parse(args)
      @config = DictubyConfig.new
      @args = args

      @sources = [SlovnikSK, SlovnikCZ, DictCC]
      @source_names = @sources.inject([]) {|r,s| r << s.name}
      @dsources = @config.get('disabled_sources') || []

      @dicts = @sources.inject([]) do |r, s|
        r << s.dicts.keys unless @dsources.include?(s.name)
        r
      end
      @dicts.flatten!.sort!
    end

    def run
      if @options[:list_dicts]
        @dicts.each_slice(6) do |d1, d2, d3, d4, d5, d6|
          puts "#{d1}  #{d2}  #{d3}  #{d4}  #{d5} #{d6}"
        end
      elsif @options[:set]
        if @dicts.include?(@options[:set])
          @config.set('dictionary', @options[:set])
        else
          puts 'Invalid dictionary'
        end
      elsif @options[:get]
        puts @config.get('dictionary')
      elsif @options[:list_sources]
        @source_names.each do |name|
          puts "%{name} - %{status}" % {
            :name => name,
            :status => @dsources.include?(name) ? 'Disabled' : 'Enabled'
          }
        end
      elsif @options[:enable]
        if !@source_names.include?(@options[:enable])
          puts 'Invalid source'
        elsif @dsources.include?(@options[:enable])
          @dsources.delete(@options[:enable])
          @config.set('disabled_sources', @dsources)
          puts 'Source enabled'
        else
          puts 'Source already enabled'
        end
      elsif @options[:disable]
        if !@source_names.include?(@options[:disable])
          puts 'Invalid source'
        elsif @dsources.include?(@options[:disable])
          puts 'Source already disabled'
        else
          @dsources << @options[:disable]
          @config.set('disabled_sources', @dsources)
          puts "Source disabled"
        end
      else
        if @args.size == 1
          dict, query = @config.get('dictionary'), @args[0]
        elsif @args.size == 2
          dict, query = *@args
        end

        map = @sources.inject({}) do |r,p| 
          p.dicts.keys.each {|d| r[d] = p}; r
        end

        if map.include?(dict)
          puts query
          map[dict].lookup(dict, query).each do |word|
            puts "- #{word}"
          end
        else
          puts 'Invalid dictionary'
        end
      end
    end
  end
end
