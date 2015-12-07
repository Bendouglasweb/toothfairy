require 'rubygems'
require 'sinatra'
require 'mongo'
require 'json/ext'

configure do
  db = Mongo::Client.new([ 'localhost:3001' ], :database => 'meteor')  
  set :mongo_db, db[:posts]

  set :log_db, db[:log] 
end


set :bind, '0.0.0.0'
set :port, 4000

get '/' do
	'Hello world!'
end


get '/new/:key/:upper/:lower/:posterior' do
  	if (params[:key] == "AA")
		
		content_type :json
		db = settings.mongo_db
		db.insert_one({	:upper=>params[:upper],
				:lower=>params[:lower],
				:posterior=>params[:posterior],
				:pid=>(Time.new.to_i.to_s + Random.rand(1..1000).to_s),
				:status=>"notcomplete"
				})
		
		db = settings.log_db	
		db.insert_one({:request_time=>Time.now.to_s,:request_ip=>request.ip,:auth=>"true",:upper=>params[:upper],:lower=>params[:lower],:posterior=>params[:posterior]})
		#document_by_id(params[:id])
		'Your IP is: ' + request.ip + ". And the time is " + Time.now.to_s
	else
		db = settings.log_db	
		db.insert_one({:request_time=>Time.now.to_s,
					:request_ip=>request.ip,
					:auth=>"false",
					:attempted_key=>params[:key],
					:upper=>params[:upper],
					:lower=>params[:lower],
					:posterior=>params[:posterior]
				})
		'Access Denied'
	end
end


helpers do
  # a helper method to turn a string ID
  # representation into a BSON::ObjectId
  def object_id val
    begin
      BSON::ObjectId.from_string(val)
    rescue BSON::ObjectId::Invalid
      nil
    end
  end

  def document_by_id id
    id = object_id(id) if String === id
    if id.nil?
      {}.to_json
    else
      document = settings.mongo_db.find(:_id => id).to_a.first
      (document || {}).to_json
    end
  end
end
