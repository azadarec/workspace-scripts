import requests
import psycopg2

### DBINFO 
HOST = 'localhost'
DATABASE = ""
USERNAME = ''
PASSWORD =  ''


url = 'https://restcountries.com/v3.1/all'
db = None
country_codes = list()
found =  list()

# API stuff

def get_country_code(name): 
    global country_codes

    for country in country_codes: 
        if name == country['name'] or name == country['official']: 
            found.append(country)


try: 
    r = requests.get(url)
    for value in r.json(): 
         common_name = value['translations']['deu']['common']
         official_name = value['translations']['deu']['common']
         short = value['cca2']
        #  print(value['translations']['deu']['common'] + ": " + value['cca2'] )
         country_codes.append({'official': official_name, 'name': common_name, 'code': short})

except Exception as error: 
    print("error")
    print(error)


try: 
    db = psycopg2.connect(
        host=HOST,
        database=DATABASE,
        user=USERNAME,
        password=PASSWORD
    )


    cur = db.cursor()
    
    cur.execute("SELECT DISTINCT country FROM countries")

    for record in cur: 
        get_country_code(record[0])

except (Exception) as error: 
    print(error)
finally: 
    if db is not None: 
        db.close
        print('Connection closed')

print('found ' + str(len(found)) + ' codes')

with open('./output.sql', 'w') as f: 
    for country in found: 
        code_str='\''+country['code']+'\''
        name_str='\''+country['name']+'\''
        f.write('INSERT INTO iso_codes (code, name) VALUES(' + code_str + ',' + name_str + ');\n')