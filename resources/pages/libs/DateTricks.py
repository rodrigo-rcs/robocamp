from datetime import date

class DateTricks():

    def get_start_date(self):
        today = date.today()

        fdate = today.strftime('%Y-%m-%d')

        print(fdate)

        a_chars = []

        for number in fdate:
            a_chars.append(number)

        return a_chars