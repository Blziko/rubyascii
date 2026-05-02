#!/usr/bin/env ruby

require 'optparse'

ASCII_DIR = File.join(__dir__, 'ascii')

options = {}

OptionParser.new do |opts|
    opts.banner = "\033[1;31m[!] \033[0mUsage: \033[0;32mrubyascii \033[1;90m[\033[0;32m--ascii=\033[1;90m<\033[0;36mnumber\033[1;90m>]\033[0m"
    opts.on("--ascii=<number>", "Show specific ASCII file (without .txt)") do |name|
        options[:ascii] = name
    end
end.parse!

def list_ascii_files
    Dir.glob(File.join(ASCII_DIR, "*.txt"))
end

def show_file(path)
    if File.exist?(path)
        puts File.read(path)
    else
        puts "\033[1;31m[!] \033[0mASCII file: \033[0;32m#{File.basename(path)} \033[0mnot found!"
    end
end

if options[:ascii]
    file_path = File.join(ASCII_DIR, "#{options[:ascii]}.txt")
    show_file(file_path)
else
    files = list_ascii_files

    if files.empty?
        puts "\033[1;31m[!] \033[0mNo ASCII files found in: \033[0;32m/ascii\033[0m"
        exit
    end

    random_file = files.sample
    show_file(random_file)
end