SHEL_LOG="twrak.log"
RUBY_BIN="ruby"

def run_cuke()
    clean_log =  %x{echo '' > #{SHEL_LOG}}
    bi = %x{#{RUBY_BIN} -S bundle install}
    files = Dir.glob("features/*.feature")
    files.each do |feat|
        print "*"*100 + "\nTesting Feature: " + feat.to_s + "\n" + "_"*100 + "\n"
	p "#{RUBY_BIN} -S rake features FEATURE=#{feat.to_s}  --trace"
        rake_feature = %x{#{RUBY_BIN} -S rake features FEATURE=#{feat.to_s}  --trace >> #{SHEL_LOG}}
        echo_pgbrk = %x{echo '' >> #{SHEL_LOG}}
    end
end

run_cuke
