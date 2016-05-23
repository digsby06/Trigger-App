require 'phidgets-ffi'

class TimeController < ApplicationController
  #   time_check_never_stop = true
  #   setup = false
  #   counter = 1
  #   ambient_button = 1
  #   last_press_time = Time.now


 	# def self.timecheck
 	# 	while time_check_never_stop
  #       	TimeController.check_time
  #       	sleep(5)  
  #   	end
  #   	puts "test123"
 	# end

 	# def self.check_time
  #       if setup == false
  #           t = Time.now
  #           setup = true
  #       end

  #       t2 = Time.now + 10
  #       puts t2

  #       if t2 >= ($last_press_time + 30)
  #           MainController.activate_relay(ifkit, $ambient_button)            
  #           if $ambient_button === 6
  #               $ambient_button = 1
  #           end

  #       else 
  #           $ambient_button += 1
  #       end
  #   end

end
