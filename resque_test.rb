require 'rubygems'
require 'resque'
require 'sinatra/base'
require './worker.rb'

class CacheFaker
  def self.init_cache
    @ram_eater = []
    100000.times do
      string = ''
      32.times { string << ('a'..'z').to_a.sample }
      @ram_eater << string.to_sym
    end
    @cache = Time.now.to_s
  end

  def self.get_cache
    @cache ||= 'Not cached.'
  end

  def self.get_ram_eater
    @ram_eater ||= nil
  end
end

class ResqueTest < Sinatra::Base
  get '/' do
    Resque.enqueue(ResqueTestWorker)
    erb :index
  end
end
