#!/usr/bin/env python
# coding: utf-8

# In[4]:


import os, shutil
path = str(input('enter the path to the folder where you want the sorting ') )

print("Yors path = " + path)
os.listdir(path)
q = int(input ('How many folders do you need'))
folder_names = {}

for n in range (0,q):
    
    folder = str(input('Folder name ' +  str(n)))
    file_format = str(input('Format in folder with dot ".format" ' + str(n)))
    folder_names[folder]= file_format

#print(folder_names)
def get_key(val):
   
    for key, value in folder_names.items():
        if val == value:
            return key
 
    return "key doesn't exist"

folder_names_list = list(folder_names.keys())
format_names_list = list(folder_names.values())
print(folder_names_list)
print(format_names_list)
#sample 'image files','word files','excel files' ['.png', '.doc', '.xlsx']


for i in range(0,q):
    if not os.path.exists(path + folder_names_list[i]):
        print(path+folder_names_list[i])
        os.makedirs(path + ' ' + folder_names_list[i])

file_name=os.listdir(path)
for file in file_name:
    for formats in format_names_list:
            if str(formats) in file and not os.path.exists(path + ' ' + str(get_key(str(formats))) + "/"+ file):
                shutil.move(path + file,path + ' ' + str(get_key(str(formats))) + "/"+ file)


# In[ ]:




