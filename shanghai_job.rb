#You took a job in Shanghai along with Pat working for a financial services company. Your boss is Chinese (obviously), a bit of a madman, and dislikes the way the West has 'taken over'. He wants you to write a currency exchange method, but each currency must only be compared to the Chinese renminbi. Write some methods, each that take a number representing a currency (let's say Thai baht, or Indonesian rupiah, and whatever you like), and converts each into the number of Chinese renminbi. Now write a method that takes a number, and two strings. Using only the methods you have created, code this last method so that you can specify 'from' and 'to' currencies (string arguments), and a number, and have this return the relevant exchange. For example, you could accept 'vnd' (the Viet dong), 'hkd' (Honky dollar), and a number, and gives the correct exchange for that number given those country parameters. Please store I a w-n variable!

def convert_currency(money, exchange_rate)
    money * exchange_rate
end

def exchange_money(from_currency, to_currency, money)

    exchange_rate = 0

    
    if from_currency=="thb" and to_currency=="cny" # 1 Thai Baht = 0.20 Chinese Renminbi
        exchange_rate = 0.20

    elsif from_currency=="vnd" and to_currency=="hkd" # 1 Viet Dong = 0.00034 Hongkong Dollar
        exchange_rate = 0.00034

    end

    convert_currency(money, exchange_rate)
end


one_hundred_thb_to_cny = exchange_money("thb","cny", 100)
one_hundred_vnd_to_hkd = exchange_money("vnd","hkd", 100)

p one_hundred_thb_to_cny
p one_hundred_vnd_to_hkd