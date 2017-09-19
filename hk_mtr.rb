# Using some part of the HK MTR, write a method that takes one argument, a hash within which there are three keys: two which are strings (an origin station, and a destination station), and one which is an array. Choose part of a line from the MTR (or other rail network) as dummy data for the array. The method should return a hash that contains two keys: an origin index, and a destination index. These keys should be given the value of the index of the string the array if those stations are in the station array, or nil if not.

def hk_mtr(data)
    result = {
        origin: find_string_in_array(data[:mtr_line],data[:origin]),
        destination: find_string_in_array(data[:mtr_line],data[:destination])
    }
end

def find_string_in_array(array, str)
    array.index(str)
end


mtr_ticket = {
    origin: "Kennedy Town",
    destination: "Chai Wan",
    mtr_line: ["Kennedy Town", "HKU", "Sai Ying Pun", "Sheung Wan", "Central", "Admiralty",
        "Wan Chai", "Causeway Bay", "Tin Hau", "Fortress Hill", "North Point", "Quarry Bay",
        "Tai Koo", "Sai Wan Ho", "Shau Kei Wan", "Heng Fa Chuen", "Chai Wan"]
}

p hk_mtr(mtr_ticket)