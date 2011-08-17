LOGS_DIR="./log"
RUBY_BIN="ruby"

def run_cuke()
    clean_log =  %x{ rm -f #{(LOGS_DIR+"/*").to_s} }
    bi = %x{#{RUBY_BIN} -S bundle install}
    files = Dir.glob("features/*.feature")
    files.each do |feat|
        print "*"*100 + "\nTesting Feature: " + feat.to_s + "\n" + "_"*100 + "\n"
	p "#{RUBY_BIN} -S rake features FEATURE=#{feat.to_s}  --trace"
        p %{echo ' #{RUBY_BIN} -S rake features FEATURE=#{feat.to_s}  --trace >> #{LOGS_DIR+"/"+feat.to_s+"log"}' }
        log_file = LOGS_DIR + "/" + feat.split('/')[1].split('.')[0] + ".log"
        rake_feature = %x{ #{RUBY_BIN} -S rake features FEATURE=#{feat.to_s}  --trace >> #{log_file} }
        echo_pgbrk = %x{echo '' >> #{log_file}}
    end
    p "cuke logs can be viewed at ./log dir"
end

run_cuke
