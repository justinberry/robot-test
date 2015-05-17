require 'robot'
require 'control_panel'

@is_on_table = false

control_panel = ControlPanel.new(Robot.new)

puts "Usage: [PLACE X Y FACING|LEFT|RIGHT|MOVE|REPORT]"
while STDIN.gets
  command = $_.upcase.strip
  case command.split[0]
  when "PLACE"
    args = command.split
    next if args.length < 4
    control_panel.place(args[1].to_i, args[2].to_i, args[3].strip)
    @is_on_table = true
  when "LEFT"
    next if !@is_on_table
    control_panel.left()
  when "RIGHT"
    next if !@is_on_table
    control_panel.right()
  when "MOVE"
    next if !@is_on_table
    control_panel.move()
  when "REPORT"
    next if !@is_on_table
    control_panel.report()
  else
    puts "Invalid command '#{command}'"
  end
end
