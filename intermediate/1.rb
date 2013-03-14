class Organiser
  Event = Struct.new(:eventName, :startTime, :endTime)

  def initialize
    @eventList = Array.new
  end
  
  def add(eventName, startTime, endTime)
    @eventList.push(Event.new(eventName, startTime, endTime))
  end
  
  def addMenu
    print "Enter event name: "
    eventName = gets.chomp.rstrip
    print "Enter event start time: "
    startTime = gets.chomp.strip
    print "Enter event end time: "
    endTime = gets.chomp.strip
    
    add(eventName, startTime, endTime)

    puts
    puts @eventList.length.to_s + ": " + eventName + " from " + startTime + " to " + endTime + " added."
    puts
  end
  
  def delete(eventId)
    @eventList.delete_at(eventId)
  end

  def deleteMenu
    if not @eventList.empty?
      viewMenu
      print "Enter event id: "
      eventId = gets.chomp.to_i-1
      print "Are you sure you want to delete " + view(eventId) + "? [y|n]: "
      deleteChoice = gets.chomp.strip.downcase
      if deleteChoice == 'y'
        puts "Event deleted."
        delete(eventId)
        if @eventList.empty?
          puts "No events remaining."
        else
          viewMenu
        end
      else
        puts "No changes made."
      end
    else
      puts "No events."
    end
    puts
  end
  
  def edit(eventId, eventName, startTime, endTime)
    event = @eventList[eventId]
    event.eventName, event.startTime, event.endTime = eventName, startTime, endTime
  end

  def editMenu
    viewMenu
    if @eventList.empty?
      return
    end
    
    eventId = 0
    print "Enter event id: "
    eventId = gets.chomp.to_i-1
    if not (eventId >= 0 and eventId < @eventList.length)
      puts
      puts "Event id not found."
      puts
      return
    end      
    
    puts eventId
    puts "Current event details: " + view(eventId)
    
    print "Change event name? [y|n]: "
    nameChange = gets.chomp.downcase
    if nameChange == 'y'
      print "Enter new event name: "
      eventName = gets.chomp.rstrip
    elsif nameChange == 'n'
      eventName = @eventList[eventId].eventName
    end
      
    print "Change event start time? [y|n]: "
    startChange = gets.chomp.downcase
    if startChange == 'y'
      print "Enter new start time: "
      startTime = gets.chomp.strip
    elsif startChange == 'n'
      startTime = @eventList[eventId].startTime
    end
    
    print "Change event end time? [y|n]: "
    endChange = gets.chomp.downcase
    if endChange == 'y'
      print "Enter new end time: "
      endTime = gets.chomp.strip
    elsif endChange == 'n'
      endTime = @eventList[eventId].endTime
    end
    
    edit(eventId, eventName, startTime, endTime)

    puts
    puts "Updated event details: " + view(eventId)
    puts
  end
  
  def viewMenu
    if not @eventList.empty?
      for eventId in 0...@eventList.length
        puts view(eventId)
      end
    else
      puts "No events."
    end
    puts
  end
  
  def view(eventId)
    event = @eventList[eventId]
    return (eventId+1).to_s + ": " + event.eventName + " from " + event.startTime + " to " + event.endTime
  end
  
  def menu
    while true
      puts "1. Add an event."
      puts "2. Edit an event."
      puts "3. Delete an event."
      puts "4. View event."
      puts "5. Exit."
      print "Enter your choice: "
      choice = gets.chomp
      puts
      case choice
        when "1"
          addMenu
        when "2"
          editMenu
        when "3"
          deleteMenu
        when "4"
          viewMenu
        when "5"
          break
      end
    end
  end
end

organiser1 = Organiser.new
organiser1.menu
