require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
        #binding.pry
        erb :"../views/super_hero"
    end

    post '/teams' do
        @team_name = params[:team][:name]
        @team_motto = params[:team][:motto]

        @team_members = params[:team][:members]
        @member_names = []
        @member_powers = []
        @member_bios = []

        params[:team][:members].each do |member|
            @member_names << member[:name]
            @member_powers << member[:power]
            @member_bios << member[:biography]
        end
        
        erb :"../views/team"
    end

end
