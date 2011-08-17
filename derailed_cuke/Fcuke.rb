LOGS_DIR="./log"
RUBY_BIN="rvm 1.9.2"
#RUBY_BIN="ruby"

def run_cuke(verbose, save_log)
    clean_log =  %x{ rm -f #{(LOGS_DIR+"/*").to_s} } if save_log
    bi = %x{#{RUBY_BIN} -S bundle install}
    files = Dir.glob("features/*.feature")
    files.each do |feat|
        print "*"*75 + "\nTesting Feature: " + feat.to_s + "\n" + "_"*25 + "\n"
        log_file = LOGS_DIR + "/" + feat.split('/')[1].split('.')[0] + ".log"
	echo_log = "Derailed Cuke ~\n"
        if save_log then
          rake_feature = %x{ #{RUBY_BIN} -S rake features FEATURE=#{feat.to_s}  --trace >> #{log_file} }
          echo_pgbrk = %x{echo '' >> #{log_file}}
          echo_log = %x{cat #{log_file}}
	  echo_log = "*"*25 + "\n#{echo_log}\n" + "*"*75 + "\n" 
        else
          rake_feature = %x{ #{RUBY_BIN} -S rake features FEATURE=#{feat.to_s}  --trace}
	  echo_log = "*"*25 + "\n#{rake_feature}\n" + "*"*75 + "\n" 
        end
	print echo_log if verbose
    end
    print "\ncuke logs can be viewed at ./log dir\n" if save_log
end

def executioner
  help=false
  verbose=false
  save_log=true

  ARGV.each do |arg|
    if arg=="-h" or arg=="--help" then
      print <<help
      []  to just run all features stored in ./features/ dir and store results in ./log dir 
        syntax: $ruby -S Fcuke.rb
      [] to run all features in verbose result mode and save results in ./log also
        syntax: $ruby -S Fcuke.rb -v
      [] to run all features in verbose result mode but not save results in ./log dir
        syntax: $ruby -S Fcuke.rb -v --nolog
      [] to run all features with no result i.e. nor verbose & neither savein in ./log dir
        syntax: $ruby -S Fcuke.rb --nolog
      [] to show this help
        syntax: $ruby -S Fcuke.rb -h|--help
Note: '--nolog' feature would mean no operation in ./log dir i.e. it wouldn't even remove older logs
help
      help=true
    else
      verbose=true if arg=="-v"
      save_log=false if arg=="--nolog"
    end
  end

  run_cuke verbose, save_log  unless help==true
end

executioner
