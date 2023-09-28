import requests 
from bs4 import BeautifulSoup
from pony import orm
from datetime import datetime

db = orm.Database()
db.bind(provider = 'sqlite', filename = 'products.db', create_db = True)

class Product(db.Entity):
    supermarket = orm.Required(str)
    name = orm.Required(str)
    price = orm.Required(float)
    created_date = orm.Required(datetime)


db.generate_mapping(create_tables= True)


def continente(session):
    url = "https://www.continente.pt/produto/hamburguer-de-bovino-alto-continente-5606345.html"
    resp = session.get(url)
    soup = BeautifulSoup(resp.text, 'html.parser')
    str = sanitize_price((soup.select_one('span.ct-price-formatted ').text).replace('\n', ''))
    name =  sanitize_title (soup.find('h1', {'class' : 'pwc-h3 col-h3 product-name pwc-font--primary-extrabold mb-0'}).text)
   

    data = (
            
            "Continente",
            name,
            float(str),
    )
    return data


def auchan(session):
    url = "https://www.auchan.pt/pt/alimentacao/congelados/carne/hamburgueres/hamburguers-auchan-100-bovino-10un-1kg/2271710.html"
    resp = session.get(url)
    soup = BeautifulSoup(resp.text, 'html.parser')
    str = sanitize_price((soup.select_one('span.value ').text).replace('\n', ''))
    name = sanitize_title (soup.find('h1', {'class' : 'product-name auc-hero-title'}).text)
   

    data = (
            "Auchan",
            name, 
            float(str),
    )
    return data

def sanitize_price(str):

    str = str.replace("'", '')
    str = str.replace('€', '')
    str = str.replace(',', '.')

    return str

def sanitize_title(str):
    str = str.replace("\n", '')


    return str
        

def main():
    
    session = requests.Session()
    session.headers.update({
        'User-agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.42'

    })

    data = {

        continente(session),
        auchan(session)
    }
 

    with orm.db_session:
        for item in data:
            Product(supermarket  = item[0], name = item[1], price = item[2], created_date = datetime.now())
if __name__ == '__main__':
    main()
    

