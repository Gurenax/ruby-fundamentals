# Using some of the features in the past couple of problems, start thinking about it coding a basic PTV app (like our public transport app, if you aren't familiar). I'm happy to give hints, or you can get together and help each other. You need to simplify things, so only dummy up one or at most two lines at first (or at last). The final product (coded, or just pseudo-coded) would take a user input of an origin station, and a destination station, and return a data structure that contains the stops to pass through, and the line changes if required. Perhaps restrict the user input so there cannot be an error returned (the only stations they choose are valid - or assume this, but say if that's your choice). Start with one train line, represented by an array. If you extend it to two lines, you need to think about how to represent the lines as data, and this might be a complex object. Think through all the options before coding, and even perhaps pen and paper. You will need some way to carry the user data through the method/s, and some way to represent the MTR. You will likely need several small methods, and will likely have to employ a full range of data types, such as hashes and arrays (and possibly arrays of arrays). I am more than happy to help out anyone stuck, particularly if they have a specific question where they are stuck, and have thought about it. I'm also happy to look through any code people would like examined.

def find_string_in_array(arr, str)
    arr.index(str)
end

def determine_line(ptv_line_data, station_name)
    line_index = -1

    # Check every line if station exists on that line
    while find_string_in_array(ptv_line_data[line_index], station_name).nil?
        line_index += 1
    end

    # Return the line (e.g. 0-Lilydale Line, 1-Belgrave Line, 2-Pakenham Line)
    line_index
end

def determine_station_and_line(ptv_line_data, station_name)
    line_index = -1
    station_index = nil

    # Check every line if station exists on that line
    while station_index.nil?
        line_index += 1
        station_index = find_string_in_array(ptv_line_data[line_index], station_name)
    end

    # Return station and line
    result = {
        line_index: line_index,
        station_index: station_index
    }
end

# Get all stations from that line only, given the start and end station
def get_same_line_stops(line, start_station_index, end_station)
    stops = Array.new
    end_station_index = find_string_in_array(line, end_station)
    line[start_station_index..end_station_index-1].each { |station|
        stops << station
    }
    stops
end

# Get all stations from junction point to it's leftmost station
def get_left_stations(train_line, station)
    stops = Array.new
    station_index = find_string_in_array(train_line, station)
    station_index.downto(0) { |left_station|
        stops << train_line[left_station]
    }
    stops
end

# Get all stations from junction point to it's rightmost station
def get_right_stations(train_line, station)
    stops = Array.new
    station_index = find_string_in_array(train_line, station)
    station_index.upto(train_line.size-1) { |right_station|
        stops << train_line[right_station]
    }
    stops
end

# Method that finds the intersecting station and returns an array of stops
# from start index to furthest station of the junction
#
# This method can be recursed () but for simplicity sake
# Possible recursion is to use these as parameter:
# stops_from_start_to_junction_left
# stops_from_start_to_junction_right
#
def find_every_intersecting_station(ptv_line_data, line_to_be_checked, line_to_be_checked_index)
    stops = Array.new

    # Every station on that line
    line_to_be_checked.each { |station|
        # Every other line
        ptv_line_data.each_with_index { |line, index|
            
            # Start line shouldn't be the same line
            if line_to_be_checked != line

                # Junction found
                if !find_string_in_array(line, station).nil?

                    #Get stops from start position to junction
                    stops_from_start_to_junction = get_same_line_stops(line_to_be_checked, line_to_be_checked_index, station)

                    #For each line get left path
                    stops_from_junction_to_left = get_left_stations(ptv_line_data[index], station)

                    #For each line get right path
                    stops_from_junction_to_right = get_right_stations(ptv_line_data[index], station)

                    #Concatenate starting point to each junction up to its last station
                    stops_from_start_to_junction_left = stops_from_start_to_junction + stops_from_junction_to_left
                    stops_from_start_to_junction_right = stops_from_start_to_junction + stops_from_junction_to_right

                    stops << stops_from_start_to_junction_left
                    stops << stops_from_start_to_junction_right
                    
                end
            end
        }
    }
    stops
end

# Method to sort array of arrays by length
def sort_array_by_length_of_contents(arr)
    arr.sort_by { |x|
        x.length
    }
end

# Delete arrays in an array with length
# def delete_items_in_array_with_length(arr, length)
#     arr = arr.reject { |x|
#         x.length==length
#     }
#     arr
# end

# Find furthest start and furthest end of a train line
def find_furthest_point_of_every_station(ptv_line_data)
    furthest_points = Array.new
    ptv_line_data.each { |line|
        furthest_points << line[0]
        furthest_points << line[-1]
    }
    # Furthest points should be unique. Repeats will be deleted
    furthest_points.uniq
end

def find_shortest_path(all_routes, origin, destination)
    shortest_path = Array.new
    origin_index = nil
    destination_index = nil

    # puts "All Possible Routes: "
    all_routes.uniq.each { |stops|
        # p stops

        if shortest_path.empty?

            # Populate the origin index and destination index
            origin_index = find_string_in_array(stops, origin)
            destination_index = find_string_in_array(stops, destination)

            # Check if the origin and destination are in the stop
            if !origin_index.nil? and !destination_index.nil?
                shortest_path = stops.clone
            end
        end
    }

    shortest_path[origin_index..destination_index]
end

# Main method
def ride_ptv(data)

    start_data = determine_station_and_line(data[:ptv_line], data[:origin])
    start_line_index = start_data[:line_index]
    start_station_index = start_data[:station_index]
    all_routes = Array.new
    furthest_points = Array.new

    # Find furthest point of every station (Start/End stations of each train line)
    furthest_points = find_furthest_point_of_every_station(data[:ptv_line])

    # Determine the train line where you start
    start_line = data[:ptv_line][start_line_index]

    # Append Main Line to All Routes. It's a given that the main line from start to end is one of our options
    all_routes << data[:ptv_line][start_line_index]

    # Find every station that intersects with the start line
    find_every_intersecting_station(data[:ptv_line], start_line, start_line_index).each { |stop_data|
        all_routes << stop_data
    }

    # Find every station that insersects with the station that intersected with the start line
    stops_intersection = all_routes.clone
    stops_intersection.each { |junction_line|
        station_count = junction_line.size
        
        0.upto(station_count-1) { |each_station_in_junction_line|
            find_every_intersecting_station(data[:ptv_line], junction_line, each_station_in_junction_line).each { |junction_stops|
                
                # All further routes should start with the start station
                if junction_stops[0]==data[:ptv_line][start_line_index][0]

                    # All further routes should not end with the start station
                    if junction_stops[-1]!=data[:ptv_line][start_line_index][0]

                        # All further routes should end with the furthest point
                        # Therefore, furthest point should exist on the furthest points array
                        if !find_string_in_array(furthest_points, junction_stops[-1]).nil?
                            all_routes << junction_stops
                        end
                    end
                end
            }
        }
    }
    
    # Sort items in array by length of contents
    all_routes = sort_array_by_length_of_contents(all_routes)

    # Find shortest path in all routes
    shortest_path = find_shortest_path(all_routes, data[:origin], data[:destination])
end

# Test Data:
# line1 = [
#     "A", "B", "C", "D", "E"
# ]
# line2 = [
#     "F", "G", "D", "H", "I"
# ]
# line3 = [
#     "J", "K", "L", "M", "H"
# ]
# line4 = [
#     "N", "O", "C", "P", "Q", "L", "R"
# ]

# Actual Data:
lilydale_to_city = [
    "Lilydale", "Mooroolbark", "Croydon", "Ringwood East", "Ringwood", "Heatherdale", "Mitcham", "Nunawading", "Blackburn", "Laburnum", "Box Hill", "Mont Albert", "Surrey Hills", "Chatham", "Canterbury", "East Camberwell", "Camberwell", "Auburn", "Glenferrie", "Hawthorn", "Burnley", "East Richmond", "Richmond", "Flagstaff", "Melbourne Central", "Parliament", "Flinders Street","Southern Cross"
]
belgrave_to_city = [
    "Belgrave", "Tecoma", "Upwey", "Upper Ferntree Gully", "Ferntree Gully", "Boronia", "Bayswater", "Heathmont", "Ringwood", "Heatherdale", "Mitcham", "Nunawading", "Blackburn", "Laburnum", "Box Hill", "Mont Albert", "Surrey Hills", "Chatham", "Canterbury", "East Camberwell", "Camberwell", "Auburn", "Glenferrie", "Hawthorn", "Burnley", "East Richmond", "Richmond", "Flagstaff", "Melbourne Central", "Parliament", "Flinders Street", "Southern Cross"
]
pakenham_to_city = [
    "Pakenham", "Cardinia Road", "Officer", "Beaconsfield", "Berwick", "Narre Warren", "Hallam", "Dandenong", "Yarraman", "Noble Park", "Sandown Park", "Springvale", "Westall", "Clayton", "Huntingdale", "Oakleigh", "Hughesdale", "Murrumbeena", "Carnegie", "Caulfield", "South Yarra", "Richmond", "Flagstaff", "Melbourne Central", "Parliament", "Flinders Street", "Southern Cross" 
]
craigieburn_to_city = [
    "Craigieburn", "Roxburgh Park", "Coolaroo", "Broadmeadows", "Jacana", "Glenroy", "Oak Park", "Pascoe Vale", "Strathmore", "Glenbervie", "Essendon", "Moonee Ponds", "Ascot Vale", "Newmarket", "Kensington", "North Melbourne", "Flagstaff", "Melbourne Central", "Parliament", "Flinders Street", "Southern Cross"
]
werribee_to_north_melbourne = [ # Suppose that the line is not servicing the city loop
    "Werribee", "Hoppers Crossing", "Williams Landing", "Aircraft", "Laverton", "Newport", "Spotswood", "Yarraville", "Seddon", "Footscray", "South Kensington", "North Melbourne"
]

ptv_journey = {
    # origin: "Auburn",
    # destination: "Southern Cross",
    # origin: "Southern Cross",
    # destination: "Auburn",
    # origin: "A",
    # destination: "L",
    origin: "Auburn",
    destination: "Footscray",
    # Test Data
    # ptv_line: [line1, line2, line3, line4]
    # Actual Data
    ptv_line: [lilydale_to_city, belgrave_to_city, pakenham_to_city, craigieburn_to_city, werribee_to_north_melbourne]

}

shortest_path = ride_ptv(ptv_journey)

# puts "You begin at station #{train_ride[:origin]}"
# puts "You end at station #{train_ride[:destination]}"
puts "This is your best routes to get from #{ptv_journey[:origin]} to #{ptv_journey[:destination]}:"
train_stop = 1
shortest_path.each { |stop|
    puts "#{train_stop} - #{stop}"
    train_stop += 1
}