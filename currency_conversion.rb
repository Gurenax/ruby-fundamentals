#You took a job in Shanghai along with Pat working for a financial services company. Your boss is Chinese (obviously), a bit of a madman, and dislikes the way the West has 'taken over'. He wants you to write a currency exchange method, but each currency must only be compared to the Chinese renminbi. Write some methods, each that take a number representing a currency (let's say Thai baht, or Indonesian rupiah, and whatever you like), and converts each into the number of Chinese renminbi. Now write a method that takes a number, and two strings. Using only the methods you have created, code this last method so that you can specify 'from' and 'to' currencies (string arguments), and a number, and have this return the relevant exchange. For example, you could accept 'vnd' (the Viet dong), 'hkd' (Honky dollar), and a number, and gives the correct exchange for that number given those country parameters. Please store I a w-n variable!

def convert_currency(money, exchange_rate, reversed)
    if reversed == false
        money * exchange_rate
    else
        money / exchange_rate
    end
end

def exchange_money(exchange_rate_data, from_currency, to_currency, money)

    exchange_rate = 0
    result = 0

    # Loop each exchange rate data
    exchange_rate_data.each { |exchange|

        # Check if from_currency and to_currency matches a record in exchange rate data
        if from_currency==exchange[:from_currency] and to_currency==exchange[:to_currency]  # Normal
            exchange_rate = exchange[:exchange_rate]
            result = convert_currency(money, exchange_rate, false)
            break
        elsif from_currency==exchange[:to_currency] and to_currency==exchange[:from_currency]   # Reversed
            exchange_rate = exchange[:exchange_rate]
            result = convert_currency(money, exchange_rate, true)
            break
        end
    }
    result
end

exchange_rate_data = [
    {   # 1 Thai Baht = 0.20 Chinese Renminbi
        from_currency: "thb",
        to_currency: "cny",
        exchange_rate: 0.20
    },
    {   # 1 Viet Dong = 0.00034 Hongkong Dollar
        from_currency: "vnd",
        to_currency: "hkd",
        exchange_rate: 0.00034
    }
]

# Should output 20.0
p exchange_money(exchange_rate_data, "thb","cny", 100)

# Should output 100.0
p exchange_money(exchange_rate_data, "cny","thb", 20)

# Should output 0.034
p exchange_money(exchange_rate_data, "vnd","hkd", 100)

# Should output 100.0
p exchange_money(exchange_rate_data, "hkd","vnd", 0.034)

# Should output 0 since AUD to PHP is not on the list
p exchange_money(exchange_rate_data, "aud","php", 500)
