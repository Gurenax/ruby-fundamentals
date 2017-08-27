# Your shop sells bespoke solid wood right-angled-triangular tables (because you are a hipster). The client is charged for the volume of the table. Write a function that takes two arguments,  and works out the area of the triangle. Write a second function that takes two arguments, one representing the area of the top of the table, and the other representing the height (from the ground) and returns the volume. Write a third method that performs no calculations, but takes three arguments and uses the previous two methods to return the volume of the table. Store that volume in a well-named variable.

def area_of_triangle(base, height)
    ( height * base ) / 2.0
end

def volume_of_table (area_of_table_top, height_from_grouund)
    area_of_table_top * height_from_grouund
end

def calculate_volume_of_hipster_table(base_of_triangle, height_of_triangle, width_of_table)
    area = area_of_triangle(base_of_triangle, height_of_triangle)
    volume = volume_of_table( area, width_of_table )
end

volume_of_hipster_table = calculate_volume_of_hipster_table(4, 3, 10)
p volume_of_hipster_table