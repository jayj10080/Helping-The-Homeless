require 'firebase'

base_uri = 'https://passion-chat.firebaseio.com/'
secret_key = ENV["FIREBASE_SECRET_KEY"]
FIREBASE = Firebase::Client.new(base_uri, secret_key)

# require 'firebase'

# base_uri = 'https://passion-chat.firebaseio.com/'
# secret_key = "RlXMIgFYUq9rt0xeybjEluroTAqy8xFNMB9H1CRU"
# firebase = Firebase::Client.new(base_uri, secret_key)

# response = firebase.push("message", { :id => 2, :body => 'Bye!!!', :'.priority' => 1 })
# # puts response.success? # => true
# # puts response.code # => 200
# # puts response.body # => { 'name' => "-INOQPH-aV_psbk3ZXEX" }
# # puts response.raw_body # => '{"name":"-INOQPH-aV_psbk3ZXEX"}'