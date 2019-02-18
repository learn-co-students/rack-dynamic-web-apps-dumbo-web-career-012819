# Dyamic Web App w/ Rack

1. Translate a command line Ruby app to a dynamic web app
2. Use the `#write` method in a `Rack::Response` object to make a dynamic web app in Rack

First, set up your basic Rack app:

```ruby
class Application

  def call(env)
    resp = Rack::Response.new
    resp.write "Hello, World"
    resp.finish
  end

end
```

# Then run:
$ rackup config.ru

# You should see something like:
```shell
[2016-07-28 10:09:08] INFO  WEBrick 1.3.1
[2016-07-28 10:09:08] INFO  ruby 2.3.0 (2015-12-25) [x86_64-darwin15]
[2016-07-28 10:09:08] INFO  WEBrick::HTTPServer#start: pid=38967 port=9292
```

# put this url in your browser
http://localhost:9292

Lets say you wanted to build a slots game generator,
you would first need to generatethree numbers between 1 and 20. You could do that like this:

**NOTE**: Don't sweat the `Kernel` bit — [Kernel](http://ruby-doc.org/core-2.3.0/Kernel.html)
is a module that holds many of Ruby's most useful bits. We're just using it here to generate some random numbers.

```ruby
num_1 = Kernel.rand(1..20)
num_2 = Kernel.rand(1..20)
num_3 = Kernel.rand(1..20)
```

Then, to check to see if you won or not,
add an if statement like this:

```ruby
num_1 = Kernel.rand(1..20)
num_2 = Kernel.rand(1..20)
num_3 = Kernel.rand(1..20)

if num_1==num_2 && num_2==num_3
  puts "You Win"
else
  puts "You Lose"
end
```

# How to make the above work on the web?
All that needs to change to adapt this for the web is a different way than `puts` to express output to our user.

That means adding it to our response.

Instead of `puts` now we'll use the `#write` method in our `Rack::Response` object.

```ruby
class Application

  def call(env)
    resp = Rack::Response.new

    num_1 = Kernel.rand(1..20)
    num_2 = Kernel.rand(1..20)
    num_3 = Kernel.rand(1..20)

    if num_1==num_2 && num_2==num_3
      resp.write "You Win"
    else
      resp.write "You Lose"
    end

    resp.finish
  end

end
```

The `#write` method can be called many times to build up the full response.

The response isn't sent back to the user until `#finish` is called.

```ruby
class Application

  def call(env)
    resp = Rack::Response.new

    num_1 = Kernel.rand(1..20)
    num_2 = Kernel.rand(1..20)
    num_3 = Kernel.rand(1..20)

    resp.write "#{num_1}\n"
    resp.write "#{num_2}\n"
    resp.write "#{num_3}\n"

    if num_1==num_2 && num_2==num_3
      resp.write "You Win"
    else
      resp.write "You Lose"
    end

    resp.finish
  end

end
```
