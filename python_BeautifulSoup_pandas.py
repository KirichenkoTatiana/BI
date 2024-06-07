#!/usr/bin/env python
# coding: utf-8




from bs4 import BeautifulSoup
import requests
import pandas as pd
url='https://en.wikipedia.org/wiki/List_of_largest_companies_by_revenue'
page = requests.get(url)
soup=BeautifulSoup(page.text,'html')

print(soup)


soup.find_all('table')[0]


table = soup.find_all('table')[0]


soup.find('table', class_ = 'wikitable sortable sticky-header-multi sort-under')


print(table)



world_titles=table.find_all('th')[:10]



world_titles


world_table_title = [title.text.strip() for title in world_titles]


print(world_table_title)



df = pd.DataFrame(columns = world_table_title )



df




column_data=table.find_all('tr')




column_data



for row in column_data[2:]:
    row_data=row.find_all('td')
    individual_row_data = [data.text.strip() for data in  row_data]
    print(individual_row_data)




sample=table.find_all('th')[11:]
table_sample=[' ']+[' ']+[title.text.strip() for title in sample] 




print(table_sample)



for i in table_sample:
        for row in column_data[2:]:
            row_data=row.find_all('td')
            if table_sample.index(i)==column_data.index(row):
               
            
                individual_row_data =[i]+[ data.text.strip() for data in  row_data]
                #print(individual_row_data)
                length = len(df)
                df.loc[length] =individual_row_data 
         




df




df.to_csv(r'C:\Users\38071\Desktop\projects\python_BeautifulSoup_pandas.csv', index=False)



