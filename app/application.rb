class Application

  def call(env)
    resp = Rack::Response.new
    resp.write "Hello, World"
    resp.write "You Win"
    resp.finish
  end

end
