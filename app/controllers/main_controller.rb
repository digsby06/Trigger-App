require 'phidgets-ffi'

class MainController < ApplicationController

	def index
		@events = Section.all
		@audio = Audio.all
		@main_section = Section.main_section.decorate if Section.main_section
		@second_section = Section.second_section.decorate if Section.second_section
		@third_section = Section.third_section.decorate if Section.third_section
		@no_sections_found = Section.main_section.nil?
	end

	def trigger
        button_id = params[:button_id]
        options = { :serial_number => 403823 }
        ifkit = Phidgets::InterfaceKit.new(options)
        ifkit.wait_for_attachment 5000
       
        if  ifkit.outputs.size > 0
            activate_relay(ifkit, button_id)

            # How to test for success
            @stat = Stat.find_or_create_by(button_id: button_id, date:DateTime.now.to_date)
            @stat.count += 1
            @stat.save
            render json: @stat
        else
            render json: {"error": "No device attached"}
        end
        ifkit.close
    rescue => error
        ifkit.close
    end

    def stats
        days_back = params[:days_back] || 30
        @stats = []
        today = DateTime.now.to_date
        for d in (0..days_back) do
            date = today - d.days
            data = [0,0,0,0,0,0]
            total = 0
            for i in (1..6) do
                count = 0
                stats = Stat.where(date:date, button_id: i)
                if stats.first
                    count = stats.first.count
                end
                data[i] = count
                total += count
            end
            data[0] = total
            @stats << {:date => date, :data => data}
        end
    end

    
    private
    
    def button_params
        params.require(:button_id)
    end



    def activate_relay(ifkit, button_id)
        relay = ifkit.outputs[button_id.to_i]
        current_time = Time.now
        start_ambient_mode = 1

    
        
            case button_id.to_i - 1
      
                when 0
                    relay_0 = ifkit.outputs[0]
                    puts "Alternating for 30 seconds"
                    8.times do
                        relay_0.state = false
                        relay.state = true
                        sleep(1.seconds)

                        relay_0.state = true
                        relay.state = false
                        sleep(1.seconds)
                    end

                    relay_0.state = false
                    relay.state = false
                    puts "Finished"
                    last_press_time = Time.now
                    puts last_press_time

                when 1
                    puts "Turning on for 30 seconds"
                    relay.state = true
                    sleep(16.seconds)
                    
                    puts "Shutting off"
                    relay.state = false
                    last_press_time = Time.now


                when 2
                    puts "Turning on for 30 seconds"
                    relay.state = true
                    sleep(12.seconds)
                    
                    puts "Shutting off"
                    relay.state = false
                    last_press_time = Time.now
                
                when 3
                    puts "Blinking for 30 seconds"
                    15.times do
                        relay.state = true
                        sleep(0.5.seconds)
                        
                        relay.state = false
                        sleep(0.5.seconds)
                    end
                    puts "Finished"
                    last_press_time = Time.now

                when 4..5
                    puts "Turning on for 30 seconds"
                    relay.state = true
                    sleep(15.seconds)
                    
                    puts "Shutting off"
                    relay.state = false
                    last_press_time = Time.now
                
            end

           end



        if TimeDifference.between(last_press_time, current_time).in_minutes === start_ambient_mode

            puts "Cycling through all events"
           
            i = 0

            until i > 5 do
            ambient_mode = ifkit.outputs[i]
            i += 1
            end

            puts "Ambient Relay Complete"
            last_press_time = Time.now
        end
      

    end


    # def send_message(button_id)
    #     require 'socket'

    #     server_ip = '192.168.10.10'
    #     server_port = 5000

    #     connection = TCPSocket.open(server_ip, server_port)

    #     connection.puts "\"Track#{button_id}.wav\"PL\x0d"
    #     connection.close
    # end

  def time_trigger
        self.delay(:run_at)
  end
    
end
