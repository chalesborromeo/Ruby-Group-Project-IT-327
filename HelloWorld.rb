#Printing "Hello, World!" in the simplest way
puts "Hello, World!"

#Lambda function to print "Hello, World!"
say_hello = ->(message) { puts message }

say_hello.call("Hello, World!")