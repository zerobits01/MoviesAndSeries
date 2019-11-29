'''
    author : zerobits01
    date : 30-11-2019 00:00
    to run : 
        > pip install PyQt5 
        > python3 pydb_qt5.py
'''

import sys
from PyQt5.QtWidgets import QApplication, QWidget, QLabel, QGridLayout, QPushButton,QLineEdit,QListView
from PyQt5.QtGui import QIcon
from PyQt5.QtCore import pyqtSlot
from PyQt5 import  QtGui, QtCore
import pyodbc 

# db connetion
conn = pyodbc.connect('Driver={SQL Server};'
                      'Server=localhost;'
                      'Database=UI964;'
                      'Trusted_Connection=yes;')

# creating the cursor
cursor = conn.cursor()


# queries , later using .format
select_query = 'SELECT * FROM students'
insert_query = """ INSERT into students(id,sname,average)
    VALUES({id},'{sname}',{average})
"""
update_query = """ UPDATE students
    set sname = case 
        when '{sname}' = '' then sname else '{sname}' end
    where id={id};
    UPDATE students
    set average = case 
        when {average} is not NULL then {average} else average end
    where id={id}
"""
delete_query = 'DELETE from students where id={id}'


# defining basics
app = QApplication(sys.argv)
win = QWidget()
grid = QGridLayout()
listView = QListView()


# all list view makeing it a method
def load_data():
    cur = cursor.execute(select_query)
    entry = QtGui.QStandardItemModel()
    listView.setModel(entry)
    for row in cur:
        it = QtGui.QStandardItem(row.__str__())
        entry.appendRow(it)

id_lbl = QLabel('id : ')
sname_lbl = QLabel('sname : ')
average_lbl = QLabel('average : ')
id_tbox = QLineEdit()
id_tbox.resize(280,40)
sname_tbox = QLineEdit()
sname_tbox.resize(280,40)
average_tbox = QLineEdit()
average_tbox.resize(280,40)

# buttons on_click
def on_click_insert():
    stid = id_tbox.text() 
    stsname = sname_tbox.text() 
    staverage = average_tbox.text()
    print(insert_query.format(id=stid,sname=stsname,average=staverage)) 
    cursor.execute(insert_query.format(id=stid,sname=stsname,average=staverage))
    load_data()
    id_tbox.setText("")
    sname_tbox.setText("")
    average_tbox.setText("")

def on_click_update():
    stid = id_tbox.text() 
    stsname = sname_tbox.text() 
    staverage = average_tbox.text() 
    cursor.execute(update_query.format(id=stid,sname=stsname,average=staverage))
    load_data()
    id_tbox.setText("")
    sname_tbox.setText("")
    average_tbox.setText("")

def on_click_select():
    load_data()
    
def on_click_delete():
    stid = id_tbox.text()
    cursor.execute(delete_query.format(id=stid))
    load_data()
    id_tbox.setText("")

# button defintions for insert delete update and select
update = QPushButton('update')
update.clicked.connect(on_click_update)
delete = QPushButton('delete')
delete.clicked.connect(on_click_delete)
insert = QPushButton('insert')
insert.clicked.connect(on_click_insert)
select = QPushButton('select')
select.clicked.connect(on_click_select)

# adding to gridview
grid.addWidget(id_lbl,0,0);grid.addWidget(id_tbox,0,1)
grid.addWidget(sname_lbl,1,0);grid.addWidget(sname_tbox,1,1)
grid.addWidget(average_lbl,2,0);grid.addWidget(average_tbox,2,1)
grid.addWidget(update,3,0);grid.addWidget(insert,3,1)
grid.addWidget(delete,4,0);grid.addWidget(select,4,1)
grid.addWidget(listView,5,0)
win.setLayout(grid)

# setting up window
win.setWindowTitle("DBLAB_LAST MohammadMorad 963613085")
win.setGeometry(50,50,400,400)


# showing the app
def window():
    win.show()
    load_data()
    sys.exit(app.exec_())


# running as main script
if __name__ == '__main__':
   window()