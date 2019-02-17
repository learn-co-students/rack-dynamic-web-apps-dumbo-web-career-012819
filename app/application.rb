class Application

  def call(env)
    resp = Rack::Response.new

    num1 = Kernel.rand(1..2)
    num2 = Kernel.rand(1..2)
    num3 = Kernel.rand(1..2)

    resp.write "You got #{num1} \n"
    resp.write "You got #{num2} \n"
    resp.write "You got #{num3} \n"


    if num1 == num2 && num2 == num3
      resp.write "You Win"
    else
      resp.write "You Lose"
    end

    resp.finish
  end

end
