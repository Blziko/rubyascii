#!/usr/bin/env ruby

require 'optparse'

ASCII_DIR = File.join(__dir__, 'ascii')

options = {}

OptionParser.new do |opts|
    opts.banner = "Usage: rubyascii [--ascii=<number>]"
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
        puts "ASCII file not found: #{File.basename(path)}"
    end
end

if options[:ascii]
    file_path = File.join(ASCII_DIR, "#{options[:ascii]}.txt")
    show_file(file_path)
else
    files = list_ascii_files

    if files.empty?
        puts "No ASCII files found in /ascii directory."
        exit
    end

    random_file = files.sample
    show_file(random_file)
end